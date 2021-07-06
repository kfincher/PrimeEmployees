trigger EmployeesTrigger on Employee__c (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
           EmployeeTriggerHelper.helper(Trigger.new);
        }
    }
}