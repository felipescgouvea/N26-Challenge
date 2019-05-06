/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        PriceCalculator
-- - Description: Calculate price for N26 Bank products
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class PriceCalculator {
	private List<Command> commands {get; set;}
	
	public PriceCalculator() {
		commands = new List<Command>();
	}
	
	public void injectParameter(Command command){
		commands.add(command);
	}

	public decimal calculate(){
		decimal finalPrice = 0;
		decimal intermediatePrice = 0;
		for(Command command : commands){
			finalPrice = command.execute(intermediatePrice);
			intermediatePrice = finalPrice;
		}

		return finalPrice;
	}
}