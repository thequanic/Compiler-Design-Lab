%{
    #include <stdio.h>
    #include "y.tab.h"
%}
%%
[A-Za-z_][0-9a-zA-Z_]* return ID ;
[0-9]* return INT ;
[0-9]*\.[0-9]+ return FLOAT ;
[\t] ;
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
    return 1;
}