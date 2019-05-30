
%{
    /* Libreria que incluye la función atof() */
    #include <stdlib.h>
    /* Librería BISON */
    #include "calc.h"
    #include "mfcalc.tab.h"
%}

%option noyywrap

digit   [0-9]
posint  {digit}+
int     "-"?{posint}
long    {int}(""|("."{posint}))

char    [a-zA-z]


%% 
"^"             { return *yytext; }
{long}          { yylval.NUM = atof (yytext); return NUM; }
{char}+         { symrec *sym = getsym (yytext); if (sym==0) sym = putsym(yytext, VAR) ; yylval.VAR = sym; return sym->type; }
"+"             { return *yytext; }
"-"             { return *yytext; }
"*"             { return *yytext; }
"/"             { return *yytext; }
"="             { return *yytext; }
"("             { return *yytext; }
")"             { return *yytext; }
[ \t]+          { }
"\n"            { return '\n'; }
%%
