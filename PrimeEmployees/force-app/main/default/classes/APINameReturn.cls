public class APINameReturn {
    public static void main(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.fungenerators.com/name');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            Map<String, Object> respMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(respMap);
        }
    }
}