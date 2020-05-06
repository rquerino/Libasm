section		.text
global		_ft_read

; system call code table for linux: https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; int ft_read(int fd, void *buf, size_t nbyte);
; fd = rdi, buff = rsi, size_t = rdx

_ft_read:
			cmp		edi, 0				;	Compares edi(lowest 32-bits of RDI) with 0. (fd < 0, unexisting file)
			jl		ret_error			;	Jump if Less. Calls for ret_error procedure.
			cmp		rsi, 0				;	Compares rsi with 0. Check if buffer is NULL/doesn't have memory allocated.
			je		ret_error			;	Jump if Equal. Calls for ret_error procedure.
			cmp		rdx, 0				;	Compares rdx with 0. Check if nbyte in parameters is not 0.
			je		ret_size			;	Jump if Equal. Calls for ret_size procedure.

			mov		rax, 0x02000003		;	declaring rax = 0x02000003. System call for read. (0 for linux)
			syscall						;	invoke operating system to read
			ret							;	Return from procedure
ret_error:
			mov		rax, -1				;	Declares rax = -1 (Error). RAX receives the values to return.
			ret							;	Return from procedure
ret_size:
			mov		rax, 0				;	Declares rax = 0 (nbyte = 0). RAX receives the values to return.
			ret							;	Return from procedure