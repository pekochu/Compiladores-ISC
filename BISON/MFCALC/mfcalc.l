
%{
    /* Libreria que incluye la función atof() */
    /*
     * flex rpcalc.l
     * gcc lex.yy.c -c
     * gcc rpcalc.tab.o lex.yy.o -ll -lm
     */
    #include <stdlib.h>
    #include "mfcalc.tab.h"
%}


%% 
[0-9]+"."[0-9]* { yylval = atof(yytext); return NUM; }
[ ]
\n { return '\n'; }
[-*+n/^] {return *yytext; }
%%
