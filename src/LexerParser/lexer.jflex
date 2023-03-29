package LexerParser;

import java_cup.runtime.Symbol;

%% // esto hace referencia a una sección 

%{
   //Código de usuario
%}

// Características de Jflex para que funcione correctamente
%cup
%class MyLexer // nombre de la clase aquí 
%public // esto hace referencia a que la clase es pública
%line  // conteo de líneas 
%char // conteo de caracteres 
%colum // conteo de columnas 
%full
//%ignorecase // ignora las mayusculas 
// Aqui también se ponen los estados 

////// Simbolos ///////

COMA = "," // ejemplo

////// Palabras reservadas ///////

INT1 = "int" // ejemplo. Se pone 1 al final para que no sea la misma palabra y no se confundan

////// Expresiones ///////

DIGITO = [0-9] //ejemplo


%% // Nueva sección

<YYINITIAL> {INT1} {return new Symbol {sym.INT1, yyline, yycolumn, "entero"};}

// YYINITIAL hace referencia a un estado de Jflex, en este caso un estado inicial.
// return new Symbol lo que hace es retornarnos un token o simbolo cuando ecuentra el 
// lexema INT1.
// sym.INT1 es el nombre del token, en este caso es el mismo nombre que el lexema. 
// yyline es propio de Jflex y lo que hace es que guarda como un entero el número de línea en 
// la cual se reconoció el lexema. Lo mismo con yycolumn guarda el número de columna.
// "entero"  hace referencia a que INT1 como lexema debe devolverme la palabra "entero".
// yytext() lo que hace es que me devuelve el valor del lexema, en este caso el valor 
// de INT1 es la palabra reservada "int". Por esto yytext() se usa para accesar al valor del lexema.  


<YYINITIAL> . {
    String errLex = "Error léxico : '"yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
    System.out.println(errLex);
}

// Esto es para el manejo de errores
// En este caso si el Jflex no encuentra ninguna producción con la que coincida el caracter 
// entonces lo considera como error y lo imprime, por eso este YYINITIAL va de último.


////// Como lo hizo el profe ///// **********

<YYINITIAL> "int" {return Symbol (sym.INT);}

// No tiene lo de línea ni columna pero el código del profe no tenía manejo de errores entonces
// se puede tomar en cuenta para ver como lo vamos a manejar 
