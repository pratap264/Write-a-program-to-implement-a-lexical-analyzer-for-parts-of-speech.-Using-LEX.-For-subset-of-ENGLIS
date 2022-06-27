%{
/*
* Word recognizer with a symbol table. //
*/

#include<stdio.h>

enum {
	LOOKUP = 0, /* default - looking rather than defining. */
	TEXT,
	KEYWORD,
	DATATYPE,
	CONDTIONAL,
	ITERATIVE,
	ARITHMATIC_OP
};

int state;

int add_word(int type, char *word) ;
int lookup_word(char *word) ;
%}

%%
	/* end of line, return to default state */
\n 	{ state = LOOKUP; }
	/* whenever a line starts with a reserved part of speech name */
	/* start defining words of that type */
^text { state =TEXT; }
^keyword { state = KEYWORD; }
^datatype { state = DATATYPE; }
^condtional { state = CONDTIONAL; }
^iterative { state = ITERATIVE; }
^arithmatic_op { state = ARITHMATIC_OP; }

	/* a normal word, define it or look it up */

[a-zA-Z]+ {
if (state!=LOOKUP) {
add_word(state, yytext);         /* define the current word */
} 
 else 
 {
   switch ( lookup_word(yytext) )
     {
	case TEXT: printf("%s: text \n", yytext); break;
	case KEYWORD: printf("%s: keyword \n", yytext); break;
	case DATATYPE: printf("%s: datatype\n", yytext); break;
	case CONDTIONAL: printf("%s:condtional\n", yytext); break;
	case ITERATIVE: printf("%s:iterative \n", yytext); break;
	case ARITHMATIC_OP: printf("%s: arithmatic_op \n", yytext); break;
	default:
	printf ( "%s: Don't recognize\n" , yytext) ;
	break;
  	 }
  }
}
. /* ignore anything else */ ;
%%
int yywrap(void){}
int main( )
{ 
 printf("Enter a string :- \n");
 printf("\n");
 yylex();
 return 0;  
}

/* define a linked l i s t of words and types */
struct word {
char *word_name;
int word_type;
struct word *next;
};

struct word *word_list; /* first element in word l i s t */
extern void *malloc() ;

int
add_word(int type, char *word)
{
  struct word *wp;
if(lookup_word(word) != LOOKUP) {
printf("!!! warning: word %s already defined \n", word);
return 0;
}
/* word not there, allocate a new entry and link it on the list */

wp = (struct word *) malloc(sizeof(struct word) ) ;
wp->next=word_list;
/* have to copy the word itself as well */

wp->word_name = (char *)malloc(strlen (word)+1);
strcpy (wp->word_name, word);
wp->word_type = type;
word_list = wp;
return 1; /* itworked */
}

int
lookup_word (char *word)
{
struct word *wp = word_list;

/* search down the l i s t looking for the word */
for(; wp; wp = wp->next) {

if(strcmp(wp->word_name, word) == 0)
return wp->word_type;
}
return LOOKUP; /* not found */
}
