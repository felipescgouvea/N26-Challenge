/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ATMFeeForProductRule
-- - Description: Represent an calculation rule to ATM Fee regarding Customer Product
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ATMFeeForProductRule extends ProductCategoryAbstract {


	public ATMFeeForProductRule() {
		super();
		setPrices();
	}
	
	
	private void setPrices(){
		super.defineProductPrice('Standard', 0.017);
		super.defineProductPrice('Black', 0);
		super.defineProductPrice('Metal', 0);
	}
}