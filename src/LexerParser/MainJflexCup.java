import java.io.FileReader;
import java_cup.runtime.Symbol; // no sé que hacer para que me deje usar la librería :(

public class MainJflexCup {

    public static void main (String[] args){

        lexer lexer = new lexer(new FileReader("prueba2.txt")); // prueba para el lexer 
        Symbol sym;
        while ((sym = lexer.yylex()) != null) {
            System.out.println(sym);
        }
    }

}