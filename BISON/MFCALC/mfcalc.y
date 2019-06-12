/* multi function calculator.  */

%{
	#include <stdio.h>
	#include <math.h>
	#include "calc.h"   /* Contains definition of 'symrec'.  */
	int yylex (void);
	void yyerror (char const *);
%}

%define api.value.type union /* Generate YYSTYPE from these types:  */
%token <double>  NUM         /* Simple double precision number.  */
%token <symrec*> VAR FNCT    /* Symbol table pointer: variable and function.  */
%type  <double>  exp


%precedence '='
%left '-' '+'
%left '*' '/'
%precedence NEG /* negation--unary minus */
%right '^'      /* exponentiation */

/* Generate the parser description file.  */
%verbose
/* Enable run-time traces (yydebug).  */
%define parse.trace

/* Formatting semantic values.  */
%printer { fprintf (yyoutput, "%s", $$->name); } VAR;
%printer { fprintf (yyoutput, "%s()", $$->name); } FNCT;
%printer { fprintf (yyoutput, "%g", $$); } <double>;
%% /* The grammar follows.  */

input:
  %empty
| input line
;



line:
  '\n'
| exp '\n'   { printf ("%.10g\n", $1); }
| error '\n' { yyerrok;                }
;



exp:
  NUM                { $$ = $1;                         }
| VAR                { $$ = $1->value.var;              }
| VAR '=' exp        { $$ = $3; $1->value.var = $3;     }
| FNCT '(' exp ')'   { $$ = (*($1->value.fnctptr))($3); }
| exp '+' exp        { $$ = $1 + $3;                    }
| exp '-' exp        { $$ = $1 - $3;                    }
| exp '*' exp        { $$ = $1 * $3;                    }
| exp '/' exp        { $$ = $1 / $3;                    }
| '-' exp  %prec NEG { $$ = -$2;                        }
| exp '^' exp        { $$ = pow ($1, $3);               }
| '(' exp ')'        { $$ = $2;                         }
;

/* End of grammar.  */
%%

struct init{
	char const *fname;
	double (*fnct) (double);
};



struct init const arith_fncts[] = {
	{ "atan", atan },
	{ "cos",  cos  },
	{ "exp",  exp  },
	{ "ln",   log  },
	{ "sin",  sin  },
	{ "sqrt", sqrt },
	{ 0, 0 },
};



/* The symbol table: a chain of 'struct symrec'.  */
symrec *sym_table;

/* Put arithmetic functions in table.  */
static void init_table (void){
  	int i;
  	for (i = 0; arith_fncts[i].fname != 0; i++) {
		symrec *ptr = putsym (arith_fncts[i].fname, FNCT);
		ptr->value.fnctptr = arith_fncts[i].fnct;
    }
}

int main (int argc, char const* argv[]){
	init_table ();
	return yyparse ();
}


void yyerror(char const * elError){
	fprintf(stderr, " # Error > %s <\n", elError);
}
