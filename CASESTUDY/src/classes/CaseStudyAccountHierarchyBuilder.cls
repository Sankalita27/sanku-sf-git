public class CaseStudyAccountHierarchyBuilder {

    static List<Account> getAccountHierarchy(Account parentAccount) {
        List<Account> allAccounts = new List<Account>();
        allAccounts.add(parentAccount);
        List<Account> nextInLine = [SELECT Id FROM Account WHERE ParentId = :parentAccount.Id];
        while (!nextInLine.isEmpty())
        {
          allAccounts.addAll(nextInLine);
          nextInLine = [SELECT Id FROM Account WHERE ParentId IN :nextInLine];
        }
        return allAccounts;
    }

}