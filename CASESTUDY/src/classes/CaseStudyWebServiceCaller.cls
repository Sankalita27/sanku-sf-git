global class CaseStudyWebServiceCaller {

    static webservice String SyncContracts (String contractId, String contractNumber) {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('http://jsonplaceholder.typicode.com/posts/1');
        request.setMethod('GET');
        HttpResponse response = Http.send(request);
        System.debug('res:' + response.getBody());
        return 'Contract Id: ' + contractId + ' Contract Number: ' + contractNumber + ' Response: ' + response.getBody();
    
    }


}