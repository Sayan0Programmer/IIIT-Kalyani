/* files for compiling lex file to make Lexical Analyzer for a small language
 * $ make[ENTER]
 * $ ./lexeme < input.txt[ENTER]
 * $ make clean[ENTER]
 */

#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern yylType yylval;
int main(){
	int s;
	while((s=yylex()))
	switch(s){
		case DEF : printf("<def> ");
			break;
		case ELSE : printf("<else> ");
			break;
		case END : printf("<end> ");
			break;
		case EXITLOOP : printf("<exit> ");
			break;
		case FLOAT : printf("<float> ");
			break;
		case FROM : printf("<from> ");
			break;
		case FUN : printf("<fun> ");
			break;
		case GLOBAL : printf("<global> ");
			break;
		case IF : printf("<if> ");
			break;
		case INT : printf("<int> ");
			break;
		case MOD : printf("<mod> ");
			break;
		case NOT : printf("<not> ");
			break;
		case NUL : printf("<null> ");
			break;
		case OR : printf("<or> ");
			break;
		case PRINT : printf("<print> ");
			break;
		case PRODUCT : printf("<product> ");
			break;
		case READ : printf("<read> ");
			break;
		case SKIP : printf("<skip> ");
			break;
		case STEP : printf("<step> ");
			break;
		case TO : printf("<to> ");
			break;
		case WHILE : printf("<while> ");
			break;


		case ASSIGN : printf("<:=> ");
			break;
		case COLON : printf("<:> ");
			break;
		case COMMA : printf("<,> ");
			break;
		case SEMICOLON : printf("<;> ");
			break;
		case EQ : printf("<=> ");
			break;
		case LE : printf("<<=> ");
			break;
		case LT : printf("<<> ");
			break;
		case GE : printf("<>=> ");
			break;
		case GT : printf("<>> ");
			break;
		case NE : printf("<<>> ");
			break;
		case RETURNS : printf("<->> ");
			break;
		case LEFT_PAREN : printf("<(> ");
			break;
		case RIGHT_PAREN : printf("<)> ");
			break;
		case LEFT_SQ_BKT : printf("<[> ");
			break;
		case RIGHT_SQ_BKT : printf("<]> ");
			break;
		case (int)'{' : printf("<{> ");
			break;
		case (int)'}' : printf("<}> ");
			break;
		case PLUS : printf("<+> ");
			break;
		case MINUS : printf("<-> ");
			break;
		case MULT : printf("<*> ");
			break;
		case DIV : printf("</> ");
			break;

		case ID  : printf("<ID,%s> ",yylval.string);
			free (yylval.string);
			break;
		case INT_CONST : printf("<INT_CONST,%d> ",yylval.integer);
			break;
		case STRING : printf("<STRING,%s> ",yylval.string);
			free (yylval.string) ;
			break;
		default:  ;
	}
	printf("\n");
	return 0;
}
