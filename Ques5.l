%{
    #include <stdio.h>
    int ccount=0,wcount=0,wscount=0;
%}
%%
" " {wscount++;}
[a-zA-Z]+ {wcount++;ccount+=yyleng;}
. {ccount++;}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    extern FILE *yyin;
    yyin=fopen("input.txt","r");
    yylex();
    printf("Characters count:%d",ccount);
    printf("\nWords count:%d",wcount);
    printf("\nWhite Spaces count:%d\n",wscount);
} 
int yywrap()
{
    return 1;
}