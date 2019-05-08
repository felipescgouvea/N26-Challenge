# N26 Challenge

[![N|26](https://i.imgur.com/crg9fXq.png)](https://n26.com/en-eu)
The Mobile Bank, The world at your fingertips


# Challenge 1!

  - Contains the functionality to send emails to it's customer once a day according to customer country
  - Languages are allowed by their ISO 693-1 Code (Assuming only "en" and "de")
  - survey_date__c field are read-only by default, being modified only by services/system
  - to schedule the action just go to [Scheduler Script](https://github.com/felipescgouvea/N26-Challenge/blob/master/first-challenge/apex-scripts/SchedulerScript.cls) and run content on [anonymous console](https://help.salesforce.com/articleView?id=code_dev_console_execute_anonymous.htm&type=5) 

### Demonstration
 - English Email
![](https://i.imgur.com/6d5oI44.png)
 - Deutsch Email
![](https://i.imgur.com/QSeJIeX.png)

### Details
> Daily Limit on email sent is avoided by [Survey Send](https://github.com/felipescgouvea/N26-Challenge/blob/master/second-challenge/src/classes/SurveySend.cls) where it reserves at least scope size limit to proceed


# Challenge 2!
  - ***ProductInformation*** lightning component is visible on [Case Record Page](https://github.com/felipescgouvea/N26-Challenge/blob/master/second-challenge/src/FlexiPage/Case_Record_Page)
  - Find customer's product based on ***Product__c*** and ***Home_Country__c***
  - Contains a price engine calculator to determine product's fee
  
### Demonstration
 - Standard Product![](https://i.imgur.com/YWGA6ZX.png)
 - Black Product![](https://i.imgur.com/jykdFQF.png)
 - Metal Product ![](https://i.imgur.com/WCtKhh7.png)
 - ProductInformation Snippet![](https://i.imgur.com/cPS1hbt.png)

### Details
> **Accountable** interface determine what would be the services offered by products in general.(e.g.: Monthly Cost)

> **Command** interface implements the pattern, encapsulating price rules

> **ProductCategoryAbstract** defines a behaviour to calculate product prices taking product category in account (e.g.: Standard)

> To determine which parameters will be used to calculate prices just go to [ProductDetailWrapper](https://github.com/felipescgouvea/N26-Challenge/blob/master/first-challenge/src/classes/ProductDetailWrapper.cls)
>


### Principles
> ***Oriented-Object Programming*** (encapsulation, abstraction, inheritance, polymorphism)

> ***Open/Closed principle*** (Open for extension, closed for change)

> ***Design Patterns*** (Command)

### Installation

Installation requires an [Salesforce Platform](https://www.salesforce.com/) environment which can be freely acquired [Here](https://developer.salesforce.com/signup)

Now just clone the repository, make a zip and deploy it through [Developer Workbench](https://workbench.developerforce.com/login.php) as explained in [Help Salesforce](https://help.salesforce.com/articleView?id=000247614&language=en_US&type=1)


### Thanks

I would like to thank Bank N26 for giving me the opportunity to participate in this very interesting process.



