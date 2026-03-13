public class AccountProcessor {

    @future
    public static void countContacts(List<Id> accountIDs){
        List<Account> accountList=[SELECT Id, Number_Of_Contacts__c, (SELECT Id, AccountId FROM Contacts) FROM Account Where Id In:accountIDs];
        
        if(accountList?.size()>0){
            for(Account a: accountList){   
                a.Number_Of_Contacts__c=a.contacts.size();
            }
        }
        
        update accountList;
    }
}