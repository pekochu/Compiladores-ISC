rpcalc: rpcalc.tab.o lex.yy.o
	gcc rpcalc.tab.o lex.yy.o -o rpcalc -ly -ll -lm

rpcalc.tab.o: rpcalc.tab.c
	gcc rpcalc.tab.c -c

lex.yy.o: lex.yy.c
	gcc lex.yy.c -c

rpcalc.tab.c:
	bison -d rpcalc.y

lex.yy.c:
	flex rpcalc.l

clean:
	rm lex.yy.c
	rm rpcalc.tab.c
	rm rpcalc.tab.h
	rm rpcalc.tab.o
	rm lex.yy.o
	rm rpcalc
	clear 