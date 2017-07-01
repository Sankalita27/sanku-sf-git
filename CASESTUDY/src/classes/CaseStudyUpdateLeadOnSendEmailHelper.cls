public class CaseStudyUpdateLeadOnSendEmailHelper {
    public static void updateLeadStatus(List<Task> insertedTaskList) {
        Set<Id> parentLeadIds = new Set<Id>();
        System.debug('insertedTaskList:' + insertedTaskList);
        for (Task task: insertedTaskList) {
            if (task.taskSubType == 'Email' 
                && task.status == 'Completed' 
                && (task.whoId != null && String.valueOf(task.whoId).startsWith('00Q'))
                ) {
                parentLeadIds.add(task.whoId);
            }
        }
        for (List<Lead> leadList: [SELECT Id FROM Lead WHERE Status = 'Open - Not Contacted' AND Id in :parentLeadIds]) {
            for (Lead leadToUpdate: leadList) {
                leadToUpdate.Status = 'Working - Contacted';
            }
            update leadList;    
        }
    
    }
}