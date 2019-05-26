/* Analizador lexico para el lenguaje C */
     
%{
#include <stdio.h>
%}


D	[0-9]
L	[a-zA-Z_]
H	[a-fA-F0-9]
E	[Ee][+-]?{D}+
FS	(f|F|l|L)
IS	(u|U|l|L)*


%%
"/*"	{ printf("<span class='comment'>%s</span>", yytext); }
"*/"	{ printf("<span class='comment'>%s</span>", yytext); }

"auto"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"break"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"case"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"char"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"const"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"continue"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"default"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"do"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"double"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"else"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"enum"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"extern"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"float"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"for"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"goto"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"if"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"int"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"long"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"register"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"return"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"short"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"signed"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"sizeof"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"static"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"struct"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"switch"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"typedef"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"union"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"unsigned"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"void"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"volatile"	{ printf("<span class='reser_w'>%s</span>", yytext); }
"while"	{ printf("<span class='reser_w'>%s</span>", yytext); }

{L}({L}|{D})*	{ printf("<span class='id'>%s</span>", yytext); }

0[xX]{H}+{IS}?	{ printf("<span class='numeros'>%s</span>", yytext); }
0{D}+{IS}?	{ printf("<span class='numeros'>%s</span>", yytext); }
{D}+{IS}?	{ printf("<span class='numeros'>%s</span>", yytext); }
L?'(\\.|[^\\'])+'	{ printf("<span class='cte'>%s</span>", yytext); }

{D}+{E}{FS}? { printf("<span class='numeros'>%s</span>", yytext); }
{D}*"."{D}+({E})?{FS}?	{ printf("<span class='numeros'>%s</span>", yytext); }
{D}+"."{D}*({E})?{FS}?	{ printf("<span class='numeros'>%s</span>", yytext); }

L?\"(\\.|[^\\"])*\"	{ printf("<span class='cte'>%s</span>", yytext); }

"..."	{ printf("<span class='operadores'>%s</span>", yytext); }
">>="	{ printf("<span class='operadores'>%s</span>", yytext); }
"<<="	{ printf("<span class='operadores'>%s</span>", yytext); }
"+="	{ printf("<span class='operadores'>%s</span>", yytext); }
"-="	{ printf("<span class='operadores'>%s</span>", yytext); }
"*="	{ printf("<span class='operadores'>%s</span>", yytext); }
"/="	{ printf("<span class='operadores'>%s</span>", yytext); }
"%="	{ printf("<span class='operadores'>%s</span>", yytext); }
"&="	{ printf("<span class='operadores'>%s</span>", yytext); }
"^="	{ printf("<span class='operadores'>%s</span>", yytext); }
"|="	{ printf("<span class='operadores'>%s</span>", yytext); }
">>"	{ printf("<span class='operadores'>%s</span>", yytext); }
"<<"	{ printf("<span class='operadores'>%s</span>", yytext); }
"++"	{ printf("<span class='operadores'>%s</span>", yytext); }
"--"	{ printf("<span class='operadores'>%s</span>", yytext); }
"->"	{ printf("<span class='operadores'>%s</span>", yytext); }
"&&"	{ printf("<span class='operadores'>%s</span>", yytext); }
"||"	{ printf("<span class='operadores'>%s</span>", yytext); }
"<="	{ printf("<span class='operadores'>%s</span>", yytext); }
">="	{ printf("<span class='operadores'>%s</span>", yytext); }
"=="	{ printf("<span class='operadores'>%s</span>", yytext); }
"!="	{ printf("<span class='operadores'>%s</span>", yytext); }
";"	{ printf("<span class='special'>%s</span><br/>", yytext); }
("{"|"<%")	{ printf("<span class='special'>%s</span><br/>", yytext); }
("}"|"%>")	{ printf("<span class='special'>%s</span><br />", yytext); }
","	{ printf("<span class='special'>%s</span>", yytext); }
":"	{ printf("<span class='special'>%s</span>", yytext); }
"="	{ printf("<span class='special'>%s</span>", yytext); }
"("	{ printf("<span class='special'>%s</span>", yytext); }
")"	{ printf("<span class='special'>%s</span>", yytext); }
("["|"<:")	{ printf("<span class='special'>%s</span>", yytext); }
("]"|":>")	{ printf("<span class='special'>%s</span>", yytext); }
"."	{ printf("<span class='special'>%s</span>", yytext); }
"&"	{ printf("<span class='special'>%s</span>", yytext); }
"!"	{ printf("<span class='special'>%s</span>", yytext); }
"~"	{ printf("<span class='special'>%s</span>", yytext); }
"-"	{ printf("<span class='special'>%s</span>", yytext); }
"+"	{ printf("<span class='special'>%s</span>", yytext); }
"*"	{ printf("<span class='special'>%s</span>", yytext); }
"/"	{ printf("<span class='special'>%s</span>", yytext); }
"%"	{ printf("<span class='special'>%s</span>", yytext); }
"<"	{ printf("<span class='special'>%s</span>", yytext); }
">"	{ printf("<span class='special'>%s</span>", yytext); }
"^"	{ printf("<span class='special'>%s</span>", yytext); }
"|"	{ printf("<span class='special'>%s</span>", yytext); }
"?"	{ printf("<span class='special'>%s</span>", yytext); }
"#"	{ printf("<span class='special'>%s</span>", yytext); }

[ ]		{printf("<span>&nbsp;</span>");} 
[\n]	{printf("<span><br></span>\n");} 
[\t]	{printf("<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>");}
[\f]	{printf("<span>&nbsp;</span>");} 
[\v]	{printf("<span>&nbsp;</span>");} 
.	{ /* */ }

%%
int main(void){ 
	printf("<!DOCTYPE html>\n");
	printf("<html>\n");
	printf("<head>\n");
	printf("<link href='style.css' rel='stylesheet' type='text/css'>\n");
	printf("<title>LEX</title>\n");
	printf("</head>\n");
	printf("<body>\n");
	yylex();
	printf("</body>\n");
	printf("</html>\n");
}
