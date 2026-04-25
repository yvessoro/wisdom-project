public class AccountHandler {

    public static Account insertNewAccount(String inputname){
        Account acct = new Account(Name=inputName);
        try {
            insert acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
        }
        System.debug('Account Created >>> ' + acct);
        
        return acct;
    }
}