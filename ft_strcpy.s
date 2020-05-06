section	.text
global	_ft_strcpy

; https://cs.lmu.edu/~ray/notes/nasmtutorial/
; From left to right, pass as many parameters as will fit in registers. The order in which registers are allocated, are:
; For integers and pointers, rdi, rsi, rdx, rcx, r8, r9.

; char *ft_strcpy(char *dst, const char *src);
; dst = rdi, src = rsi, i = rdx, temp = rcx

_ft_strcpy:
		mov		rdx, -1					;	Declare rdx = -1. (i = rdx)
		mov		rcx, 0					;	Declare rcx = 0. (temp = rcx)
copy_loop:
		inc		rdx						;	Increments rdx. (rdx++)
		mov		cl, BYTE [rsi + rdx]	;	Declares CL = rsi[rdx]. CL is the lowest 8-bits of RCX. (temp = src[i])
		mov		BYTE [rdi + rdx], cl	;	Declares rdi[rdx] = CL. (dst[i] = temp)
		
		cmp		BYTE [rsi + rdx], 0		;	Compares rsi[rdx] with '\0', 0 is ascii of '\0'. (src[i] == '\0')
		je		finish					;	JE = Jump if Equal. If it's the end, call finish procedure.
		jne		copy_loop				;	JNE =  Jump if Not Equal. Call for copy loop.
finish:
		mov		rax, rdi				;	Declares rax = rdi. Return values go in RAX. (return dst)
		ret								;	Return from the procedure