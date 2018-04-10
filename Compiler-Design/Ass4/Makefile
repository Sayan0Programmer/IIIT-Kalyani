objfiles = myLex.o lex.yy.o
lexeme: $(objfiles)
	gcc -o lexeme $(objfiles)
myLex.o: myLex.c y.tab.h
	gcc -c -Wall myLex.c
lex.yy.o: lex.yy.c
	gcc -c lex.yy.c 
lex.yy.c: lex.l y.tab.h
	flex lex.l   
clean:
	rm a.out lex.yy.c $(objfiles) 
