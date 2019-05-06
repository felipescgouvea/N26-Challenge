/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductInformationControllerTest
-- - Description: Test class for ProductInformationController
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019	     Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ProductInformationControllerTest
{

	@testSetup
	static void setup(){
		//Create test data here

		Product__c product = new Product__c(Name='Black');
		insert product;
		
		Product_Detail__c detail = new Product_Detail__c(Name = 'MonthlyFee', Parent_Product__c = product.Id);

		Contact defaultContact = new Contact(LastName = 'Gouvea', Language__c = 'en', Email = 'felipegouvea@n26bank.com');
		insert defaultContact;

		Case c = new Case(Origin = 'Phone', ContactId = defaultContact.Id);
		insert c;


	}

	@isTest
	static void itShould()
	{
		// Given
		Id targetId = [SELECT Id FROM Contact].Id;

		// When
		Test.startTest();
		
		ProductDTO dto = ProductInformationController.loadRelatedProduct(targetId);

		Test.stopTest();


		// Then
		System.assert(true);

		System.assertNotEquals(NULL, dto);
		System.assertEquals(1, dto.details.size());
		System.assertEquals('Monthly Fee', dto.details[0].name);
		System.assertEquals('Black', dto.productName);
	}
}