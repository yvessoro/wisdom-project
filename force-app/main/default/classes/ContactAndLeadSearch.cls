public class ContactAndLeadSearch {

    public static List<List< sObject>> searchContactsAndLeads(String input){
        List<List< sObject>> output= new List<List< sObject>>();
        output = [FIND :input IN ALL FIELDS
                    RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        
        System.debug('Output >>> '+output);
        return output;
    }
}