/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ContactWrapper
-- - Description: Encapsulates the contact and it&#39;s attributes
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ContactWrapper  {

	private Contact contact {get; set;}

	private ProductWrapper relatedProduct {get; set;}

	public ContactWrapper(Contact c) {
		ProductInformationContext.contextContact = this;
		this.contact = c;
		loadProductInfo();
	}
	
	private void loadProductInfo(){
		try{
			Product__c product = [SELECT Name, Id FROM Product__c WHERE Id =: contact.Product__c];
			relatedProduct = new ProductWrapper(product);
		}catch(QueryException ex){
			ProductWrapper blankProduct = new ProductWrapper(new Product__c(Name = 'Empty Product'));
			relatedProduct = blankProduct;
		}

	}
	
	public ProductWrapper getYourProduct(){
		return relatedProduct;
	}

	public string getHomeCountry(){
		return contact.Home_Country__c;
	}

}