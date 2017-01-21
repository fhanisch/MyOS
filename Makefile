all: boot.bin init_pmode.bin asmkernel.o image.bin

boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin -l boot.lst

init_pmode.bin: init_pmode.asm
	nasm -f bin init_pmode.asm -o init_pmode.bin -l init_pmode.lst

asmkernel.o: asmkernel.asm
	nasm -f aout asmkernel.asm -o asmkernel.o -l asmkernel.lst

image.bin: boot.bin init_pmode.bin
	cat boot.bin init_pmode.bin > image.bin

clear:
	rm image.bin boot.bin init_pmode.bin
