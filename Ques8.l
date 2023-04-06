%{
    #include <stdio.h>
%}
%%
[" "\t]*<[\/]?[a-zA-Z]*> {fprintf(yyout,"%s",yytext);}
.  {}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    char input[100],output[100];
    printf("Enter HTML File name:");
    scanf("%s",input);
    printf("Enter Output File name:");
    scanf("%s",output);
    extern FILE *yyin,*yyout;
    yyin=fopen(input,"r");
    yyout=fopen(output,"w");
    yylex();
} 
int yywrap()
{
    return 1;
}