import java.io.FileReader;

public class MainJflexCup {

    public MainJflexCup(){

        scanner s = new scanner(new FileReader("pruebaLexer.txt"));
        Symbol sym;
        while((sym=s.yylex())!= null){
            System.out.println(sym);
        }
    
    }

}