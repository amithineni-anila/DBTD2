public with sharing class GetDetails {
    @AuraEnabled
	public static dbt__Timesheet__c getDetailsRecords(Id recID){
		dbt__Timesheet__c Employee = [SELECT dbt__Employee__r.Name, dbt__Start_Date__c, dbt__End_Date__c, dbt__Manager__r.Name, dbt__Manager__r.Email, dbt__Billable_Hours__c, dbt__Non_Billable_Hours__c, dbt__Total_Hours__c, (SELECT dbt__Duration__c, dbt__Type__c, dbt__Date__c FROM dbt__Timesheets__r) FROM dbt__Timesheet__c WHERE Id = :recID] ;
		return Employee;
	}
}