%{
  #include<stdio.h>
%} 
%token NUMBER 
%left '+' '-'
%left '*' '/' '%'
%right NEGATIVE
%%
ArithmeticExpression: E{
  
         printf("\nResult=%d\n", $$);
  
         return 0;
  
        };
 E:E'+'E {$$=$1+$3;} 
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'-' E %prec NEGATIVE {$$=-$2;}
 | NUMBER {$$=$1;}
  
 ;
  
%%
void main()
{
   printf("\nEnter Arithmetic Expression :\n");
  
   yyparse();
}

int yyerror (char *msg) {
    return printf ("error YACC: %s\n", msg);
}