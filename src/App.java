import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

public class App {
    private static String basePath = System.getProperty("user.dir");
    private static String fullPathLexer = basePath + "/src/ParserLexer/yylex.jflex";
    private static String fullPathParser = basePath + "/src/ParserLexer/parser.cup";

    public static void GenerarLexerParser() throws Exception {
        MainJflexCup main = new MainJflexCup();

        // Eliminar archivos antiguos
        Files.deleteIfExists(Paths.get(basePath + "/src/ParserLexer/sym.java"));
        Files.deleteIfExists(Paths.get(basePath + "/src/ParserLexer/Lexer.java"));
        Files.deleteIfExists(Paths.get(basePath + "/src/ParserLexer/parser.java"));

        // Crear archivos nuevos
        main.initLexerParser(fullPathLexer, fullPathParser);

        // Mueve los archivos generados a la carpeta src
        Files.move(Paths.get(basePath + "/sym.java"), Paths.get(basePath + "/src/ParserLexer/sym.java"));
        Files.move(Paths.get(basePath + "/parser.java"), Paths.get(basePath + "/src/ParserLexer/parser.java"));
    }

    public static void PruebasLexerParser() throws Exception {
        MainJflexCup main = new MainJflexCup();

        // Pruebas
        main.runLexer(basePath + "/src/Pruebas/semantico.txt");
        main.runParser(basePath + "/src/Pruebas/semantico.txt");
    }

    public static void Compilar() throws Exception {
        MainJflexCup main = new MainJflexCup();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Ingrese el nombre del archivo a compilar (sin la extension): ");
        String nombre = scanner.nextLine();
        scanner.close();
        // Pruebas
        main.runLexer(basePath + "/src/Pruebas/"+nombre+".txt");
        main.runParser(basePath + "/src/Pruebas/"+nombre+".txt");
    }

    public static void main(String[] args) throws Exception{
        //GenerarLexerParser();
        //Thread.sleep(3000); //sleep para darle tiempo a que se generen los archivos
        Compilar();
    }
}
