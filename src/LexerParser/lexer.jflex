package LexerParser;

import java_cup.runtime.Symbol;

%% // esto hace referencia a una sección 

%{
   //Código de usuario
   String cadena = ""; // variable global; se usa para el estado de CADENA
%}

// Características de Jflex para que funcione correctamente
%cup // habilita la compatibilidad con cup 
%class lexer // da nombre a la clase lexer.java que se va a crear
%public // define como pública la clase lexer
%line  // conteo de líneas con yyline
%char // conteo de caracteres con yychar
%column // conteo de columnas con yycolumn
%full // utiliza el código ASCII extendido 8 bits 
%state CADENA
//%ignorecase // ignora las mayusculas 
// Aqui también se ponen los estados 


////// Expresiones ///////

PUNTO               = "."
LETRA               = [a-zA-Z_]
DIGITO              = [0-9]
DIGITOSC            = [1-9]
CERO                = 0
CEROD               = 0\.0
SIGNO               = [+-]
ID                  = LETRA (LETRA | DIGITO)*
ENTERO              = (SIGNO  DIGITOSC DIGITO*) | (DIGITOSC DIGITO*) | CERO
ENTERO_POSITIVO     = DIGITOSC DIGITO*
DECIMAL             = SIGNO? (DIGITOSC DIGITO* | CERO ) PUNTO DIITO+ | CEROD
ESPACIO             = [ \t \r \n \f \r\n] // espacio en blanco
ENTER               = [\ \n] //salto de línea
INICIO_FIN_CADENA   = [\"] 

// Comentarios
NO_NUEVA_LINEA = [^\n]*
COMENTARIOS_UNA_LINEA = ("@" .* NO_NUEVA_LINEA)
COMENTARIOS_MULTI_LINEA = ("/_".*"_/")
COMENTARIOS = {COMENTARIOS_UNA_LINEA} | {COMENTARIOS_MULTI_LINEA}

%%

////// Palabras reservadas ///////

// YYINITIAL hace referencia a un estado de Jflex, en este caso un estado inicial.
// return new Symbol lo que hace es retornarnos un token o simbolo cuando ecuentra el 
// lexema "int"
// sym.INT es el nombre del token o símbolo. 
// yyline es propio de Jflex y lo que hace es que guarda como un entero el número de línea en 
// la cual se reconoció el lexema. Lo mismo con yycolumn guarda el número de columna.
// yytext() lo que hace es que me devuelve el valor del lexema, en este caso el valor 
// de "int" es el mismo: "int", por lo cual yytext() se usa para accesar al valor del lexema.  

<YYINITIAL> "int"     {return new Symbol (sym.INT, yyline, yycolumn, yytext());}
<YYINITIAL> "float"   {return new Symbol (sym.FLOAT, yyline, yycolumn, yytext());}
<YYINITIAL> "char"    {return new Symbol (sym.CHAR, yyline, yycolumn, yytext());}
<YYINITIAL> "string"  {return new Symbol (sym.STRING, yyline, yycolumn, yytext());}
<YYINITIAL> "boolean" {return new Symbol (sym.BOOLEAN, yyline, yycolumn, yytext());}
<YYINITIAL> "true"    {return new Symbol (sym.TRUE, yyline, yycolumn, yytext());}
<YYINITIAL> "false"   {return new Symbol (sym.FALSE, yyline, yycolumn, yytext());}
<YYINITIAL> "break"   {return new Symbol (sym.BREAK, yyline, yycolumn, yytext());}
<YYINITIAL> "return"  {return new Symbol (sym.RETURN, yyline, yycolumn, yytext());}
<YYINITIAL> "main"    {return new Symbol (sym.MAIN, yyline, yycolumn, yytext());}
<YYINITIAL> "if"      {return new Symbol (sym.IF, yyline, yycolumn, yytext());}
<YYINITIAL> "elif"    {return new Symbol (sym.ELIF, yyline, yycolumn, yytext());}
<YYINITIAL> "else"    {return new Symbol (sym.ELSE, yyline, yycolumn, yytext());}
<YYINITIAL> "do"      {return new Symbol (sym.DO, yyline, yycolumn, yytext());}
<YYINITIAL> "while"   {return new Symbol (sym.WHILE, yyline, yycolumn, yytext());}
<YYINITIAL> "for"     {return new Symbol (sym.FOR, yyline, yycolumn, yytext());}

// Read y print
<YYINITIAL> "readInt"     {return new Symbol (sym.READ_INT, yyline, yycolumn, yytext());}
<YYINITIAL> "readFloat"   {return new Symbol (sym.READ_FLOAT, yyline, yycolumn, yytext());}
<YYINITIAL> "printInt"    {return new Symbol (sym.PRINT_INT, yyline, yycolumn, yytext());}
<YYINITIAL> "printFloat"  {return new Symbol (sym.PRINT_FLOAT, yyline, yycolumn, yytext());}
<YYINITIAL> "printString" {return new Symbol (sym.PRINT_STRING, yyline, yycolumn, yytext());}


<YYINITIAL> {
    
    ////// Espacio y comentarios ///////

    {ESPACIO}     {/* no se procesa */}    
    {COMENTARIOS} {/* no se procesa */}

    ////// Números enteros y decimales ///////
    {ENTERO_POSITIVO}  {return new Symbol (sym.ENTERO_POSITIVO, yyline, yycolumn, yytext());}
    {ENTERO}  {return new Symbol (sym.ENTERO, yyline, yycolumn, yytext());}
    {DECIMAL} {return new Symbol (sym.DECIMAL, yyline, yycolumn, yytext());}

    ////// Operadores ///////

    "="   {return new Symbol (sym.EQUIV, yyline, yycolumn, yytext());}
    "=="  {return new Symbol (sym.DEQUIV, yyline, yycolumn, yytext());} // DEQUIV  de doble equiv
    "+"   {return new Symbol (sym.PLUS, yyline, yycolumn, yytext());}
    "-"   {return new Symbol (sym.MINUS, yyline, yycolumn, yytext());}
    "*"   {return new Symbol (sym.TIMES, yyline, yycolumn, yytext());}
    "/"   {return new Symbol (sym.DIV, yyline, yycolumn, yytext());}
    "**"  {return new Symbol (sym.POWER, yyline, yycolumn, yytext());}
    "~"   {return new Symbol (sym.MODULE, yyline, yycolumn, yytext());}
    "--"  {return new Symbol (sym.MINUS_UN, yyline, yycolumn, yytext());} // UN de unario
    "++"  {return new Symbol (sym.PLUS_UN, yyline, yycolumn, yytext());}  // UN de unario
    ">"   {return new Symbol (sym.MAYOR_QUE, yyline, yycolumn, yytext());}
    ">="  {return new Symbol (sym.MAYOR_IGUAL, yyline, yycolumn, yytext());}
    "<"   {return new Symbol (sym.MENOR_QUE, yyline, yycolumn, yytext());}
    "<="  {return new Symbol (sym.MENOR_IGUAL, yyline, yycolumn, yytext());}
    "!="  {return new Symbol (sym.DIF, yyline, yycolumn, yytext());}
    "#"   {return new Symbol (sym.OR, yyline, yycolumn, yytext());}
    "^"   {return new Symbol (sym.AND, yyline, yycolumn, yytext());}
    "not" {return new Symbol (sym.NOT, yyline, yycolumn, yytext());}
    "("   {return new Symbol (sym.LPARENT, yyline, yycolumn, yytext());}
    ")"   {return new Symbol (sym.RPARENT, yyline, yycolumn, yytext());}
    "["   {return new Symbol (sym.LPARENT_CUAD, yyline, yycolumn, yytext());} // CUAD de cuadrados
    "]"   {return new Symbol (sym.RPARENT_CUAD, yyline, yycolumn, yytext());}
    "{"   {return new Symbol (sym.INIBLOQUE, yyline, yycolumn, yytext());}
    "}"   {return new Symbol (sym.FINBLOQUE, yyline, yycolumn, yytext());}

    ////// Strings ///////

    {INICIO_FIN_CADENA} {yybegin(CADENA); cadena+="\"";}

    ////// Extras ///////

    "$"     {return new Symbol (sym.FINEXP, yyline, yycolumn, yytext());}
    ","     {return new Symbol (sym.COMA, yyline, yycolumn, yytext());}
    {PUNTO} {return new Symbol (sym.PUNTO, yyline, yycolumn, yytext());}

    ////// Identificador ///////

    {ID} {return new Symbol (sym.ID, yyline, yycolumn, yytext());}

}

/*Esto es para el manejo de errores.
  En este caso si el Jflex no encuentra ninguna producción con la que coincida el caracter 
  entonces lo considera como error y lo imprime, por eso este YYINITIAL va de último */

/*
<YYINITIAL> . {
    String errLex = "Error léxico : "yytext()+" en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
    System.out.println(errLex);
}*/

<CADENA> {
    /* Si encuentra un fin de cadena entonces concatenamos la comilla doble, vaciamos la variable global 
    y que regrese al estado inicial para que siga reconociendo lexemas y que nos retorne la cadena */
    \" {String tmp = cadena+ "\""; yybegin(YYINITIAL); return new Symbol (sym.CADENA, yychar, yyline, tmp);}
    // si reconoce un enter significa que no tiene cierre de cadena entonces es un error
    [\n] {String tmp=cadena; cadena=""; 
          System.out.println("Se esperaba cierre de cadena (\").");
          yybegin(YYINITIAL);
         } 
    /* Mientras que no encuentre nuevamente un fin de cadena entonces le hace un append a la variable 
       cadena de todo lo que se encuentre */
    [^INICIO_FIN_CADENA] {cadena += yytext();}
}

