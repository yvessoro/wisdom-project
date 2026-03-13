@isTest
public class AccountProcessorTest {
    
    @IsTest
    private static void testCountContacts() {
        List<Id> accountIDs= new List<Id>();
        List<Account> accounts = TestDataFactory.createAccountsWithContacts(2, 2);
        if(accounts?.size()>0){
            for(Account a: accounts){
                accountIDs.add(a.Id);
            }
        }
        
        Test.startTest();
        	AccountProcessor.countContacts(accountIDs);
        Test.stopTest();
        
        Account firstAccountUpdated=[Select Number_Of_Contacts__c from Account where Id=:accountIDs.get(0) limit 1];
        System.assertEquals(2,firstAccountUpdated.Number_Of_Contacts__c,'Le nombre de contacts doit etre 2');
    }
}