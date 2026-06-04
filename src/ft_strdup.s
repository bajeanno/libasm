extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

section .text

ft_strdup:
	; rdi -> source string to duplicate
	push rbx
	mov rbx, rdi

	call ft_strlen
	mov rdi, rax
	inc rdi

	call malloc wrt ..plt
	test rax, rax
	je .fail

	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy

.fail:
	pop rbx
	ret
	