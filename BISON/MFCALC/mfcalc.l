
%{
    /* Libreria que incluye la función atof() */
    #include <stdlib.h>
    /* Librería BISON */
    #include "mfcalc.tab.h"
    #include "calc.h"   /* Contains definition of 'symrec'.  */
%}

%option noyywrap

digit   [0-9]
posint  {digit}+
int     "-"?{posint}
long    {int}(""|("."{posint}))

char    [a-zA-z]


%% 
{long}          { yylval.val.value.num = atof (yytext); return NUM; }
[=-*+n/^]       {return *yytext; }
{char}+         { symrec *sym = getsym (yytext); if (sym==0) sym = putsym(yytext, VAR) ; yylval.tptr = sym; return sym->type; }
[ \t]+          { }
"\n"            { return '\n'; }
%%
