// Sean Batzel
// Assignment 2
// CMPS 250 Machine Organization and Assembly Programming

void DumpS(int n);

int gcd(int a, int b){
	int final;
	DumpS(64);
	if (a == b) final = a;
	else final = gcd(b, a % b);
	DumpS(64);
	return final;
}