global ft_strcpy

section .text

ft_strcpy:
	; rdi -> destination string pointer
	; rsi -> source string pointer
	push rdi
	push rsi
	mov rax, rdi

.compare_and_copy:
	mov cl, byte [rsi]
	mov byte [rdi], cl
	cmp byte [rsi], 0
	je .done
	inc rdi
	inc rsi
	jmp .compare_and_copy

.done:
    pop rsi
    pop rdi
	ret
