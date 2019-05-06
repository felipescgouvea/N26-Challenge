/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveyService
-- - Description: Support surveys CRUD actions
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 03/05/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class SurveyService {

	public  List<SurveyRecipient> recipients {get; set;}

	public SurveyService() {
	}
	
	public  void sendSurveysTo(List<sObject> targets){
		recipients = new List<SurveyRecipient>();

		for(sObject target : targets){
			recipients.add(new SurveyRecipient(target));
		}

		SurveyEmailHelper.sendEmails(recipients);
	}


}