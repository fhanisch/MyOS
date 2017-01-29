;ld -m elf_i386 -T link.txt -o kernel.bin

BITS 32

extern main
extern irq1
extern irq8
global start
global getkey
global inport
global outport

start:
	;Adressen der ISR in die IDT eintragen
	sidt [idt]
	mov dword eax,[ibase]
	add eax,256+1*8
	mov ebx,isr_key
	mov word [eax],bx

	mov dword eax,[ibase]
	add eax,256+8*8
	mov ebx,isr_clock
	mov word [eax],bx

	;CMOS Echtzeituhr programmieren
	mov al,0x0a
	out 0x70,al
	in al,0x71
	mov bl,al
	or bl,0x0f
	mov al,0x0a
	out 0x70,al
	mov al,bl
	out 0x71,al

	mov al,0x0b
	out 0x70,al
	in al,0x71
	mov bl,al
	or bl,0x40
	mov al,0x0b
	out 0x70,al
	mov al,bl
	out 0x71,al

	;Interrupts maskieren
	mov     al,11111001b	;nur Keyboard Interrupts zulassen
	out     0x21,al
	mov     al,11111110b
	out     0xa1,al

	sti			;Interrupts zulassen
	call main	;Sprung in den C-Kernel

loop:
	jmp loop

isr_key:
	pushad
	xor eax, eax
	in	al, 0x60
	push eax
	call irq1
	add esp, 4
	mov al,0x20
	out 0x20,al
	popad
	iret

isr_clock:
	pushad
	call irq8
	;CMOS Statusregister 0x0c muss augelesen werden um den Interrupt wieder freizugeben!
	mov al,0x0c
	out 0x70,al
	in al,0x71
	;End Of Interrupt an beide PICs senden!
	mov al,0x20
	out 0x20,al
	out 0xa0,al
	popad
	iret

;void getkey(char*)
getkey:
	push ebp
	mov ebp, esp
	push eax
	push ebx
	mov eax,[ebp+8]
gk:	mov bl,[eax]
	cmp bl,1
	jnz gk
	pop ebx
	pop eax
	pop ebp
	ret

;char inport(short port)
inport:
	push ebp
	mov ebp, esp
	push edx
	xor eax, eax
	mov edx, [ebp+8]
	in al, dx
	pop edx
	pop ebp
	ret

;void outport(short port, char value)
outport:
	push ebp
	mov ebp, esp
	push eax
	push edx
	mov edx, [ebp+8]
	mov eax, [ebp+12]
	out dx, al
	pop edx
	pop eax
	pop ebp
	ret

idt:
	ilimit	dw  0
	ibase	dd  0
