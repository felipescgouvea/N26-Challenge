/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveyServiceTest
-- - Description: Test class for SurveyService
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class SurveyServiceTest
{

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
            		language__c = 'de',
            		firstname='first', 
                	lastname='last',
                	email= 'test@test.com',
                	accountId=account.id));
        }
        insert contacts;
	
	}

	@isTest
	static void itShould()
	{
		// Given
		List<Contact> contacts = [SELECT Language__c, LastName, Email FROM Contact];
		SurveyService service = new SurveyService();

		// When
		Test.startTest();
		
		service.sendSurveysTo(contacts);
		
		Test.stopTest();


		// Then
		System.assert(true);
	}
}