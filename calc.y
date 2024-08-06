%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%union {
    int number;
}

%token <number> NUM
%token PLUS MINUS SEMICOLON
%type <number> expr term

%%

prog:
    stmts
;

stmts:
    stmt SEMICOLON stmts
    | stmt SEMICOLON
;

stmt:
    expr {
        printf("Resultado: %d\n", $1);
    }
;

expr:
    expr PLUS term {
        $$ = $1 + $3;
    }
    | expr MINUS term {
        $$ = $1 - $3;
    }
    | term {
        $$ = $1;
    }
;

term:
    NUM {
        $$ = $1;
    }
;

%%

int yyerror(char *s)
{
    printf("Syntax Error: %s\n", s);
    return 0;
}

int main()
{
    printf("Ingrese una expresión:\n");
    yyparse();
    return 0;
}
