global ft_strcpy

section .text

ft_strcpy:
; copy rsi in rdi
	mov rax, rdi
.compare_and_copy:
	cmp byte [rsi], 0
	je .done
	mov [rdi], [rsi]
	inc rdi
	inc rsi
	jmp .compare_and_copy

.done:	
	ret