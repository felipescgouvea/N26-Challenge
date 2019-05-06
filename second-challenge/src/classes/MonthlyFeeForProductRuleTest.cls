/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        MonthlyFeeForProductRuleTest
-- - Description: Test class for MonthlyFeeForProductRule
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
--       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class MonthlyFeeForProductRuleTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Product__c product = new Product__c(Name='Test');
		insert product;
	}

	@isTest
	static void ATMFeeForProductRuleTest()
	{
		// Given
		Product__c product = [SELECT Name FROM Product__c LIMIT 1];
		ProductInformationContext.contextProduct = new ProductWrapper(product);


		// When
		Test.startTest();
		
		MonthlyFeeForProductRule rule = new MonthlyFeeForProductRule();
		decimal standardProductPrice = rule.getProductPrice('Standard');
		decimal blackProductPrice = rule.getProductPrice('Black');
		decimal metalProductPrice = rule.getProductPrice('Metal');
		decimal nullProductPrice = rule.getProductPrice('XPTO');

		Test.stopTest();


		// Then
		System.assert(true);

		System.assertEquals(0.0, standardProductPrice);
		System.assertEquals(9.9, blackProductPrice);
		System.assertEquals(16.90, metalProductPrice);
		System.assertEquals(0, nullProductPrice);
	}
}