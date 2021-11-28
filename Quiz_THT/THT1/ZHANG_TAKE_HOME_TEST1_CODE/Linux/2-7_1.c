void main() {
	static int f = 0;
	static int g = 100;
	static int h = 80;
	static int i = 60;
	
	if (f == i)
		f = g + h;
	else
		f = g - h;
}