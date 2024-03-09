import static unidade2.Token.*;

%%

%{
private void imprimir(String token, String lexema)
{
    System.out.println(lexema + " -> classificacao lexica: " + token);
}
%}

%class Lexer
%type Token

letra = [a-zA-Z]
digito = [0-9]
underline = "_"
identificador = {letra} ({letra} | {digito} | {underline})*
inteiro = {digito}+
decimal = {inteiro} "." {inteiro}
const_literal = \" ( \\\" | [^\"\n\r)])* \"
operadoresAritmeticos = ("+" | "-" | "/" | "*")
operadoresComparacao = ("<>" | "<" | ">" | "<=" | ">=")
operadoresLogicos == "."|".E."
simbolosEspeciais == ("("|")"|"{"|"]"|"}"|","|"."|";")
palavraChave = "ABRIR_TABELA" | "MOSTRAR" | "DE" | "ONDE" | "ORDENAR_POR" | "DECRESCENTE" |
"CRESCENTE" | "EM_CONJUNTO_COM" | "ATRAVES_DA_LIGACAO" | "UNIDA_COM" |
"AGRUPAR_POR" | "FILTRO_DO_GRUPO" | "CONTAR"  |"MEDIA" |"VALOR_MINIMO"
|"VALOR_MAXIMO"  |"SOMATORIA"  |"Eh"  |"VAZIO"  |"CONTENDO"
branco = [\n|\t|\r| ]+

%%

{palavraChave} { imprimir("PALAVRA-CHAVE ", yytext()); return PALAVRACHAVE; }
{branco}        { return BRANCO; }
{identificador} { imprimir("IDENTIFICADOR ", yytext()); return IDENTIFICADOR; }
{const_literal} { imprimir("LITERAL ", yytext()); return CONSTANTE; }
{inteiro} { imprimir("NUMERO INTEIRO ", yytext()); return INTEIRO; }
{decimal} { imprimir("NUMERO DECIMAL ", yytext()); return DECIMAL; }
{operadoresAritmeticos} { imprimir("OPERADOR ARITMETICO ", yytext()); return OPERADORARITMETICO; }
{operadoresComparacao} { imprimir("OPERADOR COMPARATIVO ", yytext()); return OPERADORCOMPARATIVO; }
{operadoresLogicos} { imprimir("OPERADOR LOGICOS ", yytext()); return OPERADORLOGICO; }
{simbolosEspeciais} { imprimir("SIMBOLOS ESPECIFICO ", yytext()); return SIMBOLOESPECIAL;}
. 	{	imprimir ("<<< CARACTER INVALIDO!!! >>> ","yytext()");	return ERROR;}
<<EOF>>	{return null;}