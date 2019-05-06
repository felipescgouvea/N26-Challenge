({
	loadProductInfo : function(component, event, helper) {
		var caseId = component.get("v.recordId");

		var loadRelatedProduct = component.get("c.loadRelatedProduct");

		loadRelatedProduct.setParams({ "recordId" : caseId });

		loadRelatedProduct.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Alert the user with the value returned 
                // from the server
                alert("From server: " + response.getReturnValue());
                console.log(JSON.parse(JSON.stringify(response.getReturnValue())));
                component.set("v.product", response.getReturnValue());
                var productDTO = response.getReturnValue();

                component.set("v.productName", productDTO.productName);


                component.set("v.columns", 
                    [
                        { label: productDTO.details[0].name, fieldName: 'MonthlyFee', type: 'text' },
                        { label: productDTO.details[1].name, fieldName: 'ATMFee', type: 'text' },
                        { label: productDTO.details[2].name, fieldName: 'CardReplacementCost', type: 'text' }
                    ]);



                var fetchData = {
                    MonthlyFee: productDTO.details[0].price,
                    ATMFee : productDTO.details[1].price,
                    CardReplacementCost : productDTO.details[2].price,
                }

                component.set("v.data", fetchData);



                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

		$A.enqueueAction(loadRelatedProduct);
	}
})