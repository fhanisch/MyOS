CC = i686-elf-gcc
LD = i686-elf-ld

all: boot.bin init_pmode.bin asmkernel.o ckernel.o kernel.bin image.bin

boot.bin: boot.asm screen.asm
	nasm -f bin boot.asm -o boot.bin -l boot.lst

init_pmode.bin: init_pmode.asm screen.asm
	nasm -f bin init_pmode.asm -o init_pmode.bin -l init_pmode.lst

asmkernel.o: asmkernel.asm
	nasm -f elf32 asmkernel.asm -o asmkernel.o -l asmkernel.lst

ckernel.o: ckernel.c
	$(CC) -ffreestanding -Os -Wall -c ckernel.c

kernel.bin: asmkernel.o ckernel.o
	$(LD) -T link.txt -o kernel.bin

image.bin: boot.bin init_pmode.bin kernel.bin
	cat boot.bin init_pmode.bin kernel.bin > image.bin

clean:
	rm image.bin boot.bin init_pmode.bin asmkernel.o ckernel.o kernel.bin
