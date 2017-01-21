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
	push 56			;x
	push hello		;str
	call print

	;print(ul,0,0,grün)
	push 2			;color
	push 1			;y
	push 56			;x
	push ul			;str
	call print

	;print(tag,0,1,blau)
	push 1			;color
	push 2			;y
	push 0		;x
	push tag		;str
	call print

	;print(msg,0,2,?)
	push 0x0d		;color
	push 3			;y
	push 0			;x
	push msg		;str
	call print

	;lesen von Sektoren
	mov ax,0x1000
	mov es,ax ;Sekmentadresse des Buffers
	mov bx,0 ;Offsetadrsse des Buffers
	mov ah,2 ;lesen von Sektoren
	mov al,1 ;Anzahl zu lesender Sektoren
	mov ch,0 ;Spur
	mov cl,2 ;erster Sektor
	mov dx,0x80 ;Kopf,Laufwerksnummer
	int 0x13
	jnc a1		;Error check

	;print(str2,0,3,?)
	push 6			;color
	push 4			;y
	push 0			;x
	push str2		;str
	call print
	call main1

a1:	add al,0x30
	mov byte [ds:str1],al

	;print(str1,0,4,?)
	push 0x0e		;color
	push 4			;y
	push 0			;x
	push str1		;str
	call print

	;Startadresse für Kernel auf den Stack legen
	mov ax,0x1000
	mov ds,ax
	push ax
	mov ax,0
	push ax
	retf ;Sprung auf Startadresse des Kernels 1000:0000 (segment:offset)

main1:
	jmp main1

;daten
hello	db '*** Boot Loader 1.0 ***', 0
ul		db '=======================', 0
tag		db 'Guten Tag!', 0
msg		db 'Lade Kernel...', 0
str1	db 'x Sektor(en) geladen.', 0
str2	db 'Fehler beim Laden!', 0
titel	db 'My Operating System || 18.01.2017', 0
		times 510-($-$$) db 0
		db 0x55, 0xAA

