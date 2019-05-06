/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductDetailWrapperTest
-- - Description: Test class for ProductDetailWrapper
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
--       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ProductDetailWrapperTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Product__c product = new Product__c(Name='Standard');
		insert product;

		Product_Detail__c detail = new Product_Detail__c(Parent_Product__c = product.Id);
		insert detail;
	
	}

	testMethod
	static void testCostMethods()
	{
		// Given
		Product_Detail__c detail = [SELECT Parent_Product__c FROM Product_Detail__c LIMIT 1];
		ProductDetailWrapper wrapper = new ProductDetailWrapper(detail);
		// When
		Test.startTest();
		
		decimal monthlyCost = wrapper.getMonthlyCost();
		decimal ATMFee = wrapper.getATMFee();
		decimal cardReplacementCost = wrapper.getCardReplacementCost();
		Test.stopTest();


		// Then
		System.assert(true);
		
		decimal monthlyFeeForProductRuleStandardPrice = 0;
		decimal ATMFeeForProductRuleStandardPrice = 0.017;
		decimal cardReplacementCostForProductRuleStandardPrice = 0;

		System.assertEquals(monthlyFeeForProductRuleStandardPrice, monthlyCost);
		System.assertEquals(ATMFeeForProductRuleStandardPrice, ATMFee);
		System.assertEquals(cardReplacementCostForProductRuleStandardPrice, cardReplacementCost);
	}
}