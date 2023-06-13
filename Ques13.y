
%{

  #include<stdio.h>
 
%}
  
%token NUMBER
  
%left '+' '-'
  
%left '*' '/' 

%%
  
ArithmeticExpression: E{
  
         printf("\nResult=%d\n", $$);
  
         return 0;
  
        };
 E:E'+'E {$$=$1+$3;}
  
 |E'-'E {$$=$1-$3;}
  
 |E'*'E {$$=$1*$3;}
  
 |E'/'E {$$=$1/$3;}
  
 | NUMBER {$$=$1;}
  
 ;
  
%%
void main()
{
   printf("\nEnter Arithmetic Expression :\n");
  
   yyparse();
}
  
void yyerror()
{
}