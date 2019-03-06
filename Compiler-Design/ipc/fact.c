/*
 * factorial calculator
 * simply compile it like: $ gcc -Wall -o fact fact.c[ENTER]
 * simply run it like: $ ./fact <VALUE>[ENTER]
 */

#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[]){
	int n = atoi(argv[1]);
	int f = n;
	printf("fact(%d) = ", n);
	while(--n) {
		f *= n;
	}
	printf("%d\n", f);
	return f;
}
