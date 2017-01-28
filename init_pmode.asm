BITS 16

	jmp main

	%include "screen.asm"

main:
	;print(msg,0,5,?)
	push 4			;color
	push 5			;y
	push 0			;x
	push msg		;str
	call print

	;schreiben von Sektoren
	;mov ax,ds
	;mov es,ax ;Sekmentadresse des Buffers
	;mov bx,msg2 ;Offsetadrsse des Buffers
	;mov ah,3 ;schreiben von Sektoren
	;mov al,1 ;Anzahl zu schreibender Sektoren
	;mov ch,0 ;Spur
	;mov cl,10 ;erster Sektor
	;mov dx,0x80 ;Kopf,Laufwerksnummer
	;int 0x13

	;print(msg3,0,6,?)
	push 0x0a		;color
	push 6			;y
	push 0			;x
	push msg3		;str
	call print

	;Interrupt Controller prgrammieren
	mov     al,0x11
	out     0x20,al
	out     0xa0,al
	mov     al,0x20
	out     0x21,al
	mov     al,0x28
	out     0xa1,al
	mov     al,4
	out     0x21,al
	mov     al,2
	out     0xa1,al
	mov     al,1
	out     0x21,al
	out     0xa1,al

	;gdt eintragen
	xor     eax, eax
	mov     eax, cs
	shl     eax, 4
	add     eax, gdt_begin
	mov     [base], eax
	mov     [limit], word gdt_end - gdt_begin -1
	lgdt    [gdt]

	;idt eintragen
	xor     eax,eax
	mov     eax,0x10000
	add     eax,idt_begin
	mov     [ibase],eax
	mov     [ilimit], word idt_end - idt_begin -1
	lidt    [idt]

	;in den pmode schalten
	mov     eax, cr0
	or      eax, 1
	mov     cr0, eax
	jmp     long 0x8:0x10000+pmode

;Daten
msg		db 'Kernel geladen.', 0
msg2 	db 'Das ist ein Schreibtest !!!!!!!', 0
msg3	db 'Initialisiere Protected Mode.', 0

;--------------------------------------------------------------------
;Protected Mode
BITS 32

pmode:
	;init selectors
	mov ax, 2
	shl ax, 3
	mov ds, ax
	mov ss, ax
	mov ax, 3
	shl ax, 3
	mov es, ax
	mov esp, 0x90000	;setze Stackpointer

	mov al,[0x10000+letter]
	mov byte [es:154],al
	mov byte [es:155],4

	jmp start

;Interrupt Service Routine
isr:
	mov byte [es:158],'I'
	mov byte [es:159],4
	iret

;Daten
letter  db 'P'

gdt:
	limit	dw  0
	base	dd  0

idt:
	ilimit	dw  0
	ibase	dd  0

;Descriptors
gdt_begin:
		;Null-Deskriptor
		dd  0, 0
		;Code-Deskriptor
     	dw  0xffff      ; Segmentgröße(0..15)
		dw  0           ; Segmentbasisadresse(0..15)
		db  0           ; Segmentbasisadresse(16..23)
		db  10011011b   ; P DPL(2) S Type A
       	db  11001111b   ; G D 0 AVL Segmentgröße(16..19)
       	db  0           ; Segmentbasisadresse(24..31)
		;Data-Deskriptor
		dw  0xffff
      	dw  0
       	db  0
       	db  10010011b
       	db  11001111b
       	db  0
		;Video-Ram Descriptor
		dw  4000
      	dw  0x8000
       	db  0xb
       	db  10010011b
       	db  11000000b
       	db  0
gdt_end:

%include "idt.asm"

	times 1024-($-$$) db 0

start:
