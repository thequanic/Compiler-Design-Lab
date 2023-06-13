%{
  #include<stdio.h>
  int flag=0;
%}  
%token ID INT FLOAT
%left '+' '-'
%left '*' '/'
%%
 E:E'+'E 
 |E'-'E 
 |E'*'E 
 |E'/'E
 | ID 
 | INT 
 | FLOAT 
 ;
%%
void main()
{
   printf("\nEnter Arithmetic Expression :\n");
   yyparse();
   if(flag==0)
   printf("\nEntered arithmetic expression is Valid\n\n");
}
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}