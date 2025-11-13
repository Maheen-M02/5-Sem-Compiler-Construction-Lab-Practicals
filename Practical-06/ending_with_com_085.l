%{
    #include<stdio.h>
    int count = 0;
    int non_count = 0;
    
    void com_count(char *text)
    {
        count++;
    }
%}

%%
^.*com$   { com_count(yytext);  }
.*|\n     { non_count++;  }    
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a sentence:\n");
    yylex();
    
    printf("Sentences ending with com: %d\n", count);
    printf("Sentences not ending with com: %d\n", non_count);
    
    return 0;
}

