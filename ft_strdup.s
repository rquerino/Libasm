section	.text
global	_ft_strdup
extern  _malloc
extern  _ft_strlen
extern  _ft_strcpy

; char *ft_strdup(const char *str);
; str = rdi

_ft_strdup:
		push	rdi						;	Saves rdi value on stack, rdi be overwritten when malloc is called.
		call	_ft_strlen				;	RAX receives result of ft_strlen(rdi)
		inc		rax						;	Increments rax because the end has a '\0'. (rax++).

		mov		rdi, rax				;	Declares rdi = rax + 1. Puts the size of rax + 1(strlen + '\0') in rdi to use malloc.
		call	_malloc					;	Call malloc function: malloc(rdi).
		cmp		rax, 0					;	Compares rax(result of malloc) to 0.
		je		empty					;	If the result is empty, calls for empty procedure.

		pop		rsi						;	Moves the value stored in stack to rsi. Gets the original string to use on ft_strcpy
		mov		rdi, rax				;	Declares rdi = rax. Puts the allocated result of malloc inside rdi.
		call	_ft_strcpy				;	Calls the function ft_strcpy(rdi = dst, rsi = src).
		ret								;	Return from the procedure
empty:
		pop		rdi						;	Moves the value stored in stack to rdi. Rax is empty.
		ret								;	Return from the procedure