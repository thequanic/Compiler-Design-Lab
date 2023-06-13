%{
    #include <stdio.h>
%}
%%
^[-+]?[0-9]+ {printf("Integer");}
^[-+]?[0-9]*\.[0-9]+ {printf("Floating Point");}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    printf("Enter Input:");
    yylex();
    return 0;
} 
int yywrap()
{
    return 0;
}