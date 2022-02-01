
D			[0-9] 
L			[a-zA-Z_]  
H			[a-fA-F0-9]   
E			[Ee][+-]?{D}+  
FS			(f|F|l|L)   
IS			(u|U|l|L)*   


%{
#include <stdio.h>
#include "y.tab.h"
void Count();
%}


%%
"#"	     		{single_line_comment();}



"break"			{ Count(); printf("BREAK         ");  return(BREAK);}
"case"  		{ Count(); printf("CASE          ");  return(CASE);}
"continue"		{ Count(); printf("CONTINUE      ");  return(CONTINUE);}
"else"			{ Count(); printf("ELSE          ");  return(ELSE);}
"for"			{ Count(); printf("FOR           ");  return(FOR);}
"if"			{ Count(); printf("IF            ");  return(IF);}
"return"		{ Count(); printf("RETURN        ");  return(RETURN);}
"class" 		{ Count(); printf("CLASS         ");  return(CLASS);}
"match"		    { Count(); printf("MATCH         ");  return(MATCH);}
"type"   		{ Count(); printf("TYPE          ");  return(TYPE);}
"union"			{ Count(); printf("UNION         ");  return(UNION);}
"while"			{ Count(); printf("WHILE         ");  return(WHILE);}
"yield"         { Count(); printf("YIELD         ");  return(YIELD);}
"as"            { Count(); printf("AS            ");  return(AS);}
"assert"        { Count(); printf("ASSERT        ");  return(ASSERT);}
"def"           { Count(); printf("FUNCTION      ");  return(DEF);}
"del"           { Count(); printf("DELETE        ");  return(DEL);}
"from"          { Count(); printf("FROM          ");  return(FROM);}
"in"            { Count(); printf("IN            ");  return(IN);}
"is"            { Count(); printf("IS            ");  return(IS);}
"lambda"        { Count(); printf("LAMBDA        ");  return(LAMBDA);}
"elif"          { Count(); printf("ELIF          ");  return(ELIF);}
"except"        { Count(); printf("EXCEPT        ");  return(EXCEPT);}
"False"         { Count(); printf("FALSE         ");  return(FALSE);}
"finally"       { Count(); printf("FINALLY       ");  return(FINALLY);}
"raise"         { Count(); printf("RAISE         ");  return(RAISE);}
"True"          { Count(); printf("TRUE          ");  return(TRUE);}
"pass"          { Count(); printf("PASS          ");  return(PASS);}
"try"           { Count(); printf("TRY           ");  return(TRY);}
"nonlocal"      { Count(); printf("NONLOCAL      ");  return(NONLOCAL);}
"global"        { Count(); printf("GLOBAL        ");  return(GLOBAL);}
"None" 			{ Count(); printf("NONE          ");  return(NONE);}
"with"			{ Count(); printf("WITH          ");  return(WITH);}
"import"		{ Count(); printf("IMPORT        ");  return(IMPORT);}
"range"		    { Count(); printf("RANGE         ");  return(RANGE);}
"print"		    { Count(); printf("PRINT         ");  return(PRINT);}
"strip"		    { Count(); printf("STRIP         ");  return(STRIP);}
"input"		    { Count(); printf("INPUT         ");  return(INPUT);}
"id"		    { Count(); printf("ID            ");  return(ID);}
"abs"		    { Count(); printf("ABS           ");  return(ABS);}
"bin"		    { Count(); printf("BIN           ");  return(BIN);}
"bool"		    { Count(); printf("BOOL          ");  return(BOOL);}
"chr"			{ Count(); printf("CHARACTER     ");  return(CHR);}
"ord"			{ Count(); printf("ORD_ASCII     ");  return(ORD);}
"delattr"	    { Count(); printf("DELETE_ATTR   ");  return(DELATTR);}
"getattr"		{ Count(); printf("GET_ATTR      ");  return(GETATTR);}
"hex"			{ Count(); printf("HEX           ");  return(HEX);}
"oct"			{ Count(); printf("OCT           ");  return(OCT);}
"iter"			{ Count(); printf("ITERATOR      ");  return(ITER);}
"map"			{ Count(); printf("MAP           ");  return(MAP);}
"max"			{ Count(); printf("MAXIMUM       ");  return(MAX);}
"hasattr"		{ Count(); printf("HAS_ATTRIBUTE ");  return(HASATTR);}
"pow"			{ Count(); printf("POWER         ");  return(POW);}
"reversed"		{ Count(); printf("REVERSED      ");  return(REVERSED);}
"min"			{ Count(); printf("MINIMUM       ");  return(MIN);}
"round"			{ Count(); printf("ROUND         ");  return(ROUND);}
"sorted"		{ Count(); printf("SORTED        ");  return(SORTED);}
"sum"			{ Count(); printf("SUM           ");  return(SUM);}
"zip"			{ Count(); printf("ZIP           ");  return(ZIP);}
"and"			{ Count(); printf("AND_OP        "); return(AND_OP);}
"or"			{ Count(); printf("OR_OP         "); return(OR_OP);}
"not"		    { Count(); printf("NOT           "); return(NOT_EQU);}
"int"			{ Count(); printf("INT           ");  return(INT);}
"float"			{ Count(); printf("FLOAT         ");  return(FLOAT);}
"complex"		{ Count(); printf("COMPLEX       ");  return(COMPLEX);}
"next"			{ Count(); printf("NEXT      	 ");  return(NEXT);}
"list"			{ Count(); printf("LIST      	 ");  return(LIST);}
"len"			{ Count(); printf("LEN     	 	 ");  return(LEN);}
"sort"			{ Count(); printf("SORT      	 ");  return(SORT);}
"reverse"		{ Count(); printf("REVERSE       ");  return(REVERSE);}
"count"			{ Count(); printf("COUNT      	 ");  return(COUNT);}
"index"			{ Count(); printf("INDEX      ");  return(INDEX);}
"find"			{ Count(); printf("FIND      ");  return(FIND);}
"self"			{ Count(); printf("SELF      ");  return(SELF);}
"__init__"		{ Count(); printf("__INIT__    ");  return(__INIT__);}


{L}({L}|{D})*	{ Count(); printf("IDENTIFIER    "); return(IDENTIFIER);}

0[xX]{H}+{IS}?	{ Count(); printf("CONSTANT      "); return(CONSTANT);}
0{D}+{IS}?		{ Count(); printf("CONSTANT      "); return(CONSTANT);}
{D}+{IS}?		{ Count(); printf("CONSTANT      "); return(CONSTANT);}
{D}+{E}{FS}?	{ Count(); printf("CONSTANT      "); return(CONSTANT);}
{D}*"."{D}+({E})?{FS}?	{ Count();printf("CONSTANT      "); return(CONSTANT);}
{D}+"."{D}*({E})?{FS}?	{ Count();printf("CONSTANT      "); return(CONSTANT);}
L?'(\\.|[^\\'])+'	    { Count();printf("STRING_LITERAL"); return(STRING_LITERAL);}


L?\"(\\.|[^\\"])*\"	{ Count();printf("STRING_LITERAL"); return(STRING_LITERAL); }
L?\'''(\\.|[^\\'])*\'''	{ Count();printf("STRING_LITERAL"); return(STRING_LITERAL); }



">>="			{ Count(); printf("RIGHT_ASSIGN	 "); return(RIGHT_ASSIGN);}
"<<="			{ Count(); printf("LEFT_ASSIGN   "); return(LEFT_ASSIGN);}
"+="			{ Count(); printf("ADD_ASSIGN    "); return(ADD_ASSIGN);}
"-="			{ Count(); printf("SUB_ASSIGN    "); return(SUB_ASSIGN);}
"*="			{ Count(); printf("MUL_ASSIGN    "); return(MUL_ASSIGN);}
"/="			{ Count(); printf("DIV_ASSIGN    "); return(DIV_ASSIGN);}
"%="			{ Count(); printf("MOD_ASSIGN    "); return(MOD_ASSIGN);}
"&="			{ Count(); printf("AND_ASSIGN    "); return(AND_ASSIGN);}
"^="			{ Count(); printf("XOR_ASSIGN    "); return(XOR_ASSIGN);}
"|="			{ Count(); printf("OR_ASSIGN     "); return(OR_ASSIGN);}
">>"			{ Count(); printf("RIGHT_OP      "); return(RIGHT_OP);}
"<<"			{ Count(); printf("LEFT_OP       "); return(LEFT_OP);}
"<="			{ Count(); printf("LE_OP         ");return(LE_OP);}
">="			{ Count(); printf("GE_OP         "); return(GE_OP);}
"=="			{ Count(); printf("EQ_OP         "); return(EQ_OP);}
"!="			{ Count(); printf("NE_OP         ");return(NE_OP); }
","				{ Count();printf("%s             ",yytext); return(',');}
":"				{ Count();printf("%s             ",yytext); return(':');}
"="				{ Count();printf("%s             ",yytext); return('=');}
"("				{ Count();printf("%s             ",yytext); return('(');}
")"				{ Count();printf("%s             ",yytext); return(')');}
("[")		    { Count();printf("%s             ",yytext); return('[');}
("]")		    { Count();printf("%s             ",yytext); return(']');}
"."			    { Count();printf("%s             ",yytext); return('.');}
"&"			    { Count();printf("%s             ",yytext); return('&');}
"~"			    { Count();printf("%s             ",yytext); return('~');}
"-"			    { Count();printf("%s             ",yytext); return('-');}
"+"			    { Count();printf("%s             ",yytext); return('+');}
"*"			    { Count();printf("%s             ",yytext); return('*');}
"**"		    { Count();printf("%s             ",yytext); return('**');}
"/"			    { Count();printf("%s             ",yytext); return('/');}
"//"		    { Count();printf("%s             ",yytext); return(INT_DIV);}
"%"			    { Count();printf("%s             ",yytext); return('%');}
"<"			    { Count();printf("%s             ",yytext); return('<');}
">"			    { Count();printf("%s             ",yytext); return('>');}
"^"			    { Count();printf("%s             ",yytext); return('^');}
"|"			    { Count();printf("%s             ",yytext); return('|');}
"?"			    { Count();printf("%s             ",yytext); return('?');}

[ \t\v\n\f]		{ Count(); }
.			{ Count(); printf("UNKNOWN       "); return yytext[0]; }

%%


yywrap()
{
	return(1);
}

int column = 0;
int line=1;





single_line_comment()
{
	char c;
	while ((c = input()) != '\n' && c != 0);
	column=0;
	line++;
}	





int col_start = 0;
void Count()
{
	int i;

	col_start =column+1;
	for (i = 0; yytext[i] != '\0'; i++)
	{	
		if (yytext[i] == '\n')
			column = 0,line++;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;
	}
	/* ECHO; */
}



void help(int f)
{	
	if(f) printf("Error : \n");
	printf("Specify input file with -i flag\n");
	printf("Specify Output file with -o flag\n");
}



int main(int argc, char *argv[])
{	
	if(argc==1)
	{
		help(1);
		return 0;
	}

	for(int i=1;i<argc;i++)
	{

		if(strcmp("-help",argv[i])==0)
		{
			help(0);
			return 0;
		}
		else if(strcmp("-i",argv[i])==0)
		{
			if(i+1<argc)
			{
				FILE *in=freopen(argv[i+1],"r", stdin);
				i++;

				if(!in)
				{
					help(1);
					return 0;
				}
			}
			else
			{
				help(1);
				return 0;
			}
		}

		else if(strcmp("-o",argv[i])==0)
		{
			if(i+1<argc)
			{
				FILE *out = freopen(argv[i+1],"w",stdout);
				i++;
				if(!out)
				{
					help(1);
					return 0;
				}
			}
			else
			{
				help(1);
				return 0;
			}
		}
		else
		{
			help(1);
			return 0;
		}
	}






	printf("Token			 Lexeme 			  Line#			 Column#\n");
	
	int val;
	while((val = yylex())>0)
	{
		printf("	    	%s			          %d                		%d \n",yytext,line,col_start);							
	}
	
}