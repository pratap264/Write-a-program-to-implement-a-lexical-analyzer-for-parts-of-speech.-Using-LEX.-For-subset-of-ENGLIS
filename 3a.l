%{
/*
* We expnd upon the first example by adding recognition of scane other
* parts of speech.
*/
#include<stdio.h>
%}
%%

[\t]+       /* ignore whitespace */ ;
is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go        	{ printf("%s: is a verb\n", yytext); }

very |
shrPly |
gently |
quietly |
calmly |
angrily     	{ printf ("%s: is an adverb\n" , yytext) ; }

to |
from |
behind |
above |
below |
between  { printf ("%s: is a preposition\n", yytext);}

if |
then |
and |
but |
or 		{ printf ("%s: is a conjunction\n", yytext);}

their |
my |
Your |
his |
her |
its 		{ printf("%s: is an adjective\n", yytext); }

I |
YOU |
he |
she |
we |
they 		{ printf("%s: in a pronoun\n", yytext); }

[a-zA-Z]+ {
	printf("%s: don't recognize, might be a noun\n", yytext);
}
.|\n { ECHO; /* normal default anyway */ }

%%

int yywrap(void){}
main ( )
{ 
 printf("Enter a string :- ");
 yylex();
 return 0;  
}
