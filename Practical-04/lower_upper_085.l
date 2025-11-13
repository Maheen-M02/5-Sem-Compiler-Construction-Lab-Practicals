%{
    #include<stdio.h>
%}

%%
[a-z] {printf("%c",yytext[0]-32); }
[A-Z] {printf("%c",yytext[0]+32); }
.|\n  {printf("%c",yytext[0]); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a word: ");
    yylex();
    return 0;
}
