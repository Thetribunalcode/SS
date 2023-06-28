%{
#include <stdio.h>
int aCount=0,n;
%}
%token A
%token B
%%
s : X B {   if (aCount<n || aCount>n) 
	    {
	YYFAIL();
}
 }
X : X T | T
T : A { aCount++;} 
  ;
%%

int main()
{	printf("Enter the value of n \n");
scanf("%d",&n);
	printf("Enter the string\n");
	yyparse();
	printf("Valid string\n");
}

int YYFAIL()
{
	printf("Invalid count of 'a'\n");
	exit(0);
}

int yyerror()
{
	printf("Invalid string\n");
	exit(0);
}

