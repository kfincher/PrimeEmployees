@isTest
public with sharing class EmployeeTriggerTest {

    @isTest
    private static void Positive() {
        insert new Employee__c(Name='User'+150);
        
        List<Employee__c> empList = new List<Employee__c>();
        for(integer i = 0;i < 149;i++){
            empList.add(new Employee__c(Name='User'+i));
        }

        insert empList;

        Boolean specialEmployeeCreated = false;

        for(Employee__c indEmp : [SELECT Name, Is_Special__c FROM Employee__c]){
            if(indEmp.Is_Special__c)
                specialEmployeeCreated = true;
        }

        System.assert(specialEmployeeCreated);
    }
}