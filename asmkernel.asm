;ld -m elf_i386 -T link.txt -o kernel.bin

BITS 32

extern main
global start

start:
	call main

