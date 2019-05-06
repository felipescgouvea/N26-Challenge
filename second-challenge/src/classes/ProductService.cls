/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductService
-- - Description: Provide functions regarding Product__c
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/04/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ProductService {
	public ProductService() {
		
	}
	
	
	public ProductDTO loadRelatedProduct(Id caseId){
		ProductDTO dataTransferObject;
		try{
			Case contextCase = [SELECT ContactId FROM Case WHERE Id =: caseId];
			Contact relatedContact = [SELECT Product__c, Home_Country__c FROM Contact WHERE Id =: contextCase.contactId];
			ContactWrapper contact = new ContactWrapper(relatedContact);
			ProductWrapper product = contact.getYourProduct();
			dataTransferObject = new ProductDTO(product);
		} catch(QueryException ex){
			dataTransferObject = new ProductDTO(null);
		}


		return dataTransferObject;
	}
}