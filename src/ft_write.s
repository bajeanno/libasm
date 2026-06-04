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
    push rsi
	neg rax
	mov rsi, rax
	call __errno_location wrt ..plt
	mov [rax], rsi 
	mov rax, -1
	pop rsi
	ret
