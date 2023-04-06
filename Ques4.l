%{
    #include <stdio.h>
%}
%%
int|float|char|struct|return|break|continue|void|for|while|unsigned|long|double|extern|enum|default|auto|register|typedef|sizeof|short|switch|case|if|else|volatile {printf("KEYWORD ");}
^[a-zA-Z_][a-zA-Z0-9]* printf("IDENTIFIER ");
[{}();,] printf("SEPARATOR ");
[+-/=*%] printf("OPERATOR ");
.|\n {}
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
    return 1;
}
