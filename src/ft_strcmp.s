global ft_strcmp

section .text

ft_strcmp:
	; rdi -> string1 pointer
	; rsi -> string2 pointer
.compare:
	movzx eax, byte [rdi]
	movzx ecx, byte [rsi]
	cmp eax, ecx
	jne .done
	cmp eax, 0
	je .done
	inc rdi
	inc rsi
	jmp .compare

.done:
	sub eax, ecx
	ret