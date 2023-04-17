package ParserLexer;
import java.util.HashMap;

public class SymbolTable {
    private HashMap<String, Object> symbols;
    private SymbolTable parentTable;

    public SymbolTable(SymbolTable parentTable) {
        this.symbols = new HashMap<String, Object>();
        this.parentTable = parentTable;
    }

    public void put(String key, Object value) {
        symbols.put(key, value);
    }

    public Object get(String key) {
        System.out.println("Estoy buscando el key: "+key+" en la tabla de símbolos actual");
        Object value = symbols.get(key);

        if (value == null && parentTable != null) {
            value = parentTable.get(key);
        }
        //System.out.println(value);
        return value;
    }
}

