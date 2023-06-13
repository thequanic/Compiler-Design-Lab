%{
    #include <stdio.h>
%}

%s A B C DEAD
%%
<INITIAL>[0-9] {BEGIN A;}
<INITIAL>[a-zA-Z_] {BEGIN B;}
<INITIAL>\. {BEGIN C;}
<INITIAL>[^a-zA-Z_0-9\.\n] {BEGIN DEAD;}
<INITIAL>\n {BEGIN INITIAL; printf("Not Accepted\n");}
<A>[0-9] {BEGIN A;}
<A>\. {BEGIN C;}
<A>[^0-9\.\n] {BEGIN DEAD;}
<A>\n {BEGIN INITIAL; printf("Integer\n");}
<B>[a-zA-Z0-9_] {BEGIN B;}
<B>[^a-zA-Z0-9_\n] {BEGIN DEAD;}
<B>\n {BEGIN INITIAL; printf("Identifier\n");}
<C>[0-9] {BEGIN C;}
<C>[^0-9\n] {BEGIN DEAD;}
<C>\n {BEGIN INITIAL; printf("Floating Point\n");}
<DEAD>[^\n] {BEGIN DEAD;}
<DEAD>\n {BEGIN INITIAL; printf("INVALID\n");}
%%
int main()
{
    yylex();
} 
int yywrap()
{
    return 1;
}