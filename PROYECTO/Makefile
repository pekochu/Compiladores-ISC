all: compilador
	./compilador

compilador: lex.yy.o parser.tab.o 
	gcc parser.tab.o lex.yy.o -o compilador -ly -ll -lm

parser.tab.o: parser.tab.c
	gcc -c -g parser.tab.c

lex.yy.o: lex.yy.c
	gcc -c -g lex.yy.c

parser.tab.c:
	bison -d parser.y

lex.yy.c:
	flex parser.l

clean:
	rm lex.yy.c
	rm parser.tab.c
	rm parser.tab.h
	rm parser.tab.o
	rm lex.yy.o
	rm compilador
	clear 
