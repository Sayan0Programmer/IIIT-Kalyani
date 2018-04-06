#ifndef _MYLEX_H
#define _MYLEX_H

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
#include<unistd.h>

#define ID	200
#define IC	201
#define FC	202
#define K 	300
#define AND	300
#define DO	301
#define ELSE	302
#define END	303
#define FLOAT	304
#define IF	305
#define INT	306
#define NOT	307
#define OR	308
#define PRINT	309
#define PROG	310
#define SCAN	311
#define THEN	312
#define WHILE	313

struct symTab{
	int val;
	char *name;
};
struct symTab sT[20];
int neST=0;		// #(entry in symbol-table)
int putInSymTab(char*,int);	// put into symbol table

int isNtBlank(int);
int lexeme();
unsigned long po;	// Position Offset
char *fn;		// input file name
char gnc();		// give next character
#define NB	32
char *kw[]={"and","do","else","end","float","if","int","not","or","print","prog","scan","then","while"};

#endif
