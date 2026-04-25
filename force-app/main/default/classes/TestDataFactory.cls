@isTest
public class TestDataFactory {
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for(Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                         StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        return accts;
    }
    
    public static List<Account> createAccountsWithContacts(Integer numAccts, Integer numContactsPerAcct) {
        RecordType rt=[Select Id from RecordType where DeveloperName='Person_Account' limit 1];
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i, RecordTypeId=rt.Id);
            accts.add(a);
        }
        insert accts;
        List<Contact> cons = new List<Contact>();
        for(Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for(Integer k=0;k<numContactsPerAcct;k++) {
                cons.add(new Contact(FirstName='Contact Firstname' + k,
                                     LastName=' Contact LastName' + k,
                                         AccountId=acct.Id));
            }
        }
        // Insert all contacts for all accounts.
        insert cons;
        return accts;
    }
}