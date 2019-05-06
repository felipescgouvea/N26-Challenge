/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductCategoryAbstract
-- - Description: Represents an Product Category abstract parameter
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public abstract class ProductCategoryAbstract implements Command {


	public Map<string, decimal> defaultPrices {get; set;}

	public decimal definedPrice {get; set;}	

	public string category {get; set;}

	private static final string TEST_CATEGORY = 'Standard';

	public ProductCategoryAbstract(){
		defaultPrices = new Map<string, decimal>();
		definedPrice = 0;
		setPrices();
		if(Test.isRunningTest()) category = ProductCategoryAbstract.TEST_CATEGORY;
		else category = ProductInformationContext.contextProduct.getName();
		
		system.debug('definedPrice on Constructor : ' + definedPrice );
	}
	
	/************

	Use the map defaultPrices to define 
	prices for each product

	Example: defaultPrices.put('Black', 9.9);

	*************/


	abstract void setPrices();

	public virtual decimal execute(decimal intermediatePrice){
		definedPrice = this.getProductPrice(category);		
		system.debug('definedPrice on Execute : ' + definedPrice );
		if(intermediatePrice == null) intermediatePrice = 0;
		return intermediatePrice + definedPrice;
	}

	public decimal getProductPrice(string productName){
		decimal price = defaultPrices.get(productName);
		if(price == NULL) price = 0;
		return price;

	}

	public void defineProductPrice(string productName, decimal price){
		defaultPrices.put(productName, price);
	}
}