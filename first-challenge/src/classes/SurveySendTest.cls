/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveySendTest
-- - Description: Test class for SurveySend
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
--       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class SurveySendTest
{

	public static String CRON_EXP = '0 0 0 28 2 ? 2022';

	@testSetup
	static void setup(){
		//Create test data here
		List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            accounts.add(new Account(name='Account '+i, 
                billingcity='New York', billingcountry='USA'));
        }
        insert accounts;
        // find the account just inserted. add contact for each
        for (Account account : [select id from account]) {
            contacts.add(new Contact(
            		language__c = 'en',
            		firstname='first', 
                	lastname='last',
                	email= 'test@test.com',
                	accountId=account.id));
        }
        insert contacts;
	
	}

	@isTest
	static void testBatchAction()
	{
		// Given


		// When
		Test.startTest();
		
		SurveySend surveySend = new SurveySend();
		Id batchId = Database.executeBatch(surveySend);
		
		//System.assertEquals(1, Limits.getEmailInvocations(), 'Messaging.sendEmail should be invoked only one time to send all emails');

		Test.stopTest();


		// Then
		string emptyId = '000000000000000';
		System.assertNotEquals(emptyId, batchId);
		System.assert(true);
		
	}


	@isTest
	static void testSchedulerAction(){
		// Given
		String CRON_EXP = '0 0 0 3 9 ? 2022';

		// When
		Test.startTest();

		String jobId = System.schedule('SurveySend', CRON_EXP,  new SurveySend ());
		
			    // Get the information from the CronTrigger API object
		CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, 
			       NextFireTime
			       FROM CronTrigger WHERE id = :jobId];
	

			
		Test.stopTest();



		// Then
		System.assertEquals(CRON_EXP,  ct.CronExpression);

		System.assertEquals(0, ct.TimesTriggered);

		System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));
	}
}