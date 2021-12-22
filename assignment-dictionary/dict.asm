section .text
extern string_equals
global find_word


; Указатель на нуль-терминированную строку.
; Указатель на начало словаря.
; Если подходящее вхождение найдено, вернёт адрес начала вхождения в   словарь (не значения), иначе вернёт 0.

find_word:
	xor rax, rax ;

.loop: 
	cmp rsi, 0 ; проверяем словарь на пустоту 
	je .end ;
	push rsi ;
	push rdi ;
	add rsi, 8; берем ключ и сравниваем со строкой
	call string_equals ; сравниваем ключ и 
	pop rdi ; 
	pop rsi ;
	cmp rax, 1 ;если равны, переходим на found
	je .found ;
	mov rsi, [rsi]; если не равны, переходим на следующий элемент
	jmp .loop

.end:
	xor rax, rax ;
	ret

.found:
	mov rax, rsi 
	ret
