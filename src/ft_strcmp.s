global ft_strcmp

section .text

ft_strcmp:
	; rdi -> string1 pointer
	; rsi -> string2 pointer
	push rsi
	push rdi
.compare:
	mov al, byte [rdi]
	mov cl, byte [rsi]
	cmp al, cl
	jne .done
	cmp al, 0
	je .done
	inc rdi
	inc rsi
	jmp .compare

.done:
	sub al, cl
	movsx rax, al
	
	pop rdi
	pop rsi
	ret