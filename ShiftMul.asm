%include "stud_io.inc"

section .data

dgt	dd 0
a	dd 0
b	dd 0
c	dd 0

section .text

global _start

_start:

mov	eax, 25
mov	ebx, 80
jmp	digit
cnt1	mov	cl, [dgt]
	jmp	mlt
cnt2	xor	cl, cl
	xor	ebx, ebx

FINISH

digit:	mov	ecx, 2
	mov	dword [a], eax
	mov	eax, ebx
	mov	dword [b], eax
	rept1	div	ecx
		xor	edx, edx
		inc	dword [dgt]
		cmp	eax, 0
		jnz	rept1
	mov	eax, [a]
	mov	ebx, [b]
	xor	ecx, ecx
	mov	dword [a], ecx
	mov	dword [b], ecx
	jmp	cnt1

mlt:	dec	dword [dgt]
	mov	dword [c], 2
	mov	[b], eax
	mov	eax, ebx
	rept2	div	dword [c]
		cmp	edx, 1
		jz	shft
	cnt3	add	[a], edx
		xor	edx, edx
		dec	dword [dgt]
		cmp	eax, 0
		jnz	rept2
	mov	eax, [a]
	xor	edx, edx
	mov	dword [a], edx
	mov	dword [b], edx
	mov	dword [c], edx
	jmp	cnt2

shft:	xor	edx, edx
	mov	edx, [b]
	mov	cl, [dgt]
	shl	edx, cl
	jmp	cnt3
