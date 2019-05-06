/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveySend
-- - Description: Sends survey to every N26 Bank customer
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name              Version                   
----------------------------------------------------------------------------------------------
-- 03/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

global class SurveySend implements Database.Batchable<sObject>, Schedulable {

	/**********************************
	
	1. Scheduler Context

	**********************************/
	global void execute(SchedulableContext sc){
		SurveySend myBatchObject = new SurveySend(); 
		Id batchId = Database.executeBatch(myBatchObject);
	}


	/**********************************

	2. Batch Context

	***********************************/
	global Database.QueryLocator start(Database.BatchableContext BC)	{
		String query = 'SELECT Survey_Date__c, Language__c, Email FROM Contact WHERE Email != NULL';
		return Database.getQueryLocator(query);
	}

	global void execute(Database.BatchableContext BC, List<sObject> scope)	{
		try{
			Messaging.reserveSingleEmailCapacity(scope.size());
			new SurveyService().sendSurveysTo(scope);
		}catch(HandledException e){
			system.debug(e.getCause());
		}
		
	}  
	global void finish(Database.BatchableContext BC){

	}
}
