%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%union
{
    int num;
}

%token <num> NUMBER
%type <num> expr

%%
line:
     line expr '\n'  { printf("Result: %d\n", $2); }
     |
     ;
expr:
     NUMBER 	     { $$ = $1; }
     |expr expr '+'  { $$ = $1 + $2; }
     |expr expr '-'  { $$ = $1 - $2; }
     |expr expr '*'  { $$ = $1 * $2; }
     |expr expr '/'  { 
     		       if($2 == 0)
     		       {
     		           printf("Error: Division by zero\n");
     		           exit(1);
     		       }
     		       $$ = $1 / $2; 
     		     }
     ;
%%

void yyerror(const char *s)
{
    fprintf(stderr,"Error: %s\n",s);
}

int main()
{
    printf("Enter a postfix expression (eg, 3 4 +):\n");
    yyparse();
    return 0;
}


