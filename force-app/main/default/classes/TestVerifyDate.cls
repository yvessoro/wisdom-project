@isTest
public class TestVerifyDate {
    
	@isTest
    static void checkDateWithin30Days(){
        Date today = Date.today();
        Date nextDay = Date.newInstance(2025,8,10);
        Date result = VerifyDate.CheckDates(today, nextDay);
        
        System.assertEquals(nextDay,result,'La date doit etre la prochaine');
    }
    
    @isTest
    static void checkEndOfMonthDate(){
        Date today = Date.today();
        
        Integer totalDays = Date.daysInMonth(today.year(), today.month());
        Date lastDay = Date.newInstance(today.year(), today.month(), totalDays);
        
        Date nextDay = Date.newInstance(2025,8,30);
        Date result = VerifyDate.CheckDates(today, nextDay);
        
        System.assertEquals(lastDay,result,'La date doit etre la fin du mois en cours');
    }
}