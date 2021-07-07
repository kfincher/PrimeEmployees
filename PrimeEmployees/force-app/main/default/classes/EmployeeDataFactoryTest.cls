@isTest
public class EmployeeDataFactoryTest {
    @isTest
    private static void Main(){
        List<Employee__c> empList = new List<Employee__c>();
        for(integer i = 0;i<200;i++){
            empList.add(new Employee__c(Name='User'+i));
        }
        
        Test.startTest();
        EmployeeDataFactory EDF = new EmployeeDataFactory(empList);
        Database.executeBatch(EDF);
        Test.stopTest();
        
        System.assertEquals(200, [select COUNT() FROM Employee__c]);
    }
    @isTest
    private static void createEmployees(){
        Test.startTest();
        EmployeeEditor.createEmployees(200);
        Test.stopTest();
        
        System.assertEquals(200, [select COUNT() FROM Employee__c]);
        
        
    }
    @isTest
    private static void destroyEmployees(){
        insert new Employee__c(Name='User'+150);
        
        Test.startTest();
        EmployeeEditor.destroyEmployees();
        Test.stopTest();
        
        System.assertEquals(0, [select COUNT() FROM Employee__c]);
    }
}