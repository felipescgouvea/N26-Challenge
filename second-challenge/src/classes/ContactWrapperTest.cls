/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ContactWrapperTest
-- - Description: Test class for ContactWrapper
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ContactWrapperTest
{

	@testSetup
	static void setup(){
		//Create test data here

		Product__c product = new Product__c(Name='Silver');
		insert product;

		Contact defaultContact = new Contact(Product__c = product.Id, LastName = 'Gouvea', Language__c = 'en', Home_Country__c = 'UK', Email = 'felipegouvea@n26bank.com');
		insert defaultContact;



		Contact contactWithBlankProduct = new Contact(Product__c = NULL, LastName = 'Schmidt', Language__c = 'de', Home_Country__c = 'DE', Email = 'felipegouvea@n26bank.com');
		insert contactWithBlankProduct;
	
	}

	@isTest
	static void testWithRegularProduct()
	{
		// Given
		Contact defaultContact = [SELECT ID, Product__c, Home_Country__c FROM Contact WHERE Product__c != NULL LIMIT 1];
		ContactWrapper wrapper = new ContactWrapper(defaultContact);

		// When
		Test.startTest();
		
		ProductWrapper relatedProduct = wrapper.getYourProduct();
		string homeCountry = wrapper.getHomeCountry();
		
		Test.stopTest();


		// Then
		System.assert(true);
		System.assertEquals('Silver', relatedProduct.getName());
		System.assertEquals('UK', homeCountry);
	}

	@isTest
	static void testWithBlankProduct()
	{
		// Given
		Contact defaultContact = [SELECT ID, Product__c, Home_Country__c FROM Contact WHERE Product__c = NULL LIMIT 1];
		ContactWrapper wrapper = new ContactWrapper(defaultContact);

		// When
		Test.startTest();
		
		ProductWrapper relatedProduct = wrapper.getYourProduct();
		string homeCountry = wrapper.getHomeCountry();
		
		Test.stopTest();


		// Then
		System.assert(true);
		System.assertEquals('Empty Product', relatedProduct.getName());
		System.assertEquals('DE', homeCountry);
	}
}