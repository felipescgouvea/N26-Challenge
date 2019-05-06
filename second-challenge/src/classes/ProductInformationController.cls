/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        ProductInformationController
-- - Description: Control Back-end information to Lightning Component
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/04/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class ProductInformationController {

	private static ProductService service = new ProductService();
	
	@AuraEnabled
	public static ProductDTO loadRelatedProduct(Id recordId){
		return ProductInformationController.service.loadRelatedProduct(recordId);
	}
}