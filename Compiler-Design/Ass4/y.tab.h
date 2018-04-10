#ifndef _Y_TAB_H
#define _Y_TAB_H

#define AND		300
#define ASSIGN		301
#define COLON		302
#define COMMA		303
#define DEF		304
#define DIF		305
#define DIV		306
#define DOT		307
#define ELSE		308
#define END		309
#define EQ		310
#define EXITLOOP	311
#define FLOAT		312
#define FLOAT_CONST	313
#define FORMAT		314
#define FROM		315
#define FUN		316
#define GE		317
#define GLOBAL		318
#define GT		319
#define ID		320
#define IF		321
#define INT		322
#define INT_CONST	323
#define LEFT_PAREN	324
#define LEFT_SQ_BKT	325
#define LE		326
#define LT		327
#define MINUS		328
#define MOD		329
#define MULT		330
#define NE		331
#define NOT		332
#define NUL		333
#define OR		334
#define PLUS		335
#define PRINT		336
#define PRODUCT		337
#define READ		338
#define RETURN		339
#define RETURNS		340
#define RIGHT_PAREN	341
#define RIGHT_SQ_BKT	342
#define SEMICOLON	343
#define SKIP		344
#define STEP		345
#define STRING		346
#define TO		347
#define WHILE		348

int yylex(void);
typedef union{
	char *string;
	int integer;
}yylType;

#endif
