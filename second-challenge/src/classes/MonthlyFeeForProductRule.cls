/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        MonthlyFeeForProductRule
-- - Description: Bring product category command
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class MonthlyFeeForProductRule extends ProductCategoryAbstract {



	public MonthlyFeeForProductRule() {
		super();
		setPrices();
	}
	
	/************

	Use the map defaultPrices to define 
	prices for each product

	*************/
	public void setPrices(){
		defaultPrices.put('Standard', 0);
		defaultPrices.put('Black', 9.9);
		defaultPrices.put('Metal', 16.90);
	}

}