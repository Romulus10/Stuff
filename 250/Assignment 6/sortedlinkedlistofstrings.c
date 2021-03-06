#include <stdio.h>
#include <stdlib.h>

struct node{
	struct node *next;
	char *value;
};

char *readSO(){
	char *string;
	scanf("%s", &string);
	return string;
}

void prntLst(struct node *head){
	struct node *tmp = head;
	while (tmp->next != 0){
		printf("%s\n", tmp->value);
		tmp = tmp->next;
	}
}

struct node *buildLst(){
	char *in;
	struct node *current;
	struct node *head;
	in = readSO();
	head->next = malloc(sizeof(struct node));
	current = head->next;
	current->value = in;
	while(strcmp(in,"0") != 0){
		in = readSO();
		current->next = malloc(sizeof(struct node));
		current = head->next;
		current->value = in;
	}
	return head;
}

int die(char *msg, int code){
	printf("ERROR CODE %d: %s", code, msg);
	exit(code);
}

void main(){
	struct node *list = buildLst();
	prntLst(list);
}
