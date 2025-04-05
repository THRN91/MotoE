trigger ObjectXTrigger on ObjectX__c (before insert) {
if(trigger.isbefore && trigger.isinsert){
ObjectXHandler.UpdateFieldB(trigger.new);
}
}