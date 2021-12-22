section .data
%include "words.inc"

msg: db "No such word", 10, 0  
msg2: db "read error", 10, 0

section .text

extern find_word
extern read_word_fix 
extern error_found 
extern string_length
extern print_string
extern exit
extern print_newline

global _start

_start:
	push rbp;
    mov rbp, rsp
	sub rsp, 255 ; делаем буфер
	mov rdi, rsp ; кладем в аргумент адрес буфера
	mov rsi, 255 ; кладем размер буфера
	call read_word_fix ; читаем слово в буфер
	cmp rax, 0 ; если слово больше буфера, то
	je .overflow ; то переходим на overflow
	mov rdi, rax ; кладем адрес слова в аргумент 
	mov rsi, last_elem; кладем адрес начала словаря в другой аргумент 
	call find_word ; ищем слово
    push rax
    call print_newline
    pop rax
	cmp rax, 0 ; если слова нет, то
	je .not_found
	add rax, 8 ; пропускаем метку
	push r12 
	mov r12, rax
	mov rdi, rax
	call string_length ; считаем длину ключа
    inc rax
	add rax, r12 ; пропускаем и ключ, и метку
	pop r12
	mov rdi, rax
	call print_string
    jmp .end
.not_found:
	mov rdi, msg
	call error_found
    jmp .end
.overflow:
    mov rdi, msg2
	call error_found
    jmp .end
.end:
    mov rsp, rbp
    pop rbp
    call exit
