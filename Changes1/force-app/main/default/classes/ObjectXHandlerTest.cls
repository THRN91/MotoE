@isTest
public class ObjectXHandlerTest {
     
    @isTest
    static void testUpdateFieldB() {
        // Create a list of ObjectX__c records
        List<ObjectX__c> objectXList = new List<ObjectX__c>();
        
        // Add test records to the list
        objectXList.add(new ObjectX__c(Name='Test1',FieldA__c = 5));
        objectXList.add(new ObjectX__c(Name='Test2',FieldA__c = 10));
        objectXList.add(new ObjectX__c(Name='Test3',FieldA__c = 12)); 
        
            Set<String> names = new Set<String>();
        for (ObjectX__c obj : objectXList) {
            names.add(obj.Name);
        }
        
        // Insert the records to trigger the before insert logic
        insert objectXList;
        
        
        // Query the records back to check the results before calling the method
        List<ObjectX__c> queriedRecords = [SELECT Id, Name, FieldA__c, FieldB__c FROM ObjectX__c WHERE Name IN :names];
        
        system.debug(queriedRecords);
        
        // Perform assertions to verify the results
        System.assertEquals(10, queriedRecords[0].FieldB__c);
        System.assertEquals(20, queriedRecords[1].FieldB__c);
        System.assertEquals(24, queriedRecords[2].FieldB__c);

    }
}