%include "stud_io.inc"

section .data

n	dd 25
sum	dd 0

section .text

global _start

_start:

mov	ecx, 1

repeat:

mov	eax, [n]
js	EarlyExit
div	ecx
cmp	edx, 0
jz	IncreaseNumbers

continue:

xor	edx, edx
inc	ecx
cmp	dword [n], ecx
jnz	repeat

jmp	Exit

EarlyExit:

mov	dword [sum], -1
jmp	Exit

Exit:

xor	eax, eax
xor	ecx, ecx

FINISH

IncreaseNumbers:

add	dword [sum], ecx
jmp	continue
