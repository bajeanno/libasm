extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

section .text

ft_strdup:
	; rdi -> source string to duplicate
	push rsi
	push rdi

	call ft_strlen
	mov rdi, rax
	inc rdi

	call malloc wrt ..plt
	test rax, rax
	je .fail
	mov rdi, rax
	
	pop rsi
	push rsi
	call ft_strcpy
	pop rdi
	pop rsi

.fail:
	ret