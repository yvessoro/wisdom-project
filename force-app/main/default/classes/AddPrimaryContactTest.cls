@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add 50 child accounts for BillingState NY
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account NY '+i,
                BillingState__c='NY'
            ));
        }
        
        // add 50 child accounts for BillingState CA
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account CA '+i,
                BillingState__c='CA'
            ));
        }
        
        insert accounts;
    }
    
    static testmethod void testQueuable(){
        String state='CA';
        List<Account> accounts = [select id, name from account where BillingState__c =: state];
        Contact contact = new Contact(FirstName='Contact Firstname CA', LastName='Contact LastName CA ');
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(contact, state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
        // Validate the job ran.
        System.assertEquals(50, [select count() from contact where Account.BillingState__c=:state]);
    }
}