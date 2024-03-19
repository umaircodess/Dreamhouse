public class AccountHandler {
    public static Account aa(String input){
        try{
        Account newacc = new Account(Name=input);
        insert newacc;
        return newacc;
        }
        
        catch (DmlException e) {
		return null;
}
        
    }

}