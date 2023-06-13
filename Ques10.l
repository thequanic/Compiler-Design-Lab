%{
    #include <stdio.h>
%}

%s A B C D E G F DEAD
%%
<INITIAL>a {BEGIN A;}
<INITIAL>b {BEGIN INITIAL;}
<INITIAL>[^ab\n] {BEGIN DEAD;}
<INITIAL>\n {BEGIN INITIAL; printf("Not Accepted\n");}
<A>a {BEGIN B;}
<A>b {BEGIN F;}
<A>[^ab\n] {BEGIN DEAD;}
<A>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<B>a {BEGIN C;}
<B>b {BEGIN D;}
<B>[^ab\n] {BEGIN DEAD;}
<B>\n {BEGIN INITIAL; printf("Not Aceepted\n");}
<C>a {BEGIN C;}
<C>b {BEGIN D;}
<C>[^ab\n] {BEGIN DEAD;}
<C>\n {BEGIN INITIAL; printf("Accepted\n");}
<D>a {BEGIN E;}
<D>b {BEGIN G;}
<D>[^ab\n] {BEGIN DEAD;}
<D>\n {BEGIN INITIAL; printf("Accepted\n");}
<E>a {BEGIN B;}
<E>b {BEGIN F;}
<E>[^ab\n] {BEGIN DEAD;}
<E>\n {BEGIN INITIAL; printf("Accepted\n");}
<F>a {BEGIN E;}
<F>b {BEGIN G;}
<F>[^ab\n] {BEGIN DEAD;}
<F>\n {BEGIN INITIAL; printf("Not Accepted\n");}
<G>a {BEGIN A;}
<G>b {BEGIN INITIAL;}
<G>[^ab\n] {BEGIN DEAD;}
<G>\n {BEGIN INITIAL; printf("Accepted\n");}
<DEAD>a {BEGIN DEAD;}
<DEAD>b {BEGIN DEAD;}
<DEAD>[^ab\n] {BEGIN DEAD;}
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