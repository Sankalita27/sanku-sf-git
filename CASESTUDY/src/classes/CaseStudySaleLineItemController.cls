public with sharing class CaseStudySaleLineItemController {

    

    public SelectOption[] selectedLineItems { get; set; }
    public SelectOption[] allLineItems { get; set; }
    
    public Case_Study_Sale__c caseStudy {get; set;}
    
    public String message { get; set; }
    
    public CaseStudySaleLineItemController(ApexPages.StandardController stdCtrl) {
    
        this.caseStudy = (Case_Study_Sale__c)stdCtrl.getRecord();   
        
        selectedLineItems = new List<SelectOption>();
        
        List<Case_Study_Sale_Line_Item__c> lineItems = [SELECT Id, Name, State__c FROM Case_Study_Sale_Line_Item__c];    
        allLineItems = new List<SelectOption>();
        for ( Case_Study_Sale_Line_Item__c li : lineItems) {
            allLineItems.add(new SelectOption(li.Id, li.state__c + '--' + li.Name));
        }
    }

    public PageReference save() {
        message = 'Selected Line Items: ';
        Boolean first = true;
        for ( SelectOption so : selectedLineItems ) {
            if (!first) {
                message += ', ';
            }
            message += so.getLabel() + ' (' + so.getValue() + ')';
            first = false;
        }
        
        return null;       
    }
}