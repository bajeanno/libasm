global ft_read
extern __errno_location

section .text

ft_read:
	; rdi -> filedes
	; rsi -> buffer
	; rdx -> nbyte

	mov rax, 0
	syscall
	cmp rax, 0
	jl .error
	ret

.error:
    push rsi
    push rdi
	neg rax
	mov rsi, rax
	call __errno_location wrt ..plt
	mov [rax], rsi
	mov rax, -1
	pop rdi
	pop rsi
	ret
