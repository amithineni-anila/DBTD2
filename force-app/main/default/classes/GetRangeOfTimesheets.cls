public with sharing class GetRangeOfTimesheets {
    @AuraEnabled
    public static List<dbt__Timesheet__c> getTimesheets(Id recordID, Date startDate, Date endDate){
        return[SELECT Id, dbt__Employee__c, dbt__Employee__r.Name, dbt__Manager__r.Name,dbt__Employee__r.Client_Manager__r.Name, dbt__Employee__r.Client_Manager_email__c, dbt__Employee__r.Client__c, dbt__Billable_Hours__c, dbt__Non_Billable_Hours__c, dbt__Total_Hours__c, dbt__Start_Date__c, dbt__End_Date__c, dbt__Manager__r.Email FROM dbt__Timesheet__c WHERE dbt__Employee__c = :recordID AND dbt__Start_Date__c >= :startDate AND dbt__End_Date__c <= :endDate order by dbt__Start_Date__c];
    }
}