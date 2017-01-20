;nasm boot.asm -f bin -o image.bin -l image.lst
;18.01.2017

	jmp main

%include "screen.asm"

main:
	cli				;interrupts blockieren

	;stack initialisieren
	mov ax, 0x07c0
	mov ds, ax
	mov ax, 0x9000
	mov ss, ax
	mov sp, 0
	sti				;interrupts zulassen

	;cls()
	call cls

	;print(hello,0,0,grün)
	push 2			;color
	push 0			;y
	push 0			;x
	push hello		;str
	call print

	;print(tag,100,6,blau)
	push 1			;color
	push 6			;y
	push 100		;x
	push tag		;str
	call print

	;print(msg,0,20,?)
	push 3			;color
	push 20			;y
	push 0			;x
	push msg		;str
	call print

main1:
	jmp main1

;daten
hello	db '*** Hello World !!! ***', 0
tag		db 'Guten Tag !', 0
msg		db 'Das ist das Haus vom Nikolaus !!!!!!', 0
		db 'My Operating System || 18.01.2017', 0
		times 510-($-$$) db 0
		db 0x55, 0xAA

