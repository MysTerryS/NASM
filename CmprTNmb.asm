%include "stud_io.inc"

section .data

a	dd 30
b	dd -50
min	dd 0
max	dd 0

section .text

global _start

_start:

mov	eax, [b]
mov	ebx, [a]
cmp	eax, ebx

js	CopyResAsmallestB
jns	CopyResBsmallestA
jz	CopyResBsmallestA

continue:

mov	dword [min], ecx
mov	dword [max], edx
xor	eax, eax
xor	ebx, ebx
xor	ecx, ecx
xor	edx, edx
FINISH

CopyResAsmallestB:

mov	ecx, eax
mov	edx, ebx
jmp	continue

CopyResBsmallestA:

mov	ecx, ebx
mov	edx, eax
jmp	continue
