/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductDetailWrapper
-- - Description: Encapsulate product details and it's behaviours
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ProductDetailWrapper implements Accountable {

	private Product_Detail__c detail {get; set;}

	public ProductDetailWrapper(Product_Detail__c detail) {
		this.detail = detail;

	}
	


	public decimal getMonthlyCost(){
		PriceCalculator calculator = new PriceCalculator();	
		calculator.injectParameter(new MonthlyFeeForProductRule());
		return calculator.calculate();
	}

	public decimal getATMFee(){
		PriceCalculator calculator = new PriceCalculator();
		calculator.injectParameter(new ATMFeeForProductRule());
		return calculator.calculate();
	}

	public decimal getCardReplacementCost(){
		PriceCalculator calculator = new PriceCalculator();
		calculator.injectParameter(new CardReplacementForProductRule());
		return calculator.calculate();
	}

}