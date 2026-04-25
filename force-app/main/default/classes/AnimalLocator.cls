public class AnimalLocator {
    public static String getAnimalNameById(Integer value){
        String name='';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+value);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into AnimalResponse data types.
            AnimalResponse animalResponse = (AnimalResponse) JSON.deserialize(response.getBody(), AnimalResponse.class);
            System.debug(animalResponse);
            name = animalResponse.animal.name;
        }
        return name;
    }
}