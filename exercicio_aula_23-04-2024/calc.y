
%{
int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT 
%token TOK_PRINT
%token TOK_FLOAT
%token TOK_INT

%start program

%%

program : ;	

%%
