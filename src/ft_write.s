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
	push rbx
	neg eax
	mov ebx, eax
	call __errno_location wrt ..plt
	mov dword [rax], ebx
	mov rax, -1
	pop rbx
	ret
