//gcc -m32 -ffreestanding -Os -Wall -c ckernel.c

void print()
{
	char *VideoMem;

	VideoMem=(char*)0xb8000;
	*VideoMem = 'X';
	VideoMem++;
	*VideoMem = 0x0a;
	VideoMem++;
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
