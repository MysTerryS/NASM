%include "stud_io.inc"

section .data

a	db 0x0

section .text

global _start

_start:

mov	al, 0xaf	; A<-0A
mov	bl, 0xbd	; B<-1D
mov	byte [a], 0x8c	; [a]<-2E
mov	cl, 0x0		; C<-00
add	al, bl		; A<-A+B
mov	bl, al		; B<-A
jnc	act1
act1:	mov	al, 0x0	; A<-00
adc	al, cl		; A<-A+C+[CF]
mov	cl, al		; C<-A
mov	al, bl		; A<-B
add	al, [a]		; A<-A+[a]
mov	bl, al		; B<-A
jnc	act2
act2:	mov	al, 0x0	; A<-00
adc	al, cl		; A<-A+C+[CF]
xor	cl, cl		; C<-00
mov	[a], cl		; [a]<-C

FINISH
