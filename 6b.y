%{
 #include <stdio.h>
 #include <stdlib.h>
int id=0, key=0, op=0;
 %}

%token ID KEY OP 
%%
input: ID input { id++; }
 | KEY input { key++; }
 | OP input {op++;}
 | ID { id++; }
 | KEY { key++; }
 | OP { op++;}
 ;
 %%

extern FILE *yyin;

void main() 
{
	yyin = fopen("input6b.c","r");
	yyparse();
	printf("Keywords = %d\nIdentifiers = %d\noperators = %d\n", key,id, op);
}

void yyerror()
{
	printf("Not valid");
}

