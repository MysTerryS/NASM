%include "stud_io.inc"

section .data

a	dd 10

section .text

global _start

_start:

mov	ebx, 1
mov	ecx, 1
mov	eax, ebx
cmp	dword [a], 2
js	svd
jz	svd
sub	dword [a], 2
rpt:	add	eax, ecx
	mov	ecx, ebx
	mov	ebx, eax
	dec	dword [a]
	jnz	rpt
mov	dword [a], eax
continue	xor	eax, eax
		xor	ebx, ebx
		xor	ecx, ecx

FINISH

svd:	mov	dword [a], eax
jmp	continue
