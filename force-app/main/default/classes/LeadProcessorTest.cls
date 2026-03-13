@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName = 'Test Lead ' + i, Company = 'Test Company'));
        }
        insert leads;
    }

    @isTest
    static void testUpdateAllLeads() {
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Database.executeBatch(leadProcessor, 200);
        Test.stopTest();
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE leadSource = 'Dreamforce'];
        System.Assert.areEqual(200, updatedLeads.size(), 'Error: at least 1 record not updated correctly');
    }
}