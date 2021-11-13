%{
#include<stdio.h>

%}

DIGIT[0-9]
NUMBER {DIGIT}*
REAL {DIGIT}*[.]{NUMBER}
TEXT [A-Za-z]
KEYWORDS "auto"|"break"|"enum"|"struct"|"typedef"
DATATYPE "int"|"float"|"double"|"long"|"void"|"unsigned char"
CONDTIONAL "if"|"else"|"else if"|"switch"|"case"
ITERATIVE "for"|"while"|"do"
SEMICOLAN ";"
IDENTIFIER {TEXT}({DIGIT}|{TEXT}|"_")*
NONIDENTIFIER {DIGIT}({TEXT}|{DIGIT}|"_")*
ARITHMATIC_OP "+"|"-"|"/"|"%"|"*";
LOGICAL_OP "&&"|"||"|"!"|"!="
RELEATIONAL_OP "<"|">"|"<="|">="|"=="
UNARY "++"|"--"
FUNCTION {ACCESS}{DATATYPE}{IDENTIFER}"("({DATATYPE}{IDENTIFIER})*")"

%%

[  \n\t]+ ;
{CONDTIONAL} {printf("%s\t==> CONDTIONAL \n",yytext);}
{ITERATIVE} {printf("%s\t==> ITERATIVE \n",yytext);}
{DATATYPE} {printf("%s\t==> DATATYPE\n",yytext);}
{KEYWORDS} {printf("%s\t==> KEYWORDS \n",yytext);}
{IDENTIFIER} {printf("%s\t==> IDENTIFIER \n",yytext);}
{REAL} {printf("%s\t==> REAL \n",yytext);}
{NUMBER} {printf("%s\t==> NUMBER \n",yytext);}
{NONIDENTIFIER} {printf("%S\t==> NONIDENTIFIER \n",yytext);}
{SEMICOLAN} {printf("%s\t==> SEMICOLAN \n",yytext);}
{UNARY} {printf("%s\t==> UNARY \n",yytext);}
{ARITHMATIC_OP} {printf("%s\t==> ARITHMATIC_OP \n",yytext);}
{LOGICAL_OP} {printf("%s\t==> LOGICAL OP \n",yytext);}
{RELEATIONAL_OP} {printf("%s\t==> RELEATIONAL OP \n",yytext);}
"=" {printf("%s\t==> ASSIGNMENT OP \n",yytext);}
"{" {printf("%s\t==> BLOCK BEGIN \n",yytext);}
"}" {printf("%s\t==> BLOCK END \n",yytext);}
"(" {printf("%s\t==> PARATHRSIS BEGIN \n",yytext);}
")" {printf("%s\t==> PARATHRSIS END \n",yytext);}
. ;

%%
int yywrap(void){}
main ( )
{ 
 printf("Enter a string :- ");
 yylex();
 return 0;  
} 
