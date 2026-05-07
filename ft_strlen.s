global _ft_strlen

section .text

_ft_strlen:
	mov rax, rdi

.L1:
	cmp byte [rax], 0
	je .L2
	inc rax
	jmp .L1

.L2:
	sub rax, rdi
	ret
