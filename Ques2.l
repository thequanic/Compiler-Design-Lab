%{
    #include <stdio.h>
%}
%%
^[a-zA-Z_][a-zA-Z0-9]* printf("Valid identifier");
^[^a-zA-Z_].* printf("Invalid identifier");
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
