/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        PriceCalculatorTest
-- - Description: Test class for PriceCalculator
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
--       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

@isTest
private class PriceCalculatorTest
{

	@testSetup
	static void setup(){
		//Create test data here
		Product__c product = new Product__c(Name='Standard');
		insert product;
	
	}

	@isTest
	static void calculateWithoutRules()
	{
		// Given
		PriceCalculator calculator = new PriceCalculator();

		// When
		Test.startTest();
		
		Decimal result = calculator.calculate();


		Test.stopTest();


		// Then
		System.assert(true);

		System.assertEquals(0, result);
	}

	@isTest
	static void calculateWithManyRules()
	{
		// Given
		PriceCalculator calculator = new PriceCalculator();
		MonthlyFeeForProductRule monthlyRule = new MonthlyFeeForProductRule();
		CardReplacementForProductRule cardReplacementRule = new CardReplacementForProductRule();
		Product__c product = [SELECT Name FROM Product__c LIMIT 1];
		ProductWrapper contextProduct =  new ProductWrapper(product);
		

		// When
		Test.startTest();

		calculator.injectParameter(cardReplacementRule);
		calculator.injectParameter(monthlyRule);
		Decimal result = calculator.calculate();


		Test.stopTest();


		// Then
		System.assert(true);

		decimal finalSum = monthlyRule.getProductPrice(product.Name) + cardReplacementRule.getProductPrice(product.Name);
		System.assertEquals(finalSum, result);
	}
}