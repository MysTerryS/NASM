%include "stud_io.inc"

section .data

a	dd 120
b	dd 30
c	dd -70
min	dd 0
max	dd 0

section .text

global _start

_start:

mov	eax, [a]
mov	ebx, [b]
mov	ecx, [c]
cmp	eax, ebx

jns	CompareResAbiggerB
jz	CompareResAbiggerB
js	CompareResBbiggerA

continue:

mov	dword [min], edx
mov	dword [max], edi

xor	eax, eax
xor	ebx, ebx
xor	ecx, ecx
xor	edx, edx
xor	edi, edi

FINISH

CompareResAbiggerB:

cmp	eax, ecx

jns	CompareResAbiggerC
jz	CompareResAbiggerC
js	CompareResCbiggerA

CompareResAbiggerC:

mov	edi, eax
mov	eax, ebx
cmp	eax, ecx

jns	CompareResBbiggerC
jz	CompareResBbiggerC
js	CompareResCbiggerB

CompareResBbiggerC:

mov	edx, ecx
jmp	continue

CompareResCbiggerB:

mov	edx, ebx
jmp	continue

CompareResCbiggerA:

mov	edi, ecx
mov	edx, ebx
jmp	continue

CompareResBbiggerA:

mov	edi, eax
mov	eax, ebx
cmp	eax, ecx

jns	CompareResBbiggerCelse
jz	CompareResBbiggerCelse
js	CompareResCbiggerBelse

CompareResBbiggerCelse:

mov	eax, edi
mov	edi, ebx
cmp	eax, ecx

jns	CompareResAbiggerCelse
jz	CompareResAbiggerCelse
js	CompareResCbiggerAelse

CompareResAbiggerCelse:

mov	edx, ecx
jmp	continue

CompareResCbiggerAelse:

mov	edx, eax
jmp	continue

CompareResCbiggerBelse:

mov	eax, edi
mov	edi, ecx
mov	edx, eax
jmp	continue
