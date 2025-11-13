%{
#include "y.tab.h"
#include <string.h>
%}

%%
"for"           return FOR;
"<="            return LTE;
">="            return GTE;
"++"            return INC;
"--"            return DEC;
"<"             return LT;
">"             return GT;
"="             return ASSIGN;
";"             return SEMI;
"("             return LPAREN;
")"             return RPAREN;
"{"             return LBRACE;
"}"             return RBRACE;
[0-9]+          { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[ \t\r\n]+      ; // Skip whitespace
.               { return yytext[0]; }  // Catch-all for unknown characters
%%

int yywrap() 
{ 
    return 1; 
}

