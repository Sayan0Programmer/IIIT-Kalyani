%{ // Copied verbatim
#include<string.h>
#include<stdlib.h>
#include"y.tab.h"	// tokens are defined
int lc=0;		// line count
yylType yylval;
%}

%option noyywrap
%x CMNT INSTR

DELIM		([ \t])
WHITESPACES	({DELIM}+)
POSI_DECI	([1-9])
DECI		(0|{POSI_DECI})
DECIMAL		(0|{POSI_DECI}{DECI}*)
LOWER		([a-z])
LETTER		({LOWER}|[:upper:]|_)
IDENTIFIER	({LETTER}({LETTER}|{DECI})*)

%%

"/*"		{BEGIN CMNT;}
<CMNT>.		{ ; }
<CMNT>\n	{ ++lc; }
<CMNT>"*/"	{BEGIN INITIAL;}
\n		{ ++lc; return (int)'\n'; }
"\"".*"\""	{
	yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
	strncpy(yylval.string, yytext+1, yyleng-2);
	yylval.string[yyleng-2]='\0';
	return STRING;
}
{WHITESPACES}	{ ; }

and		{ return AND; }
def		{ return DEF; }
else		{ return ELSE; }
end		{ return END; }
exit		{ return EXITLOOP; }
float		{ return FLOAT; }
from		{ return FROM; }
fun		{ return FUN; }
global		{ return GLOBAL; }
if		{ return IF; }
int		{ return INT; }
mod		{ return MOD; }
not		{ return NOT; }
null		{ return NUL; }
or		{ return OR; }
print		{ return PRINT; }
product		{ return PRODUCT; }
read		{ return READ; }
skip		{ return SKIP; }
step		{ return STEP; }
to		{ return TO; }
while		{ return WHILE; }

":="		{ return ASSIGN; }
:		{ return COLON; }
,		{ return COMMA; }
;		{ return SEMICOLON; }
=		{ return EQ; }
"<="		{ return LE; }
"<"		{ return LT; }
">="		{ return GE; }
">"		{ return GT; }
"<>"		{ return NE; }
"->"		{ return RETURNS; }
\(		{ return LEFT_PAREN; }
\)		{ return RIGHT_PAREN; }
\{		{ return (int)'{'; }
\}		{ return (int)'}'; }
\[		{ return LEFT_SQ_BKT; }
\]		{ return RIGHT_SQ_BKT; }
"+"		{ return PLUS; }
"-"		{ return MINUS; }
"*"		{ return MULT; }
"/"		{ return DIV; }

{IDENTIFIER}	{
	yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
	strncpy(yylval.string, yytext, yyleng + 1);
	return ID;
}
{DECIMAL}	{
	yylval.integer = atoi(yytext);
	return INT_CONST;
}
.		{ ; }
%%
/* The function yywrap()  */
//int yywrap(){return 1;}
