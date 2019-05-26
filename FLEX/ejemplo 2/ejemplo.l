%{
    #include<stdio.h>
    int cc = 0, cl = 0;
    int num_lines = 0, num_chars = 0;
%}

%%
\n { ++num_lines; ++num_chars; }
.  { ++num_chars; }

%%
int main(){
    yylex();
    printf( "# de caracteres = %d, # de lineas = %d\n", num_chars, num_lines);
}