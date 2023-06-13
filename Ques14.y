%{
#include<stdio.h>
extern char* yytext;
%}
%token ID
%left '+' '-'
%left '*' '/'
%right NEGATIVE
%%
S:  E {printf("\n");};
E:  E '+' E {printf("+");}
    |   E '*' E {printf("*");}
    |   E '-' E {printf("-");}
    |   E '/' E {printf("/");}
    |   '(' E ')'
    |   '-' E %prec NEGATIVE {printf("-");}
    |   ID {printf(yytext);}
    ;
%%
int main(){
    yyparse();
}

int yyerror (char *msg) {
    return printf ("error YACC: %s\n", msg);
}