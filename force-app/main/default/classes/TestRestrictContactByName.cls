@isTest
public class TestRestrictContactByName {

    @isTest
    static void testRestrictContactByName(){
        Account acct = new Account(Name='Test Account');
        insert acct;
        
        Contact con = new Contact(LastName='INVALIDNAME', FirstName='Trigger', AccountId=acct.Id);
        
        // Perform test
        Test.startTest();
        Database.UpsertResult result = Database.upsert(con, false);
        Test.stopTest();
        // Verify
        // In this case the insert or update should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+con.LastName+'" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
}