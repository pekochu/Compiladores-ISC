run: rpcalc
	./rpcalc

rpcalc: lex.yy.c rpcalc.tab.c
	gcc lex.yy.c rpcalc.tab.c -o rpcalc -ly -ll -lm
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