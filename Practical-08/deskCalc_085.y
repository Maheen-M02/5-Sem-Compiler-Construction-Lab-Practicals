%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void yyerror(const char *s);
int yylex(void);
%}

%union
{
    int num;
}

%token <num> NUMBER
%type <num> expr

%left '+' '-'
%left '*' '/'
%right '^'

%%
line:
     line expr '\n'   { printf("Result: %d\n", $2); }
     |
     ;

expr:
     NUMBER           { $$ = $1; }
     | expr '+' expr  { $$ = $1 + $3; }
     | expr '-' expr  { $$ = $1 - $3; }
     | expr '*' expr  { $$ = $1 * $3; }
     | expr '/' expr  {
                        if($3 == 0)
                        {
                            yyerror("Division by zero");
                            $$ = 0;
                        }
                        else
                            $$ = $1 / $3;
                      }
      | expr '^' expr { $$ = (int) pow($1, $3); }
      | '(' expr ')'  { $$ = $2; }
      ;
%%


void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Simple Desk Calculator (Ctrl+D to exit)\n");
    printf("Enter expressions:\n");
    yyparse();
    
    return 0;
}


