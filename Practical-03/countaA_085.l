%{
    #include<stdio.h>
    int wca = 0; 
%}

%%
[aA][a-zA-Z0-9_]*     { wca++; }
[a-zA-Z0-9_]+         { ;}
[ \t\n]+              { ;}
.                     { ;}
%%

int main()
{
    printf("Enter a sentence: ");
    yylex();
    printf("Number of words starting with 'A' are : %d\n", wca);
    return 1;
}
