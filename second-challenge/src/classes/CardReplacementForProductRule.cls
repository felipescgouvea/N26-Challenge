/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        CardReplacementForProductRule
-- - Description: Represent an calculation rule to Card Replacement cost regarding Customer Product
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class CardReplacementForProductRule extends ProductCategoryAbstract {

	public CardReplacementForProductRule() {
		super();	
		setPrices();
	}

	private void setPrices(){
		super.defineProductPrice('Standard', 6);
		super.defineProductPrice('Black', 6);
		super.defineProductPrice('Metal', 45);
	}


}