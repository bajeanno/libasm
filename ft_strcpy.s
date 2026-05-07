global _ft_strcpy

section .text

_ft_strcpy:
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
	ret










