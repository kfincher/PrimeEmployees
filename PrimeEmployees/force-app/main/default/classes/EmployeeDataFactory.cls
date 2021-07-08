@testVisible
public class EmployeeDataFactory implements Database.Batchable<sObject>, Database.AllowsCallouts {
    public List<Employee__c> empList;
    
    public EmployeeDataFactory(list<Employee__c>emp){
        this.empList=emp;
    }
    
    public Iterable<sObject> start(Database.BatchableContext bc) {
        System.debug('made it');
        return empList;
    }
    public void execute(Database.BatchableContext bc, List<Employee__c> records){
        for(Employee__c emp : records){
            emp.Name=APINameReturn.main();
        }
        insert records;
    }
    public void finish(Database.BatchableContext bc){}
}