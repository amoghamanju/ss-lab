%{
#include <stdio.h>
#include <stdlib.h>
int id=0,dig=0,key=0,op=0;
%}
%token DIGIT ID KEY OP
%%
input:
DIGIT input {dig++;}
|ID input {id++;}
|KEY input {key++;}
|OP input {op++;}
|DIGIT {dig++;}
|ID {id++;}
|KEY {key++;}
|OP {op++;}
;
%%
#include <stdio.h>
extern int yylex();
extern int ppparse();
extern FILE *yyin;
main()
{
FILE *myfile=fopen("a.c","r");
if(!myfile){
printf("i cant open a.c!");
return -1;
}
yyin=myfile;
do{
yyparse();
}while(!feof(yyin));
printf("digits=%d \n keywords=%d \n identifier=%d \n operator=%d \n",dig,key,id,op);
}
void yyerror(){
printf("EEK ,parse error!message;");
exit(-1);
}




