%{
#include "defs.h"
#include "y.tab.h"
void yyerror(char *);
%}



%%

[0-9]+  {
        NEW_DATA(data, atoi(yytext), 0);
        yylval = data;
        return NUM;}

[-+*/)(\n]  {return *yytext;}

[ \t]   ;

.       yyerror("invalid character");

%%

int yywrap(void) { return 1; }
