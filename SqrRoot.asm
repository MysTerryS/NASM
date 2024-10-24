%include "stud_io.inc"

section .data

a	dd 0

section .text

global _start

_start:

mov	dword [a], 625	; [a]<-00000121
mov	eax, 0		; A<-00000000
mov	ecx, eax	; C<-A
repeat	inc	ecx	; C<-C+1
mov	eax, ecx	; A<-C
mov	ebx, eax	; B<-A
mul	ebx		; A<-A*B
cmp	[a], eax	; [a]-A
jnbe	repeat
cmp	[a], eax	; [a]-A
jnz	res
continue	mov	eax, ecx	; A<-C
		xor	ebx, ebx	; B<-00000000
		xor	ecx, ecx	; C<-00000000

FINISH

res:	dec	ecx
	jmp	continue
