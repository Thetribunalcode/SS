%{
#include <stdio.h>
#include<string.h>
void fail();
int noOfOperands = 0;
int noOfOperators = 0;
char operands[10][10];
char operators[10][10];
int valid = 0;
%}

%%

"(" valid++;
")"  { valid--; 
         if(valid<0) fail(); }
"+"|"*" { strcpy(operators[noOfOperators], yytext); noOfOperators++;}
[0-9]+ { strcpy(operands[noOfOperands], yytext); noOfOperands++;}
[^+*]"("[^0-9] fail();
[+*]")" fail();
%%

int  main()
{
	int i=0;
	printf("Enter a Mathematical Expression and press ctrl+d for output\n");
	yylex();
	printf("The number of operators are : %d\n The number of operands are : %d\n", noOfOperators, noOfOperands);
	if(valid==0 && noOfOperands-noOfOperators==1)
           {
		printf("Expression is valid \n");
		printf("The Operands are : \n");
		for(i=0;i<noOfOperands;i++) printf("%s\n",operands[i]);
		printf("The Operators are : \n");
		for(i=0;i<noOfOperators;i++) printf("%s\n",operators[i]);
	}
	else
 {
		printf("Invalid Expression \n");
	}
	return 0;

}
int yywrap()
{
	return 1;
	}

void fail()
{
	printf("The Expression is Invalid \n");
	exit(0);
}

