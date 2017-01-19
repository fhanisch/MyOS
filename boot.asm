;nasm boot.asm -f bin -o image.bin -l image.lst
;18.01.2017

	cli
	mov ax, 0x07c0
	mov ds, ax

	mov si, msg
print:
	lodsb
	or al, al
	jz main
	mov ah, 0x0e
	int 0x10
	jmp print

main:	jmp main

msg	db '*** Hello World !!! ***', 13, 10, 0
	times 510-($-$$) db 0
	db 0x55, 0xAA

