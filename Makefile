all: image.bin

image.bin: boot.asm
	nasm boot.asm -f bin -o image.bin -l image.lst
