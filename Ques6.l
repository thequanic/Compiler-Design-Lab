%{
    #include <stdio.h>
%}
%%
[" "\t]+ {fprintf(yyout," ");}
.|\n  {fprintf(yyout,"%s",yytext);}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    extern FILE *yyin,*yyout;
    yyin=fopen("input.txt","r");
    yyout=fopen("Output.txt","w");
    yylex();
} 
int yywrap()
{
    return 1;
}