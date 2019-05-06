/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ATMFeeForProductRuleTest
-- - Description: Test class for ATMFeeForProductRule
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
--       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class ATMFeeForProductRuleTest
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
		
		ATMFeeForProductRule rule = new ATMFeeForProductRule();
		decimal standardProductPrice = rule.getProductPrice('Standard');
		decimal blackProductPrice = rule.getProductPrice('Black');
		decimal metalProductPrice = rule.getProductPrice('Metal');
		decimal nullProductPrice = rule.getProductPrice('XPTO');

		Test.stopTest();


		// Then
		System.assert(true);

		System.assertEquals(0.017, standardProductPrice);
		System.assertEquals(0, blackProductPrice);
		System.assertEquals(0,metalProductPrice);
		System.assertEquals(0, nullProductPrice);
	}
}