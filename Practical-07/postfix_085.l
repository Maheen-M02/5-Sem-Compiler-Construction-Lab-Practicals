%{
#include "y.tab.h"
%}

%%
[0-9]+      {yylval.num = atoi(yytext); return NUMBER; }
[+*/-]      {return yytext[0]; }
\n          {return '\n'; }
[\t]        {   ;   }
.           {printf("%s", yytext); }
%%

int yywrap()
{
    return 1;
}
