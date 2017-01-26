//gcc -m32 -ffreestanding -Os -Wall -c ckernel.c

void print(char *text)
{
	unsigned int i=0;
	char *videoMem;
	videoMem=(char*)0xb8000;
	while(text[i])
	{
		videoMem[2*i] = text[i];
		videoMem[2*i+1] = 0x0a;
		i++;
	}
}

int main()
{
	print("Willkommen im Protected Mode!");
	while (1);
	return 0;
}
