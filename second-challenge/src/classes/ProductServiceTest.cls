/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductServiceTest
-- - Description: Test Class for ProductService
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ProductServiceTest
{

	@testSetup
	static void setup(){
		//Create test data here

		Product__c product = new Product__c(Name='Silver');
		insert product;

		Contact defaultContact = new Contact(Product__c = product.Id, LastName = 'Gouvea', Language__c = 'de', Home_Country__c = 'DE', Email = 'felipegouvea@n26bank.com');
		insert defaultContact;

		Case c = new Case(Origin = 'Phone', ContactId = defaultContact.Id);
		insert c;

		Case blankCase = new Case(Origin = 'Web');
		insert blankCase;
	}

	@isTest
	static void completeObjectSetTest()
	{
		// Given
		ProductService service = new ProductService();
		id targetCaseId = [SELECT Id FROM Case LIMIT 1].Id;

		// When
		Test.startTest();
		
		ProductDTO dto = service.loadRelatedProduct(targetCaseId);
		
		Test.stopTest();


		// Then
		System.assert(true);

		System.assertNotEquals(NULL, dto);
	}

	@isTest
	static void testWithBlankCase()
	{
		// Given
		ProductService service = new ProductService();
		id targetCaseId = [SELECT Id FROM Case WHERE ContactId =: NULL LIMIT 1].Id;



		// When
		Test.startTest();
		
		ProductDTO dto = service.loadRelatedProduct(targetCaseId);
		
		Test.stopTest();


		// Then
		System.assert(true);

		System.assertNotEquals(NULL, dto);
	}

}