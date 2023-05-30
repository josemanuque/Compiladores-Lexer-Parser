
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;

import ParserLexer.Lexer;
import ParserLexer.parser;
import java_cup.internal_error;
import java_cup.runtime.Symbol;
import jflex.exceptions.SilentExit;


public class MainJflexCup {

    public void initLexerParser(String fullPathLexer, String fullPathParser) throws internal_error, Exception {
        generateLexer(fullPathLexer);
        generateParser(fullPathParser);
    }

    private void generateLexer(String fullPathLexer) throws IOException, SilentExit {
        String[] jflexArgs = {fullPathLexer};
        jflex.Main.generate(jflexArgs);
    }

    private void generateParser(String fullPathParser) throws internal_error, IOException, Exception {
        String[] cupArgs = {fullPathParser};
        java_cup.Main.main(cupArgs);
    }


    public void lexerTest(String pathTest) throws IOException {
        Reader reader = new BufferedReader(new FileReader(pathTest));
        Lexer lexer = new Lexer(reader);
        int i = 0;
        Symbol token;
        while (true){
            token = lexer.next_token();
            if (token.sym != 0) {
                System.out.println("Token " + token.sym + ", Valor: " + lexer.yytext());
            }
            else {
                System.out.println("Cantidad de lexemas encontrados: " + i);
                return;
            }
            i++;
        }
    }

    public void parserTest(String pathTest) throws Exception{
        Reader inputLexer = new FileReader(pathTest);
        Lexer lexer = new Lexer(inputLexer);

        parser parser = new parser(lexer);
        parser.parse();
    }

    public void runLexer(String pathTest) {
        try {
            String pathLexerOutput = "src/Reports/outputLexer.txt";
            Reader reader = new BufferedReader(new FileReader(pathTest));
            BufferedWriter file = new BufferedWriter(new FileWriter(pathLexerOutput));
            Lexer lexer = new Lexer(reader);
            int i = 0;
            Symbol token;
            while (true){
                token = lexer.next_token();
                if (token.sym != 0) {
                    System.out.println("Token " + token.sym + ", Valor: " + token.value);
                    file.write("Token " + token.sym + ", Valor: " + token.value + "\n");
                }
                else {
                    System.out.println("Cantidad de lexemas encontrados: " + i);
                    file.close();
                    return;
                }
                i++;
            }
        } catch (Exception e) {
            System.err.println(pathTest + " no se pudo leer");
        }
        catch (Error e) {
            System.err.println(e.getMessage());
        }
    }
    public void runParser(String pathTest){
        try{
            String pathParserOutput = "src/Reports/outputParser1.txt";
            String pathParserCod3Doutput = "src/Reports/outputCod3D.txt";
            BufferedWriter file = new BufferedWriter(new FileWriter(pathParserOutput));
            BufferedWriter file3D = new BufferedWriter(new FileWriter(pathParserCod3Doutput));
            Reader inputLexer = new FileReader(pathTest);
            Lexer lexer = new Lexer(inputLexer);
            parser parser = new parser(lexer);
            parser.parse();
            for(String key: parser.getTablaSimbolos().keySet()){
                file.write("-------------------------\n");
                file.write("\n");
                file.write("Tabla de símbolos: "+key +"\n");
                file.write("Valores: ");
                for(String item: parser.getTablaSimbolos().get(key)){
                    file.write(item + "\n");
                }
    
                file.write("\n");
            }

            file3D.write("++++++++ CODIGO 3D +++++++++");
            file3D.write(parser.getCodIn3D().toString());
        
            if(parser.getErrores() == false){
                System.out.println("El archivo puede ser generado por la gramática.");
                file.write("El archivo puede ser generado por la gramática.");
            }
            else{
                System.out.println("El archivo fuente tiene errores, no puede ser generado por la gramática.");
                file.write("El archivo fuente tiene errores, no puede ser generado por la gramática.");
            }
            file.close();
            file3D.close();
        }
        catch (Exception e) {
            System.out.println("El archivo fuente tiene errores, no puede ser generado por la gramática.");
            System.err.println(pathTest + " no se pudo leer");
            System.out.println(e);
        }
        catch (Error e) {
            System.out.println("El archivo fuente tiene errores, no puede ser generado por la gramática.");
            System.err.println(e.getMessage());
        }
    }
}