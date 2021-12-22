section .data
s: db "masha", 0

section .text

global _start

%include "lib.inc" 

_start:

mov rdi, s
sub rsp, 6
mov rsi, rsp
mov rdx, 6
call string_copy

mov rdi, rsp
call print_string 
call print_newline
add rsp, 6
call exit
