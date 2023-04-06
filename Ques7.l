%{
    #include <stdio.h>
%}
%%
[" "\t]*\/\/[a-zA-Z0-9" "\t]* {fprintf(yyout,"");}
[" "\t]*\/\*[a-zA-Z0-9" "\t\n]*\*\/ {fprintf(yyout,"");}
.|\n  {fprintf(yyout,"%s",yytext);}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    extern FILE *yyout;
    yyout=fopen("out.c","w");
    yylex();
} 
int yywrap()
{
    return 1;
}