/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveyRecipientTest
-- - Description: Test class for SurveyRecipient wrapper class
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/04/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class SurveyRecipientTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Contact ENContact = new Contact(LastName = 'Gouvea', Language__c = 'en', Email = 'felipegouvea@n26bank.com');
		Contact DEContact = new Contact(LastName = 'Carvalho', Language__c = 'de', Email = 'felipecarvalho@n26bank.com');

		database.insert(new List<Contact>{ ENContact,DEContact });
	
	}

	@isTest
	static void testEnglishContact()
	{
		// Given
		Contact contact = [SELECT Language__c, Email FROM Contact WHERE Language__c = 'en'];

		// When
		Test.startTest();
		
		SurveyRecipient recipient = new SurveyRecipient(contact);

		Test.stopTest();


		// Then
		System.assert(true);
		System.assertEquals('en', recipient.languageIsoCode);
	}

	@isTest
	static void testDeutschContact()
	{
		// Given
		Contact contact = [SELECT Language__c, Email FROM Contact WHERE Language__c = 'de'];

		// When
		Test.startTest();
		
		SurveyRecipient recipient = new SurveyRecipient(contact);

		Test.stopTest();


		// Then
		System.assert(true);
		System.assertEquals('de', recipient.languageIsoCode);
	}
}