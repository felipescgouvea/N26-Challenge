/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductWrapperTest
-- - Description: Test class for ProductWrapper
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ProductWrapperTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Product__c product = new Product__c(Name='Test');
		insert product;

		Product_Detail__c detail = new Product_Detail__c(Name = 'Detail Test', Parent_Product__c = product.Id);
		insert detail;
	
	}

	@isTest
	static void getNameTest(){
		// Given
		Product__c product = [SELECT Name FROM Product__c WHERE Name = 'Test' LIMIT 1];
		ProductWrapper wrapper = new ProductWrapper(product);

		// When
		Test.startTest();
		
		string productName = wrapper.getName();

		Test.stopTest();

		System.assertEquals('Test', productName);
	}

	@isTest
	static void getMonthlyCostTest(){
		// Given
		Product__c product = [SELECT Name FROM Product__c LIMIT 1];
		ProductWrapper wrapper = new ProductWrapper(product);

		// When
		Test.startTest();
		
		decimal calculatedMonthlyCost =wrapper.getMonthlyCost();

		Test.stopTest();


		// Then
		System.assert(true);
		System.assertNotEquals(NULL, calculatedMonthlyCost);
	}


	@isTest
	static void getATMFeeTest(){
		// Given
		Product__c product = [SELECT Name FROM Product__c LIMIT 1];
		ProductWrapper wrapper = new ProductWrapper(product);

		// When
		Test.startTest();
		
		decimal calculatedATMFee =wrapper.getATMFee();
		
		Test.stopTest();


		// Then
		System.assert(true);
		System.assertNotEquals(NULL, calculatedATMFee);
	}

	@isTest
	static void getCardReplacementCostTest(){
		// Given
		Product__c product = [SELECT Name FROM Product__c LIMIT 1];
		ProductWrapper wrapper = new ProductWrapper(product);

		// When
		Test.startTest();
		
		decimal cardReplacementCost = wrapper.getCardReplacementCost();
		
		Test.stopTest();


		// Then
		System.assert(true);
		System.assertNotEquals(NULL, cardReplacementCost);
	}
}