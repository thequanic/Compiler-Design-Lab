%{
    #include <stdio.h>
%}

%s A B C D
%%
<INITIAL>a {BEGIN A;}
<INITIAL>b {BEGIN C;}
<INITIAL>[^ab\n] {BEGIN D;}
<INITIAL>\n {BEGIN INITIAL; printf("Accepted\n");}
<A>a {BEGIN INITIAL;}
<A>b {BEGIN B;}
<A>[^ab\n] {BEGIN D;}
<A>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<B>a {BEGIN C;}
<B>b {BEGIN A;}
<B>[^ab\n] {BEGIN D;}
<B>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<C>a {BEGIN B;}
<C>b {BEGIN INITIAL;}
<C>[^ab\n] {BEGIN D;}
<C>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<D>a {BEGIN D;}
<D>b {BEGIN D;}
<D>[^ab\n] {BEGIN D;}
<D>\n {BEGIN INITIAL; printf("INVALID\n");}
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