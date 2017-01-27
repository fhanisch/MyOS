//gcc -m32 -ffreestanding -Os -Wall -c ckernel.c

void print(char *text, char x, char y)
{
	unsigned int i=0;
	char *videoMem = (char*)0xb8000;
	while(text[i])
	{
		videoMem[2*(i+80*y+x)] = text[i];
		videoMem[2*(i+80*y+x)+1] = 0x0a;
		i++;
	}
}

int main()
{
	print("Willkommen im Protected Mode!",20,20);
	while (1);
	return 0;
}
