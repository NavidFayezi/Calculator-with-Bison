%{
#include "defs.h"
int yylex(void);
void yyerror(char *);
int temp_counter = 0;
%}


%token NUM



%%
G : | S G     ;
S : E '\n'    {if(temp_counter == 0) printf("assing %d to t1\n", $$.val);  temp_counter = 0; printf("result is : %d\n", $1.val);}
  ;
E : E '+' T   {NEW_DATA(data, $1.val + $3.val, $1.t); $$ = data; temp_counter += 1; printf("assign %d to t%d\n", $$.val, temp_counter);}
    | E '-' T {NEW_DATA(data, $1.val - $3.val, $1.t); $$ = data; temp_counter += 1; printf("assing %d to t%d\n", $$.val, temp_counter);}
    | T       {$$ = $1;}
    ;
T : T '*' F   {NEW_DATA(data, $1.val * $3.val, $1.t); $$ = data; temp_counter += 1; printf("assign %d to t%d\n", $$.val, temp_counter);}
  | T '/' F   {NEW_DATA(data, $1.val / $3.val, $1.t); $$ = data; temp_counter += 1; printf("assign %d to  t%d\n", $$.val, temp_counter);}
  | F         {$$ = $1;}
  ;
F : '(' E ')' {$$ = $2;}
  | NUM       {$$ = $1;}
  ;

%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    }
int main(void) {
  yyparse();
  return 0;
}
