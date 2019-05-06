/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveyRecipient
-- - Description: Wrapper class to content survey recipients
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/03/2019       Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class SurveyRecipient  {

	public SObject recipient {get; set;}

	public string languageIsoCode {get; set;}

	public string email {get; set;}

	public SurveyRecipient(SObject recipient) {
		this.recipient = recipient;
		languageIsoCode = ((string) recipient.get('language__c')) == NULL ? 'EN' : ((string) recipient.get('language__c'));
		email = (string) recipient.get('Email');

	}

	public void updateSurveyDate(Date surveyDate){
		recipient.put('Survey_Date__c', surveyDate);
	}

	public Contact getContact(){
		return (Contact) recipient;
	}

}