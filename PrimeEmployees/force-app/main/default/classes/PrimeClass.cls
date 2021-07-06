public with sharing class PrimeClass {
    public static Boolean CheckPrime(Integer val) {
        if(Math.mod(val,2)==0)
            return false;
        for(Integer i = 3;i < val;i+=2){
            if(Math.mod(val,i)==0)
                return false;
        }
        return true;
    }
}