/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        CardReplacementForProductRuleTest
-- - Description: Test class for CardReplacementForProductRule
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
--       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class CardReplacementForProductRuleTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Product__c product = new Product__c(Name='Test');
		insert product;
	}

	@isTest
	static void CardReplacementForProductRuleTest()
	{
		// Given
		Product__c product = [SELECT Name FROM Product__c LIMIT 1];
		ProductInformationContext.contextProduct = new ProductWrapper(product);


		// When
		Test.startTest();
		
		CardReplacementForProductRule rule = new CardReplacementForProductRule();
		decimal standardProductPrice = rule.getProductPrice('Standard');
		decimal blackProductPrice = rule.getProductPrice('Black');
		decimal metalProductPrice = rule.getProductPrice('Metal');
		decimal nullProductPrice = rule.getProductPrice('XPTO');

		Test.stopTest();


		// Then
		System.assert(true);

		System.assertEquals(0, standardProductPrice);
		System.assertEquals(6, blackProductPrice);
		System.assertEquals(45,metalProductPrice);
		System.assertEquals(0, nullProductPrice);
	}
}