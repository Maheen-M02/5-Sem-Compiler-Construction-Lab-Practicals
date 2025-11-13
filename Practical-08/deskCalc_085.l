%{
#include "y.tab.h"
%}

%%
[0-9]+   { yylval.num = atoi(yytext); return NUMBER; }
[ \t]    { ; }
"+"      { return '+'; }
"-"      { return '-'; }
"*"      { return '*'; }
"/"      { return '/'; }
"^"      { return '^'; }
"("      { return '('; }
")"      { return ')'; }
"\n"     { return '\n'; }
.        { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}

