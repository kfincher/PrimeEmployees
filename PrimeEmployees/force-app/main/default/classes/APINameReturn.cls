public class APINameReturn {
    public static String main(){
        System.debug(LoggingLevel.INFO,'at the top');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.namefake.com');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            Map<String, Object> respMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            return String.valueOf(respMap.get('name'));
        }else{
            System.debug(LoggingLevel.INFO,'failed with '+response.getStatusCode());
        }
        return 'User';
    }
}