/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        Accountable
-- - Description: Define standard behaviour to classes who need to be accountable
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public interface Accountable {
	decimal getMonthlyCost();

	decimal getATMFee();

	decimal getCardReplacementCost();
}