%{
int yystopparser=0;
%}
 
 
%token PRENTERO PRREAL PRBOOLEANO PRCARACTER PRSI PRSINO PRSINOSI PRENTONCES PRFINSI PRPARA  
PRFINPARA PRMIENTRAS PRHACER PRFINMIENTRAS PRFINHACERMIENTRAS PRFUNCION PRFINFUNCION PRRETORNA PRSINVALOR PRESTRUCTURA MAS MENOS POR ENTRE OLOG YLOG  
PRDEFINIR PRCONSTANTE IDENT ENTERO REAL BOOLEANO CARACTER COMPARADOR ASIG PCOMA DIF COMA IGUAL PTO   
MAIGU MEIGU PARIZ PARDE MAYOR MENOR LLIZ LLDE PRSALIDA PRENTRADA
%start inicio
 
%%
inicio  : funcion
  | constante 
  | estructura
  ;
 
estructura : PRESTRUCTURA IDENT LLIZ n
n  : declaracion n
  | declaracion nn
nn  : LLDE IDENT PCOMA o
o  : estructura
  | constante
  | funcion
  ;
 
constante : PRDEFINIR PRCONSTANTE e
e  : PRENTERO IDENT f
  | PRREAL IDENT f
  | PRBOOLEANO IDENT f
f  : ASIG g
g  : ENTERO PCOMA y
  | REAL PCOMA y
  | BOOLEANO PCOMA y
y  : constante
  | estructura 
  | funcion  
  ; 
 
funcion  : PRFUNCION j
j  : PRENTERO k
  | PRREAL k
  | PRBOOLEANO k
  | PRCARACTER k
  | PRSINVALOR k
k  : IDENT PARIZ l
l  : kl
kl  : declaracion l
  | ll
ll  : PARDE sentencia m
m  : PRRETORNA IDENT p
  | p
p  : PRFINFUNCION funcion
  | PRFINFUNCION 
  ;
 
comparacion : IDENT COMPARADOR b
b  : IDENT
  | REAL
  | ENTERO
  | BOOLEANO
  ;
 
declaracion : PRENTERO c
  | PRREAL c
  | PRBOOLEANO c
  | PRCARACTER c
c  : IDENT PCOMA
  ;
 
asignacion  : IDENT ASIG a
a  : IDENT PCOMA
  | ENTERO PCOMA 
  | REAL PCOMA
  | BOOLEANO PCOMA
  | oparitmetica PCOMA
  ;
 
mientras : PRMIENTRAS PARIZ x
x  : comparacion y
  | oplogica y
y  : PARDE sentencia PRFINMIENTRAS
  ;
 
hacermientras : PRHACER sentencia PRFINHACERMIENTRAS PRMIENTRAS PARIZ cc
cc  : comparacion PARDE
  | oplogica PARDE
  ;
 
para  : PRPARA PARIZ asignacion comparacion PCOMA asignacion PARIZ sentencia PRFINPARA
  ;
 
si  : PRSI PARIZ sh
sh  : comparacion shh
  | oplogica shh
shh  : PARDE PRENTONCES sentencia h
h  : PRFINSI
  | PRSINOSI PARIZ comparacion PARDE PRENTONCES sentencia i
i  : h
  | z
z  : PRSINO PRENTONCES sentencia PRFINSI
  ;
 
sentencia : declaracion sentencia 
  | declaracion 
  | asignacion sentencia 
  | asignacion
  | mientras sentencia 
  | mientras
  | hacermientras sentencia 
  | hacermientras 
  | para sentencia
  | para
  | si sentencia 
  | si
  | entrada sentencia
  | entrada
  | salida sentencia
  | salida
  ;
 
salida  : PRSALIDA ASIG LLIZ LLDE PCOMA
  ;
 
entrada  : PRENTRADA IDENT PCOMA
  ;
 
oparitmetica : MAS PARIZ q
  | POR PARIZ q
  | suma
  | producto
q  : oparitmetica PARDE r
suma  : MAS r t
producto : POR r t
t  : r u
u  : t
  | 
r  : IDENT
  | REAL
  | ENTERO
  ;
 
 
oplogica : OLOG PARIZ qq
  | YLOG PARIZ qq
  | yy
  | oo
qq  : oplogica PARDE rr
oo  : OLOG rr tt
yy  : YLOG rr tt
tt  : rr uu
uu  : tt
  | 
rr  : comparacion 
  ;



