
import java.io.BufferedReader;
import java.io.FileReader;
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
}