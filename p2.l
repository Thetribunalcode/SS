%{
#include<stdio.h>
#include<string.h>
int comcount  =0;
%}
%s COMMENT
%%
"/*" {BEGIN(COMMENT);}
<COMMENT>"*/" {BEGIN(0); comcount++;}
<COMMENT>. {;}
"//".* {comcount++;}
.|\n {fprintf(yyout,"%s",yytext);}
%%
void main()
{
	yyin = fopen("input.c","r");
	yyout = fopen("output.c","w");	
	yylex();
	printf("The number of comment lines are: %d\n",comcount);
}
int yywrap()
{
	return 1;
}
