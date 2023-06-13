%{
    #include<stdio.h>
    #include "y.tab.h"
    extern int yylval;
    extern char* yytext;
%}
ALPHA [A-Z a-z]
DIGIT [0-9]
%%
{ALPHA}({ALPHA}|{DIGIT})*  {return ID;}
{DIGIT}+                   {yylval=atoi(yytext); return ID;}
[\n \t]                    yyterminate();
.                          return yytext[0];
%%
int yywrap()
{
 return 1;
}