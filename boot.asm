;nasm boot.asm -f bin -o image.bin -l image.lst
;18.01.2017

	jmp main

cls:	;void cls() --> Bildschirm löschen
	mov ax, 0xb800		;Adresse Bildschirmspeicher
	mov es, ax
	mov di, 3999
cls1:
	mov byte [es:di], 0
	dec di
	dec di
	cmp di,1
	jne cls1
	ret

print:	;void print(char *str, int x, int y)
	mov ax, 0xb800
	mov es, ax
	mov si, msg
	mov ax, 0
	mov di, ax
print1:
	mov al, [ds:si]
	or al, al
	jz print2
	mov byte [es:di], al
	inc di
	mov byte [es:di], 2
	inc di
	inc si
	jmp print1
print2:
	ret



main:
	cli			;interrupts blockieren

	;stack initialisieren
	mov ax, 0x07c0
	mov ds, ax
	mov ax, 0x9000
	mov ss, ax
	mov sp, 0
	sti			;interrupts zulassen

	call cls		;cls()
	call print

main1:
	jmp main1

;daten
msg	db '*** Hello World !!! ***', 0
	db 'My Operating System || 18.01.2017', 0
	times 510-($-$$) db 0
	db 0x55, 0xAA

