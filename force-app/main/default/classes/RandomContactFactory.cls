public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName){
        List<Contact> contacts = new List<Contact>();
        
        for(Integer i=0; i<numContacts; i++){
            String randomName = 'Test '+i;
            Contact newContact=new Contact(LastName=lastName, FirstName=randomName);
            contacts.add(newContact);
        }
        
        return contacts;
    }
}