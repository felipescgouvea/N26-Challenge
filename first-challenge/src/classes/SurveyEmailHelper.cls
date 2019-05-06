/* 
----------------------------------------------------------------------------------------------
-- - Company:     N26 Bank
-- - Name:        SurveyEmailHelper
-- - Description: Helper class to send emails
-- - @Author: Felipe Gouvea
-- ------------------------------------------------------------------------------------------
--
-- Date              Name               Version                   
----------------------------------------------------------------------------------------------
-- 05/03/2019        Felipe Gouvea      1.0         
----------------------------------------------------------------------------------------------
*/

public class SurveyEmailHelper {

	public static final string DEFAULT_EMAIL_FOLDER = 'Survey Email Templates';

	public static Boolean ALL_EMAILS_OR_NOTHING = FALSE;

	public static Map<string, EmailTemplate> templates {get; set;}

	public static Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{};

	public static void sendEmails(List<SurveyRecipient> recipients){
		SurveyEmailHelper.buildTemplatesMap();

		for(SurveyRecipient recipient: recipients){
			try{
				EmailTemplate template = SurveyEmailHelper.templates.get(recipient.languageIsoCode.toUpperCase());
				
				Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
				message.toAddresses = new String[] { recipient.email };
				message.templateId = template.Id;
				message.TargetObjectId = recipient.recipient.Id;
				message.setTreatTargetObjectAsRecipient(true);

				SurveyEmailHelper.messages.add(message);
			}
			catch(NullPointerException ex){
				System.debug('Exception Cause: ' + ex.getCause());
			}
		}

		if(SurveyEmailHelper.messages.size() > 0){
			List<Contact> contacts = new List<Contact>();
			Messaging.SendEmailResult[] results = Messaging.sendEmail(SurveyEmailHelper.messages, SurveyEmailHelper.ALL_EMAILS_OR_NOTHING);
			for(integer i = 0; i < results.size(); i++){
					if (results[i].success) {
							SurveyRecipient recipient = recipients.get(i);
							recipient.updateSurveyDate(NULL);
							contacts.add(recipient.getContact());
						    System.debug('The email was sent successfully.');
					} else {
						    System.debug('The email failed to send: '  + results[i]);
					}

			}
			database.update(contacts);
		}
	}

	private static void buildTemplatesMap(){
		templates = new Map<string, EmailTemplate>();
		List<EmailTemplate> templatesList =[SELECT  Subject, Body from EmailTemplate where Folder.Name =: SurveyEmailHelper.DEFAULT_EMAIL_FOLDER];
		for( EmailTemplate template : templatesList) templates.put(template.Subject.toUpperCase(), template);
		System.assert(templatesList.size() > 0, 'There must be at least one Email Template created on Default Survey Email Folder');

	}
}