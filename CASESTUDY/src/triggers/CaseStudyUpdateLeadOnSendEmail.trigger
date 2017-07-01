/*
I need to update a field on the account object whenever a task is 
created via the Email BCC to Salesforce function. From what I 
understand this is only possible with an apex trigger.
*/

trigger CaseStudyUpdateLeadOnSendEmail on Task (after insert) {
    CaseStudyUpdateLeadOnSendEmailHelper.updateLeadStatus(Trigger.new);
}