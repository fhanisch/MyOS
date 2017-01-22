//gcc -m32 -ffreestanding -Os -Wall -c ckernel.c

char *VideoMem;

void print()
{
	VideoMem=(char*)0xb8000+25*160+2*50;
	*VideoMem = 'X';
	VideoMem++;
	*VideoMem = 0x0a;
}

int main()
{
	print();
	while (1);
	return 0;
}
