/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductDTO
-- - Description: Product Data Transfer Object to move data between back-end and front-end
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ProductDTO {

	public static final string PERCENTAGE = '%';

	@AuraEnabled
	public string productName {get; set;}

	@AuraEnabled
	public list<ProductDetail> details {get; set;}

	public ProductDTO(ProductWrapper product){
		try{
			productName = product.getName();
			details = new List<ProductDetail>();
	
			details.add(new ProductDetail('Monthly Price',  product.getMonthlyCost(), UserInfo.getDefaultCurrency()));
			details.add(new ProductDetail('ATM Fee',  product.getATMFee(), PERCENTAGE));
			details.add(new ProductDetail('Card Replacement Cost', product.getCardReplacementCost(),  UserInfo.getDefaultCurrency()));
		} catch(Exception ex){
			productName = 'Error';
		}
	}

	public class ProductDetail {
		@AuraEnabled
		public string name {get; set;}

		@AuraEnabled
		public string price {get; set;}

		public ProductDetail(string name, decimal price, string complement){
			this.name = name;
			this.price = String.valueOf(price) + ' ' + complement;
		}
	}
}