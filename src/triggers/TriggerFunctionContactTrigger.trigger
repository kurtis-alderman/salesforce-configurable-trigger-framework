trigger TriggerFunctionContactTrigger on Contact (before insert) {

    final List<Trigger_Function__c> triggerFunctionConfigs = [
		SELECT Name
        FROM Trigger_Function__c
        WHERE SObject_API_Name__c = 'Contact'
    ];
    
    for (Trigger_Function__c triggerFunctionConfig : triggerFunctionConfigs) {
        final Type triggerFunctionType = Type.forName(triggerFunctionConfig.Name);
        final TriggerFunction triggerFunction = (TriggerFunction) triggerFunctionType.newInstance();
        
        triggerFunction.beforeInsert(Trigger.New);
    }

}