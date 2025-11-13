%{
    #include <stdio.h>
    #include <string.h>

    int lc = 0, sc = 0, tc = 0, ch = 0, wc = 0, kc = 0, ic = 0, cc = 0;

    char *keywords[] = {
    "sizeof", "void", "char", "int", "float", "double", "short", "long",
    "signed", "unsigned", "if", "else", "switch", "case", "default", "while",
    "for", "do", "goto", "break", "continue", "return", "auto", "static",
    "extern", "register", "const", "volatile", "enum", "struct", "typedef", "union", NULL
    };

    int isKeyword(char *str)
    {
        for(int i = 0; keywords[i] != NULL; i++)
        {
            if (strcmp(keywords[i], str) == 0)
                return 1;
        }
        return 0;
    }
%}

%%
[\n]               { lc++; ch += yyleng; }    //new line character
[ ]                { sc++; ch += yyleng; }    //space character
[\t]               { tc++; ch += yyleng; }    //tab character


"//".*             { cc++; wc++; ch += yyleng; }   //single-line comment

"/*"([^*]|\*+[^*/])*"*"+"/"   { cc++; wc++; ch += yyleng; }   //multi-line comment

[a-zA-Z_][a-zA-Z0-9_]* {
    wc++;
    ch += yyleng;
    if(isKeyword(yytext))
        kc++;
    else
        ic++;
}   //identifier or keyword

.                  { ch += yyleng; wc++; }    // Other tokens(operators, punctuators, etc.)
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a C code:\n");
    yylex();

    printf("\n---- Lexical Analysis Report ----\n");
    printf("Number of lines       : %d\n", lc);
    printf("Number of spaces      : %d\n", sc);
    printf("Number of tabs        : %d\n", tc);
    printf("Number of characters  : %d\n", ch);
    printf("Number of words       : %d\n", wc);
    printf("Number of keywords    : %d\n", kc);
    printf("Number of identifiers : %d\n", ic);
    printf("Number of comments    : %d\n", cc);

    return 1;
}
