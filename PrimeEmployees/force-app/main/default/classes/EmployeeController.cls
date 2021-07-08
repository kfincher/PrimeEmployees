public class EmployeeController {
    @AuraEnabled
    public static List<Employee__c> returnAuraList(String search, String special){
        System.debug(LoggingLevel.INFO,search);
        Boolean specialBool = Boolean.valueOf(special);
        List<Employee__c> empList = new List<Employee__c>();
        if(search==null||search==''||search=='null'){
             System.debug(LoggingLevel.INFO,'Entered');
            switch on special{
                when 'null'{
                    empList = [SELECT Name, Secondary_ID__c, Is_Special__c FROM Employee__c];
                }
                when else {
                    empList = [SELECT Name, Secondary_ID__c, Is_Special__c FROM Employee__c WHERE Is_Special__c = :specialBool];
                }
            }
        }else{
            search = '%'+search+'%';
            switch on special{
                when 'null'{
                    empList = [SELECT Name, Secondary_ID__c, Is_Special__c FROM Employee__c WHERE Name LIKE :search];
                }
                when else {
                    empList = [SELECT Name, Secondary_ID__c, Is_Special__c FROM Employee__c WHERE Name LIKE :search AND Is_Special__c = :specialBool];
                }
            }
        }
        
        return empList;
    }
    
    @AuraEnabled
    public static void createEmployeeAura(){
        EmployeeEditor.createEmployees(400);
    }
    
    @AuraEnabled
    public static void destroyEmployeeAura(){
        EmployeeEditor.destroyEmployees();
    }
}