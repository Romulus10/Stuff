#include <stdio.h>

int isPrime(int n) {
	int i;
    	if (n % 2 == 0) return 1;
    	for(i = 3; i * i <=n; i += 2) {
        	if(n % i == 0) return 1;
  	}
  	return 0;
}

int main(){
	int i = 1000000;
	int j = 2000000;
	int count = 0;
	while(i < j){
		if(isPrime(i) == 0){
			printf("%d\n", i);
			count++;
		}
		i++;
	}
	printf("\n%d prime numbers found.\n", count);
}