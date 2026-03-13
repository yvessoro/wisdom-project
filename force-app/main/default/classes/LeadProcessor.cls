public class LeadProcessor implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext BC, List<Lead> scope) {
        List<Lead> leadsToUpdate = new List<Lead>();
        for (Lead s : scope) {
            s.LeadSource = 'Dreamforce';
            leadsToUpdate.add(s);
        }
        
        if (leadsToUpdate?.size()>0) {
            update leadsToUpdate;
        }
    }

    public void finish(Database.BatchableContext BC) {
        // Optionally, you can add logic here to run after the batch job completes
    }
}