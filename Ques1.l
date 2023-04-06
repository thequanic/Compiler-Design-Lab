%{
    #include <stdio.h>
    #include <stdlib.h>
    int lcount=0,scount=0,tcount=0,rcount=0;
%}
%%
\n {lcount++;}
" " {scount++;}
\t {tcount++;}
[A-Za-z0-9] {rcount++;}
%%
int main()
{
    printf("Devansh Goel 6G 23\n");
    printf("Enter Input:");
    yylex();
    printf("Num of lines:%d\n",lcount);
    printf("Num of spaces:%d\n",scount);
    printf("Num of tabs:%d\n",tcount);
    printf("Num of other characters:%d\n",rcount);
} 
int yywrap()
{
    return 1;
}
