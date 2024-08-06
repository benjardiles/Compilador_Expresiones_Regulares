%{
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"
void showError();
%}

numbers ([0-9])+ 

%%

{numbers}      { yylval.number = atoi(yytext); return (NUM); }
"+"            { return PLUS; }
"-"            { return MINUS; }
";"            { return SEMICOLON; }
[ \t\n]        { /* Ignorar espacios, tabulaciones y nuevas líneas */ }
.              { showError(); }

%%

void showError(){
    printf("Other input\n");
}

int yywrap(){
    return 1;
}
