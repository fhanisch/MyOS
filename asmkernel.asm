;ld -m elf_i386 -T link.txt -o kernel.bin

BITS 32

extern main
global start

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

isr_key:
	mov byte [0xb8000+156], 'T'
	mov byte [0xb8000+157], 4
	mov al,0x20
	out 0x20,al
	iret

idt:
	ilimit	dw  0
	ibase	dd  0
