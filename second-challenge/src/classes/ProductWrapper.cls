/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductWrapper
-- - Description: Encapsulates Product`s attributes and it&#39;s behaviours
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ProductWrapper implements Accountable {

	private Product__c product {get; set;}

	private Map<string, ProductDetailWrapper> productDetails {get; set;}

	public Map<string, sobject> relatedEntities {get; set;}

	public ProductWrapper(Product__c p) {
		ProductInformationContext.contextProduct = this;
		this.product = p;

		relatedEntities = new Map<string, sobject>();
		loadProductDetails();
	}
	
	private void loadProductDetails(){
		productDetails = new Map<string, ProductDetailWrapper>();
		for(Product_Detail__c detail : [SELECT Name, Parent_Product__c FROM Product_Detail__c WHERE Parent_Product__c =: product.Id]){
			productDetails.put(detail.Name, new ProductDetailWrapper(detail));
		}
	}

	public decimal getMonthlyCost(){
		decimal cost;
		try{
			ProductDetailWrapper detail = productDetails.get('Monthly Cost');
			cost = detail.getMonthlyCost();
		} catch(NullPointerException ex){
			System.debug(ex);
			cost = 0;
		}
		return cost;
	}

	public decimal getATMFee(){
		decimal cost;
		try{
			ProductDetailWrapper detail = productDetails.get('ATM Fee in other currencies');
			cost = detail.getATMFee();
		} catch(NullPointerException ex){
			System.debug(ex);
			cost = 0;
		}
		return cost;
	}

	public decimal getCardReplacementCost(){
		decimal cost;
		try{
			ProductDetailWrapper detail = productDetails.get('Card Replacement Cost');
			cost = detail.getCardReplacementCost();
		} catch(NullPointerException ex){
			System.debug(ex);
			cost = 0;
		}
		return cost;
	}

	public string getName(){
		return product.Name;
	}


}