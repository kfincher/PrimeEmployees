@isTest
public with sharing class PrimeClassTest {
    @isTest
    private static void PositiveTest() {
        System.assertEquals(true, PrimeClass.CheckPrime(11));
        System.assertEquals(true, PrimeClass.CheckPrime(1307));
        System.assertEquals(true, PrimeClass.CheckPrime(6619));
        System.assertEquals(true, PrimeClass.CheckPrime(6619.0));
    }
    @isTest
    private static void NegativeTest() {
        System.assertEquals(false, PrimeClass.CheckPrime(36));
        System.assertEquals(false, PrimeClass.CheckPrime(4));
        System.assertEquals(false, PrimeClass.CheckPrime(33));
    }
}