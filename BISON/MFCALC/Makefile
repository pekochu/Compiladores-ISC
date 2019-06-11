mfcalc: mfcalc.tab.o lex.yy.o
	gcc mfcalc.tab.o lex.yy.o -o mfcalc -ly -ll -lm

mfcalc.tab.o: mfcalc.tab.c
	gcc mfcalc.tab.c -c

lex.yy.o: lex.yy.c
	gcc lex.yy.c -c

mfcalc.tab.c:
	bison -d mfcalc.y

lex.yy.c:
	flex mfcalc.l

clean:
	rm lex.yy.c
	rm mfcalc.tab.c
	rm mfcalc.tab.h
	rm mfcalc.tab.o
	rm lex.yy.o
	rm mfcalc
	clear 
