	jmp main

	%include "screen.asm"

main:
	;print(msg,0,5,?)
	push 4			;color
	push 10			;y
	push 0			;x
	push msg		;str
	call print

	;schreiben von Sektoren
	mov ax,ds
	mov es,ax ;Sekmentadresse des Buffers
	mov bx,msg2 ;Offsetadrsse des Buffers
	mov ah,3 ;schreiben von Sektoren
	mov al,1 ;Anzahl zu schreibender Sektoren
	mov ch,0 ;Spur
	mov cl,10 ;erster Sektor
	mov dx,0x80 ;Kopf,Laufwerksnummer
	int 0x13

main1:
	jmp main1

msg		db 'Kernal geladen.', 0
msg2 	db 'Das ist ein Schreibtest !!!!!!!', 0
		times 512-($-$$) db 0
