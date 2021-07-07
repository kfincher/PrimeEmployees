public class EmployeeDeletionFactory implements Database.Batchable<sObject> {
    public List<Employee__c> empList;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Employee__c');
    }
    public void execute(Database.BatchableContext bc, List<Employee__c> records){
        delete records;
    }
    public void finish(Database.BatchableContext bc){}
}