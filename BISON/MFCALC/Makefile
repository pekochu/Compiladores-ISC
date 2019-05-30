mfcalc: mfcalc.tab.o lex.yy.o calc.o
	gcc mfcalc.tab.o lex.yy.o calc.o -o mfcalc -ly -ll -lm

calc.o: 
	gcc -c -g calc.c

mfcalc.tab.o: mfcalc.tab.c
	gcc -c -g mfcalc.tab.c

lex.yy.o: lex.yy.c
	gcc -c -g lex.yy.c

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
	rm calc.o
	rm mfcalc.output
	rm mfcalc
	clear 
