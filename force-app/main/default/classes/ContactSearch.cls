public class ContactSearch {

    public static List<Contact> searchForContacts(String lastname, String postalCode){
        List<Contact> contacts = new List<Contact>();
        contacts = [Select Id, Name from Contact where lastname=:lastname and MailingPostalCode=:postalCode];
        System.debug('Contacts retrieved >>> '+contacts);
        
        return contacts;
    }
}