global ft_write
extern __errno_location

section .text

ft_write:
	; rdi -> filedes
	; rsi -> buffer
	; rdx -> nbyte

	mov rax, 1
	syscall
	cmp rax, 0
	jl .error
	ret

.error:
	neg rax
	mov rsi, rax
	call __errno_location wrt ..plt
	pop rdi
	mov [rax], rdi
	mov rax, -1
	ret
