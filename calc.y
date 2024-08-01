%{
    #include <stdio.h>
    #include <stdlib.h> // Para atoi
    int yylex();
    void yyerror(const char *s);
%}

%union {
    int num;
}

%token CALCULAR
%token <num> NUMBER

%type <num> Expr

%start INICIO
%left '+' '-'
%left '*' '/'


%%

INICIO
    : CALCULAR '(' Expr ')' ';'
    {
        printf("Resultado: %d\n", $3);
        return 0;
    }
;

Expr
    : Expr '+' Expr
    {
        $$ = $1 + $3;
    }
    | Expr '-' Expr
    {
        $$ = $1 - $3;
    }
    | Expr '*' Expr
    {
        $$ = $1 * $3;
    }
    | Expr '/' Expr
    {
        $$ = $1 / $3;
    }
    | NUMBER
    {
        $$ = $1;
    }
;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
