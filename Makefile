all: boot.bin kernel.bin image.bin

boot.bin: boot.asm
	nasm boot.asm -f bin -o boot.bin -l boot.lst

kernel.bin: kernel.asm
	nasm kernel.asm -f bin -o kernel.bin -l kernel.lst

image.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > image.bin
