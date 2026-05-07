global ft_strlen

section .text

ft_strlen:
	mov rax, rdi

.compare:
	cmp byte [rax], 0
	je .done
	inc rax
	jmp .compare

.done:
	sub rax, rdi
	ret
