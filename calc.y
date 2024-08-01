    %{
        #include <stdio.h>
        int yylex();
        void yyerror(char *s);
    %}
    
    %token CALCULAR
    %token NUMBER
    
    %union {
        int value;
    }
    
    %type <value> Expr
    
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
            if ($3 == 0)
            {
                yyerror("Division por cero");
                $$ = 0;
            }
            else
            {
                $$ = $1 / $3;
            }
        }
        | '(' Expr ')'
        {
            $$ = $2;
        }
        | NUMBER
        {
            $$ = $1;
        }
    ;
    %%