public with sharing class EmployeeTriggerHelper {
    public static void helper(List<Employee__c> input) {
        System.debug(LoggingLevel.INFO,'Made it here at all');
        Set<Decimal> IDSet = new Set<Decimal>();
        for(Employee__c indVal : [SELECT Secondary_ID__c FROM Employee__c])
            IDSet.add(indVal.Secondary_ID__c);

        for(Employee__c emp : input){
            emp.Secondary_ID__c = randomNum(IDSet);
            IDSet.add(emp.Secondary_ID__c);
            if(PrimeClass.CheckPrime(emp.Secondary_ID__c)){
                emp.Is_Special__c = true;
            }
        }
    }
    public static Decimal randomNum(Set<Decimal> IDSet){
        Decimal returnVal = 0;
        while(true){
            returnVal = Decimal.valueOf(Math.random()*100000).round(System.RoundingMode.HALF_EVEN);
            if(!IDSet.contains(returnVal)){
                System.debug(LoggingLevel.INFO,returnVal);
                break;
            }
        }
        return returnVal;
    }
}