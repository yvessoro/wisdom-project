public class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext SC) {
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        List<Lead> leadsToUpdate = new List<Lead>();
        for (Lead lead : leads) {
            Lead leadToUpdate=lead;
            leadToUpdate.LeadSource = 'Dreamforce';
            leadsToUpdate.add(leadToUpdate);
        }
        
        if (leadsToUpdate?.size()>0) {
            update leadsToUpdate;
        }
    }
}