run: rpcalc
	./rpcalc

rpcalc: rpcalc.tab.o lex.yy.o
	gcc rpcalc.tab.o lex.yy.o -o rpcalc -ly -ll -lm
rpcalc.tab.c:
	bison -d rpcalc.y
lex.yy.c:
	flex rpcalc.l
clean:
	rm lex.yy.c
	rm rpcalc.tab.c
	rm rpcalc.tab.h
	rm rpcalc
	clear 