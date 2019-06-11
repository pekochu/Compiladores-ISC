%{
   #include <stdio.h>
   #include <stdlib.h>
   #include "parse.h"  
%}
%option noyywrap
%option yylineno
letra [a-zA-Z]
digito [0-9]
binario [0-1]
ignora " "|\t|\n
operarit *|+|-|/
operlog &|$
comparador <|>|<=|>=|==|!=
%%
{ignora}+                    {;}
"Entero"                     {printf("Palabra reservada para tipo de dato entero\n");return PRENTERO;}
"Real"                       {printf("Palabra reservada para tipo de dato real\n");return PRREAL;}
"Booleano"                   {printf("Palabra reservada para tipo de dato booleano\n");return PRBOOLEANO;}
"Caracter"                   {printf("Palabra reservada para tipo de dato caracter\n");return PRCARACTER;}
"Si"                         {printf("Palabra reservada para condicional\n");return PRSI;}
"Sino"                       {printf("Palabra reservada para otro condicional\n");return PRSINO;}
"SinoSi"                     {printf("Palabra reservada para definir condicionales secundarias\n");return PRSINOSI;}
"Entonces"                   {printf("Palabra reservada para definir accion a realizar\n");return PRENTONCES;}
"FinSi"                      {printf("Palabra reservada finalizar condicional\n");return PRFINSI;}
"Para"                       {printf("Palabra reservada para bucle de tipo Para\n");return PRPARA;}
"FinPara"                    {printf("Palabra reservada para fin de bucle de tipo Para\n");return PRFINPARA;}
"Mientras"                   {printf("Palabra reservada para bucle de tipo Mientras\n");return PRMIENTRAS;}
"Hacer"                      {printf("Palabra reservada para indicar que se empieza algo\n");return PRHACER;}
"FinMientras"                {printf("Palabra reservada fin de bucle de tipo Mientras\n");return PRFINMIENTRAS;}
"FinHacerMientras"           {printf("Palabra reservada para indicar fin de bucle Hacer-Mientras\n");return PRFINHACERMIENTRAS;}
"Funcion"                    {printf("Palabra reservada para declaracion de funciones\n");return PRFUNCION;}
"Estructura"                 {printf("Palabra reservada para declaracion de estructuras\n");return PRESTRUCTURA;}
"FinFuncion"                 {printf("Palabra reservada para finalizar funcion\n");return PRFINFUNCION;}
"Retorna"                    {printf("Palabra reservada para retorno de funcion\n");return PRRETORNA;}
"SinValor"                   {printf("Palabra reservada para funcion sin valor de retorno\n");return PRSINVALOR;}
"Definir"                    {printf("Palabra reservada para definir funciones\n");return PRDEFINIR;}
"Constante"                  {printf("Palabra reservada para definir constantes\n");return PRCONSTANTE;}
"Entrada"                    {printf("Palabra reservada para definir entradas\n");return PRENTRADA;}
"Salida"                     {printf("Palabra reservada para definir salidas\n");return PRSALIDA;}
{letra}({letra}|{digito})*   {printf("Identificador\n");return IDENT;}
{letra}+                     {printf("Caracter\n");return CARACTER;}
{binario}+                   {printf("Binario\n");return BOOLEANO;} 
{digito}+                    {printf("Entero\n");return ENTERO;}
{digito}+"."{digito}+        {printf("Real\n");return REAL;}
{comparador}                 {printf("Comparador\n");return COMPARADOR;}
":="                         {printf("Asignador\n");return ASIG;}
";"                          {printf("Fin sentencia\n");return PCOMA;}
"!="                         {printf("Diferente\n");return DIF;}
","              {printf("Coma\n");return COMA;}
"=="                         {printf("Igual\n");return IGUAL;}
"."                          {printf("Punto\n");return PTO;}
">="                         {printf("Signo mayor-igual\n");return MAIGU;}
"<="                         {printf("Signo menor-igual\n");return MEIGU;}
"("                          {printf("(\n");return PARIZ;}
")"                          {printf(")\n");return PARDE;}
">"                          {printf(">\n");return MAYOR;}
"<"                          {printf("<\n");return MENOR;}
"{"                          {printf("{\n");return LLIZ;}
"}"                          {printf("}\n");return LLDE;}
"+"                          {printf("+\n");return MAS;}
"-"                          {printf("-\n");return MENOS;}
"*"                          {printf("*\n");return POR;}
"/"                          {printf("/\n");return ENTRE;}
"&"                          {printf("&\n");return YLOG;}
"$"                          {printf("Operador Logico\n");return OLOG;}
.                            {printf("ERROR LEXICO EN LINEA %d \n",yylineno);}
%%
int main(int argc,char *argv[])
{
 /*
 if ((yyin = fopen(argv[1], "rt")) == NULL)
 {
  printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
 }
 else
 {
  //yylex();
  yyparse();
 }
 fclose(yyin);
 return 0;*/


  yyparse();
 }




