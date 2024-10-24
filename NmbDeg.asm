%include "stud_io.inc"

section .text

global _start

_start:

mov	eax, 2
mov	ebx, 30
cmp	ebx, 0
jz	act1
jl	act2
jg	act3

continue	xor	ecx, ecx
		xor	ebx, ebx
FINISH

act1:	mov	eax, 1
jmp	continue

act2:	mov	eax, 0
jmp	continue

act3:	mov	ecx, eax
	rept	cmp	ebx, 1
		jz	continue
		mul	ecx
		dec	ebx
		jnz	rept
	jmp	continue
