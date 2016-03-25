//Brainf**k Interpreter Written By Sean Batzel

#include <stdio.h>

int main(char *filename){
	char program[30000]; //Our 30000-byte array.
	int i; //We'll use this for basic counting.
	for(i = 0; i < 30000; i++){ 
		program[i] = 0;
	}
	FILE *fp;
	fp = fopen(filename, "r"); //Open filename for reading.
	i = 0;
	char c;
	while ((c = fgetc(fp)) != EOF){
		program[i] = (char)c; //Store our program in the array for execution.
		i++;
	}
	fclose(fp); //Close filename.
	/*
	Here's the fun part. I need an execution cycle with two counters - 
	one to manage what step of the program I'm on, 
	and one to manage which array index the program is modifying.
	*/
	int execution = 0;
	int endOfProgram = i-1;
	int pointer = i;
	while(execution <= endOfProgram){
		switch (program[execution]){
			case '>':
				pointer++;
				break;
			case '<':
				pointer--;
				break;
			case '+':
				program[pointer]++;
				break;
			case '-':
				program[pointer]--;
				break;
			case '.':
				putchar(program[pointer]);
				break;
			case ',':
				program[pointer] = getchar();
				break;
			case '[':
				if (program[pointer] == 0){
					while(program[pointer] != ']'){
						pointer++;
					}
					pointer++;
				}
				break;
			case ']':
				if (program[pointer] != 0){
					while(program[pointer] != '['){
						pointer--;
					}
					pointer++;
				}
				break;
			default:
				break;
		}
		execution++;
	}
	return 0;
}