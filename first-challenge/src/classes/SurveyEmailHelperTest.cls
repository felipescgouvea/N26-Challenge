/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveyEmailHelperTest
-- - Description: Test class for SurveyEmailHelper
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class SurveyEmailHelperTest
{


	@testSetup
	static void setup(){
		//Create test data here
		Contact ENContact = new Contact(LastName = 'Gouvea', Language__c = 'en', Email = 'felipegouvea@n26bank.com');
		Contact ARContact = new Contact(LastName = 'general', Language__c = 'ar', Email = 'general@n26.com');
		Contact HYContact = new Contact(LastName = 'support', Language__c = 'hy', Email = 'support@n26.com');

		database.insert(new List<Contact>{ ENContact, ARContact, HYContact });
	
	}

	@isTest
	static void testMixedEmailCases()
	{
		// Given
		List<Contact> contacts = [SELECT Language__c, Email FROM Contact];
		List<SurveyRecipient> recipients = new List<SurveyRecipient>();
		// When
		Test.startTest();
		
		for(Contact c : contacts){
			SurveyRecipient recipient = new SurveyRecipient(c);
			recipients.add(recipient);
		}
		SurveyRecipient nullRecipient = null;
		recipients.add(nullRecipient);
		SurveyEmailHelper.sendEmails(recipients);

		// Then

		System.assertEquals(1, Limits.getEmailInvocations(), 'There must be only one email invcation since sendEmails() was called once');
		System.assert(true);

		Test.stopTest();


	}
}