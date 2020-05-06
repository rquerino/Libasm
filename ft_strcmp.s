section	.text
global	_ft_strcmp

; https://cs.lmu.edu/~ray/notes/nasmtutorial/
; From left to right, pass as many parameters as will fit in registers. The order in which registers are allocated, are:
; For integers and pointers, rdi, rsi, rdx, rcx, r8, r9.

; JN, JZ, JE, JNE: http://faydoc.tripod.com/cpu/jne.htm

; int ft_strcmp(const char *s1, const char *s2);
; s1 = rdi, s2 = rsi, i = rdx, temp = rcx

_ft_strcmp:
		mov		rdx, -1					;	Declare rdx = -1. (i = rdx)
		mov		rcx, 0					;	Declare rcx = 0. (temp = rcx)
compare_loop:
		inc		rdx						;	Increments rdx. (rdx++)
		cmp		BYTE [rdi + rdx], 0		;	Compares rdi[rdx] with '\0', 0 is ascii of '\0'. (s1[i] == '\0')
		je		finish					;	JE = Jump if Equal. If it's the end, call finish procedure.
		
		mov		cl, BYTE [rdi + rdx]	;	Declares CL = rdi[rdx]. CL is the lowest 8-bits of RCX. (temp = s1[i])
		cmp		cl, BYTE [rsi + rdx]	;	Compares CL to rsi[rdx]. (temp == s2[i])
		je		compare_loop			;	JE = Jump if Equal. If the strings are still equal, call compare_loop.
finish:
		mov		cl, BYTE [rdi + rdx]	;	Declares cl = rdi[rdx]. (tmp = s1[i])
		sub		cl, BYTE [rsi + rdx]	;	Subtracts cl -= rsi[rdx]. (tmp -= s2[i])
		cmp		cl, 0					;	Compares the value of al and 0. (tmp == 0). (>0 = 1, 0 = 0, <0 = -1)
		je		ret_equal				;	JZ = Jump if Equal. If (s1[i] - s2[i]) == 0, calls ret_equal
		jg		ret_bigger				;	JA = Jump if Greater. If (s1[i] - s2[i]) > 0, calls ret_bigger
ret_smaller:
		mov		rax, -1					;	Declares rax = -1. Return values go in RAX. (return -1)
		ret								;	Return from the procedure
ret_equal:
		mov		rax, 0					;	Declares rax = 0. Return values go in RAX. (return 0)
		ret								;	Return from the procedure
ret_bigger:
		mov		rax, 1					;	Declares rax = 1. Return values go in RAX. (return 1)
		ret								;	Return from the procedure