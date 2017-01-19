;nasm minimal.asm -f bin -o image.bin -l image.lst
;18.01.2017

main:	jmp main
	times 510-($-$$) db 0
	db 0x55, 0xAA