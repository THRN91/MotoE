public class ObjectXHandler {
public static void UpdateFieldB(list<ObjectX__c> objectXList)
{
    for(ObjectX__c obj: objectXList) {
        obj.FieldB__c=obj.FieldA__c *2;
    }
}
}