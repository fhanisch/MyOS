//gcc -m32 -ffreestanding -Os -Wall -c ckernel.c

void getkey(char*);

char *videoMem = (char*)0xb8000;
char key[256];
char isKey[256];

void init_keys()
{
	int i;
	for(i=0;i<256;i++)
	{
		key[i]='*';
		isKey[i] = 0;
	}
	key[16]='Q';key[17]='W';key[18]='E';key[19]='R';
	key[20]='T';key[21]='Z';key[22]='U';key[23]='I';
	key[24]='O';key[25]='P';key[30]='A';key[31]='S';
	key[32]='D';key[33]='F';key[34]='G';key[35]='H';
	key[36]='J';key[37]='K';key[38]='L';key[44]='Y';
	key[45]='X';key[46]='C';key[47]='V';key[48]='B';
	key[49]='N';key[50]='M';key[71]='7';key[72]='8';
	key[73]='9';key[75]='4';key[76]='5';key[77]='6';
	key[79]='1';key[80]='2';key[81]='3';key[82]='0';
}

void print(char *text, char x, char y, char color)
{
	unsigned int i=0;

	while(text[i])
	{
		videoMem[2*(i+80*y+x)] = text[i];
		videoMem[2*(i+80*y+x)+1] = color;
		i++;
	}
}

void window(char x, char y, char width, char height, char color)
{
	unsigned int i,j;

	for (i=0;i<height;i++)
		for (j=0;j<width;j++)
		{
			videoMem[2*(x + 80*y + j + 80*i)+1] = color;
		}
}

int main()
{
	init_keys();
	window(20,15,40,8,0x55);
	print("Willkommen im Protected Mode!",25,18,0x5a);
	print("<ok>",37,21,0x4a);
	getkey(&isKey[0x1c]);
	isKey[0x1c]=0;
	window(0,0,80,25,0x11);

	return 0;
}

void irq1(int scancode)
{
	isKey[scancode] = 1;
	videoMem[156] = key[scancode];
	videoMem[157] = 0x1a;
}
