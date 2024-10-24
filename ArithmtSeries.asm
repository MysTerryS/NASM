%include "stud_io.inc"

section .data

d	dd 3
a1	dd 5
n	dd 30

section .text

global _start

_start:

mov	eax, [a1]
mov	ebx, eax

dec	dword [n]

rpt	add	eax, [d]
add	ebx, eax
dec	dword [n]
jnz	rpt

FINISH
