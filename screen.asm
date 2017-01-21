;void cls() --> Bildschirm löschen
cls:
	mov ax, 0xb800		;Adresse Bildschirmspeicher
	mov es, ax
	mov di, 3999
cls1:
	mov byte [es:di], 0
	dec di
	dec di
	cmp di, 1
	jne cls1
	ret

;void print(char *str, int x, int y, int color)
print:
	pop dx			;ip sichern
	pop si
	pop bx
	pop cx
	pop ax
	push dx
	mov byte [ds:color], al
	mov ax, 0xb800
	mov es, ax
	mov ax, 160
	mul cx
	add ax, bx
	mov di, ax
print1:
	mov al, [ds:si]
	or al, al
	jz print2
	mov byte [es:di], al
	inc di
	mov byte al, [ds:color]
	mov byte [es:di], al
	inc di
	inc si
	jmp print1
print2:
	ret
color	db 0
