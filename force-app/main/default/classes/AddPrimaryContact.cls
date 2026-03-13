public class AddPrimaryContact implements Queueable {
    Contact contact;
    String state;
    
    public AddPrimaryContact(Contact contact, String state){
        this.contact=contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> contactListToInsert = new List<Contact>();
        List<Account> accounts = [SELECT Id, BillingState__c FROM Account WHERE BillingState__c =: state LIMIT 200];
        for(Account acc: accounts){
			Contact clonedContact = contact.clone();
            clonedContact.AccountId = acc.Id;
            contactListToInsert.add(clonedContact);
        }
        
        if(contactListToInsert?.size()>0){
            insert contactListToInsert;
        }
    }

}