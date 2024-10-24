%include "stud_io.inc"

section .data

a	dd 0

section .text

global _start

_start:

mov	dword [a], 10
mov	eax, 1
cmp	dword [a], 0
jz	continue
mov     ecx, 0
repeat  inc ecx
mul     ecx
cmp     [a], ecx
jnz     repeat
continue	FINISH
