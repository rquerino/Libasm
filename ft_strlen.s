section	.text
		global _ft_strlen

_ft_strlen:
		mov		rax, -1					;	Declare rax = -1. The return values are stored in RAX.
compare_loop:
		inc		rax						;	Increments rax. (rax++)
		cmp		BYTE [rdi + rax], 0		;	Compares rdi[rax] with '\0'. (0 = ascii '\0'). The same as (str[i] == '\0').
		je		finish					;	JE = Jump if Equal. If it's the end, call finish procedure.
		jne		compare_loop			;	JNE =  Jump if Not Equal. Call for compare loop.
finish:
		ret								;	Return from procedure