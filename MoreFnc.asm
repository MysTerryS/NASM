%include "stud_io.inc"

section .data

a	dd 30

section .text

global _start

_start:

mov	eax, [a]
mov	dword [a], 47
mov	ebx, eax

cmp	eax, [a]
js	am

am:
add	eax, [a]

mov	ecx, eax
mov	eax, ebx

cmp	eax, [a]
jz	am

mov	ecx, eax
mov	eax, ebx

cmp	eax, [a]
jns	sm

sm:
sub	eax, [a]

mov	ecx, eax

mov	ebx, eax
xor	eax, eax
xor	ecx, ecx
mov	[a], eax

FINISH
