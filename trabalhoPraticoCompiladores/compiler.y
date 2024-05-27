%{
#include "nodes.h"

int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT
%token TOK_ESCREVA
%token TOK_FLOAT
%token TOK_INTEIRO
%token TOK_FOR
%token TOK_SE
%token TOK_SENAO
%token TOK_WHILE
%token TOK_AND
%token TOK_OR
%token TOK_TRUE
%token TOK_FALSE

%start program

%%

program : globals ;

globals : globals global
        | global
        ;

global : TOK_IDENT '=' expr ';'
       | TOK_IDENT '=' ident_boolean ';'
       | TOK_ESCREVA '>' TOK_IDENT ';'
       | TOK_SE condicao '{' globals '}' segundacondicao
       | TOK_SE condicao '{' globals '}'
       | TOK_WHILE condicao '{' globals '}' ';'
       | TOK_FOR conditionfor '{' globals '}'
       ;

conditionfor : '(' TOK_IDENT '=' expr ';' condicao ';' TOK_IDENT '=' expr ')'
       ;

segundacondicao : TOK_SENAO condicao '{' globals '}' segundacondicao
                | TOK_SENAO '{' globals '}'
                ;

condicao : '(' condicao ')'
         | exprRelacional logical
         | exprRelacional
         | boolean   
         ;

exprRelacional : expr '<' expr
              | expr '>' expr
              | expr '=''=' expr
              | expr '<''=' expr
              | expr '>''=' expr
              | expr '!''=' expr
              ;

logical : TOK_OR condicao
        | TOK_AND condicao
        ;
     
boolean : TOK_TRUE
        | TOK_FALSE
        ;

ident_boolean : boolean ;

expr : expr '+' term
     | expr '-' term
     | term
     ;

term : term '*' factor
     | term '/' factor
     | factor
     ;

factor : '(' expr ')'
       | TOK_IDENT
       | TOK_INTEIRO
       | TOK_FLOAT
       | unary
       ;      

unary : '-' factor
      ;

%%
