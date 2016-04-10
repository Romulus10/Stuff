#include <stdio.h>

void printInts(int *array, int n){
	int pvalue;
	int i = 0;
	while(i < n){
		printf("%d\n", array[i]);
		i++;
	}
}

int readInts(int *array, int capacity){
	int ivalue;
	int i = 0;
	while(i < capacity){
		scanf("%d", &ivalue); 
		if(ivalue == 0){
			break;
		}
		else{
			array[i] = ivalue;
		}
		i++;
	}
	return i;
}

void sortInts(int *array, int n){
	int swapped = 0;
	int tmp;
	int j = 0;
	int i;
	while (swapped == 0){
		swapped = 1;
		j++;
		for (i = 0; i < n-j;i++){
			if(array[i] > array[i+1]){
				tmp = array[i];
				array[i] = array[i+1];
				array[i+1] = tmp;
				swapped = 0;
			}
		}
	}
}

int main(){
	int A[64];
	int N;	
	int capacity = 64;
	N = readInts(A, capacity);
	sortInts(A, N);
	printf("\n");
	printInts(A, N);
	return 0;
}
