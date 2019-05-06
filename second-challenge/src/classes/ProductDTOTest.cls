/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductDTOTest
-- - Description: Test class for ProductDTO
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/06/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ProductDTOTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Product__c standardProduct = new Product__c(Name='Standard');
		insert standardProduct;

		Product_Detail__c firstProductDetail = new Product_Detail__c(Name='Monthly Fee', Parent_Product__c = standardProduct.Id);
		insert firstProductDetail;


		Product__c metalProduct = new Product__c(Name='Metal');
		insert metalProduct;

		Product_Detail__c secondProductDetail = new Product_Detail__c(Name='Monthly Fee', Parent_Product__c = metalProduct.Id);
		insert secondProductDetail;
	
	}

	@isTest
	static void integrityTest()
	{
		// Given
		Product__c SProduct = [SELECT Name FROM Product__c WHERE Name = 'Standard'];
		ProductDTO standardProduct = new ProductDTO(new ProductWrapper(SProduct));
		Product__c MProduct = [SELECT Name FROM Product__c WHERE Name = 'Metal'];
		ProductDTO metalProduct = new ProductDTO(new ProductWrapper(MProduct));

		// When
		Test.startTest();
		
		string standardProductSerialized = JSON.serialize(standardProduct);
		string metalProductSerialized = JSON.serialize(metalProduct);

		Test.stopTest();


		// Then
		System.assert(true);
		System.assertNotEquals(standardProductSerialized, metalProductSerialized, 'Two different products can\'t be equals');
	}
}