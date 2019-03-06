/*
 * fibonacci calculator
 * simply compile it like: $ gcc -Wall -o fibo fibo.c[ENTER]
 * simply run it like: $ ./fibo <VALUE>[ENTER]
 */

#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[]){
	int a = 0, b = 1, t, n = atoi(argv[1]);
	while(--n) {
		t = b;
		b += a;
		a = t;
	}
	printf("%d\n", b);
	return 0;
}
