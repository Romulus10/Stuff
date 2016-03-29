// Sean Batzel
// Assignment 2
// CMPS 250 Machine Organization and Assembly Programming

#include <stdio.h>

int gcd(int a, int b);
void DumpS(int n);

int main(){
	int input1, input2, final;
	printf("Enter a number: ");
	scanf("%d", &input1);
	printf("Enter another: ");
	scanf("%d", &input2);
	DumpS(64);
	final = gcd(input1, input2);
	DumpS(64);
	printf("The GCD of %d and %d is %d.\n", input1, input2, final);
}
