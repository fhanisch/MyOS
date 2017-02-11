//gcc -m32 -ffreestanding -Os -Wall -c ckernel.c

void getkey(char*);
char inport(short port);
void outport(short port, char value);

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

void setFrame(char x, char y, char width, char height)
{
	unsigned int i;

	videoMem[2*(x + 80*y)] = 0xc9;
	videoMem[2*(x + 80*y)+1] = 0x1a;
	videoMem[2*(x+width-1 + 80*y)] = 0xbb;
	videoMem[2*(x+width-1 + 80*y)+1] = 0x1a;

	videoMem[2*(x + 80*(y+height-1))] = 0xc8;
	videoMem[2*(x + 80*(y+height-1))+1] = 0x1a;
	videoMem[2*(x+width-1 + 80*(y+height-1))] = 0xbc;
	videoMem[2*(x+width-1 + 80*(y+height-1))+1] = 0x1a;

	for (i=1;i<width-1;i++)
	{
		videoMem[2*(x + 80*y + i)] = 0xcd;
		videoMem[2*(x + 80*y + i)+1] = 0x1a;
	}
	for (i=1;i<width-1;i++)
	{
		videoMem[2*(x + 80*(y+height-1) + i)] = 0xcd;
		videoMem[2*(x + 80*(y+height-1) + i)+1] = 0x1a;
	}
	for (i=1;i<height-1;i++)
	{
		videoMem[2*(x + 80*y + 80*i)] = 0xba;
		videoMem[2*(x + 80*y + 80*i)+1] = 0x1a;
	}
	for (i=1;i<height-1;i++)
	{
		videoMem[2*(x+width-1 + 80*y + 80*i)] = 0xba;
		videoMem[2*(x+width-1 + 80*y + 80*i)+1] = 0x1a;
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
	setFrame(0,1,80,23);
	print("My Operating System",28,0,0x1c);

	return 0;
}

void irq1(int scancode)
{
	isKey[scancode] = 1;
	videoMem[156] = key[scancode];
	videoMem[157] = 0x1a;
}

void irq8()
{
	unsigned int i;
	char xOffset=63;
	char value;
	char offset[] = {7,8,9,4,2,0};
	char limiter[] ={'.','.',' ',':',':',' '};

	for (i=0;i<sizeof(offset);i++)
	{
		outport(0x70,offset[i]);
		value=inport(0x71);
		videoMem[2*(xOffset+80*24)] = (value>>4)+0x30;
		videoMem[2*(xOffset+80*24)+1] = 0x1a;
		xOffset++;
		videoMem[2*(xOffset+80*24)] = (value&0x0f)+0x30;
		videoMem[2*(xOffset+80*24)+1] = 0x1a;
		xOffset++;
		videoMem[2*(xOffset+80*24)] = limiter[i];
		videoMem[2*(xOffset+80*24)+1] = 0x1a;
		xOffset++;
	}
}
