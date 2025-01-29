public class TestTimesheetdetails {
    public static dbt__Timesheet__c TestTimesheetdetailsRecords(Id recId){
        return [SELECT Id, (SELECT Id, Name FROM dbt__Timesheets__r) FROM dbt__Timesheet__c WHERE Id = :recId];
    }

}