public class CaseStudyVFTabExpense {
    
    public List<Expense__c> listExpense {get; set;}
    
    public PageReference addNewExpense () {
        listExpense.add(new Expense__c());
        return null;
    }
    
    public CaseStudyVFTabExpense () {
        listExpense = new List<Expense__c>();
        listExpense.add(new Expense__c());
    
    }
    
    public PageReference submitForApproval() {
        //insert listExpense;
        //return null;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Sumitted'));
        return null;
    }
    
    }