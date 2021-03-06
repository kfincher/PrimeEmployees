public with sharing class EmployeeEditor {
    public static void createEmployees(integer val){
        List<Employee__c> empList = new List<Employee__c>();
        for(integer i = 0;i<val;i++){
            empList.add(new Employee__c(Name='User'));
        }
        EmployeeDataFactory EDF = new EmployeeDataFactory(empList);
        Database.executeBatch(EDF,100);
    }
    
    public static void destroyEmployees(){
        EmployeeDeletionFactory EDF = new EmployeeDeletionFactory();
        Database.executeBatch(EDF);
    }
}