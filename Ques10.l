%{
    #include <stdio.h>
%}

%s A B C D E
%%
<INITIAL>a {BEGIN A;}
<INITIAL>b {BEGIN INITIAL;}
<INITIAL>[^ab\n] {BEGIN E;}
<INITIAL>\n {BEGIN INITIAL; printf("Not Accepted\n");}
<A>a {BEGIN B;}
<A>b {BEGIN B;}
<A>[^ab\n] {BEGIN E;}
<A>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<B>a {BEGIN C;}
<B>b {BEGIN D;}
<B>[^ab\n] {BEGIN E;}
<B>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<C>a {BEGIN C;}
<C>b {BEGIN INITIAL;}
<C>[^ab\n] {BEGIN E;}
<C>\n {BEGIN INITIAL; printf("Accepted\n");}
<D>a {BEGIN A;}
<D>b {BEGIN INITIAL;}
<D>[^ab\n] {BEGIN E;}
<D>\n {BEGIN INITIAL; printf("Accepted\n");}
<E>a {BEGIN E;}
<E>b {BEGIN E;}
<E>[^ab\n] {BEGIN E;}
<E>\n {BEGIN INITIAL; printf("INVALID\n");}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    yylex();
} 
int yywrap()
{
    return 1;
}