;ld -m elf_i386 -T link.txt -o kernel.bin

BITS 32

extern main
extern irq1
global start
global getkey

start:
	;Adressen der ISR in die IDT eintragen
	sidt [idt]
	mov dword eax,[ibase]
	add eax,256+1*8
	mov ebx,isr_key
	mov word [eax],bx

	;Interrupts maskieren
	mov     al,11111101b	;nur Keyboard Interrupts zulassen
	out     0x21,al
	mov     al,11111111b
	out     0xa1,al

	sti			;Interrupts zulassen
	call main	;Sprung in den C-Kernel

loop:
	jmp loop

isr_key:
	push eax
	xor eax, eax
	in	al, 0x60
	push eax
	call irq1
	mov al,0x20
	out 0x20,al
	pop eax
	pop eax
	iret

getkey:
	push ebp
	mov ebp, esp
	push eax
	push ebx
	mov eax,[ebp+8]
gk:	mov ebx,[eax]
    cmp ebx,1
	jnz gk
	pop ebx
	pop eax
	pop ebp
	ret

idt:
	ilimit	dw  0
	ibase	dd  0
