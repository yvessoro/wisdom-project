public class StringListTest {

    public static List<String> generateStringList(Integer counter){
        List<String> stringsToReturn = new List<String>();
        
        for(Integer i=0; i<counter; i++){
            stringsToReturn.add('Test '+i);
        }
        System.debug('Output >>> '+stringsToReturn);
        
        return stringsToReturn;
    }
}