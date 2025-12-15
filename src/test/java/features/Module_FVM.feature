@FVM
Feature: Default
	
	@FVM1
  Scenario: Schedule Field visit from SA Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
     And Delete user via API
      | UserID |
      | FVM1   |
     And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM1 | FVM1 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM1   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM1   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T1       | FVM Automation | Saved Successfully |
    When Create Field Visit Schedule for User "FVM1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T1       | L1       | Schedule |
    Then Validate Scheduled visits for UserID="FVM1" in table on Field Visit Schedule page
      | Date | ScheduledVisits |
      |    0 |               1 |
	
	@FVM2
  Scenario: View Schedule Field visit from ESS Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
     And Delete user via API
      | UserID |
      | FVM2   |
     And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM2 | FVM2 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM2   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L2   | L2   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:02:01 | RnD1    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T2       | FVM Automation | Saved Successfully |
    When Create Field Visit Schedule for User "FVM2" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T2       | L2       | Schedule |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM2   |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | FVM2     | admin    | Welcome FVM2 |
    Then Validate Scheduled visits for Date="0" Field Visit Schedule page
      | Task | LocationGroup |
      | T2   | L2            |
	
   @FVM3
  Scenario Outline: Schedule Field visit from SA Login VIA Import
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM_3  |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM_3 | FVM_3 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM_3  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM_3  |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L3   | L3   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:03:01 | RnD3    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T3       | FVM Automation | Saved Successfully |
    When Import Data "Field Schedule"
      | User ID | Schedule Date | Start Date Time | End Date Time | Task ID | Location Code/Location Group ID |
      | FVM_3   |             0 | 0 09:00         | 0 18:00       | T3      | L3                              |
    And Import "<File Format>" and check Imported Data for "Field Schedule"
    	|UserID|Success|
    	|FVM_3	|Yes	|
    Then Validate imported visits in Field Visit Schedule page
      | UserID | Date | ScheduledVisits |
      | FVM_3  |    0 |               1 |
 
 Examples: 
      | File Format |
      |CSV         |
      | XLS         |
 

	
	@FVM4
  Scenario: Verify Field Visit status from SA Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM4   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM4 | FVM4 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM4   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM4   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T4       | FVM Automation | Saved Successfully |
    When Create Field Visit Schedule for User "FVM4" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T4       | L1       | Schedule |   
    Then Validate scheduled visit form Field visit status Page
      | UserID | AttendancePeriodMonth | AttendancePeriodYear | StartDate| EndDate     | ScheduleStartTime | ScheduleEndTime |TaskName | Location |
      | FVM4   |                     0 |                  0   |    0      |0           |	   0900          |             1000 |T4       | L1      |
	
	@FVM5
  Scenario: Verify Field Visit status from ESS Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM5   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM5 | FVM5 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM5   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM5   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T5       | FVM Automation | Saved Successfully |
    When Create Field Visit Schedule for User "FVM5" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T5       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM5   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | FVM5     | admin    | Welcome FVM5 |
    Then Validate scheduled visit form Field visit status Page for ESS login
      | AttendancePeriodMonth | AttendancePeriodYear | StartDate| EndDate     | ScheduleStartTime | ScheduleEndTime |TaskName | Location |
      |                     0 |                  0   |    0      |0           |	   0900          |             1000 |T5       | L1      |
	
		@FVM6
  Scenario: Apply Field Visit Correction from SA Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM6   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM6 | FVM6 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM6   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM6   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T6       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM6" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T6       | L1       | Schedule |
    When Apply Field Visit Correction from SA login
      | UserID | Date | Time | Location | Comment       | Validation         |
      | FVM6   |    0 | 0900 | L1       | FVS Corrected | Saved Successfully |
      | FVM6   |    0 | 1000 | L1       | FVS Corrected | Saved Successfully |
    Then Validate Field visit correction for UserID="FVM6" in table on Field Visit Correction page
      | Date | ScheduleStatus |
      |    0 | Success        |
	
	@FVM7
  Scenario: Apply Field Visit Correction from ESS Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM7   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM7 | FVM7 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM7   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM7   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T7       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM7" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T7       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM7   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | FVM7     | admin    | Welcome FVM7 |
    When Apply Field Visit Correction date on "0" from ESS login
       | Time | Location | Comment       | 
     	| 0900 | L1       | FVS Corrected | 
      | 1000 | L1       | FVS Corrected |
    Then Validate Field visit correction in table in Applicatiion detail tab on Field Visit Correction page
      | Date | Status  |
      |    0 | Pending |
		      
	
@FVM8
  Scenario: Reject Field Visit Correction authorization from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
     And Delete user via API
      | UserID |
      | FVM8   |
      |RIC1	|
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM8 | FVM8 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | RIC1 | RIC1 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | FVM8   | RG1            |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM8   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM8   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T8       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM8" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T8       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM8   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | FVM8     | admin    | Welcome FVM8 |
		When Apply Field Visit Correction date on "0" from ESS login
       | Time | Location | Comment       |
       | 0900 | L1       | FVS Corrected |  
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | RIC1     | admin    | Welcome RIC1  |
    Then Authorize Field visit corretion from RIC FromDate="-1" ToDate= "0"
      | UserName |AttendanceDate|  Approve | Reject | Validaton          |
      | FVM8     |        0		  |							 | true   | Saved Successfully |
    And Verify In "Reject" Tab in Field Visit Correction Authorization Page from RIC Login
      | UserName | AttendanceDate |
      | FVM8     |              0 |
      

	@FVM9
  Scenario: Approve Field Visit Correction authorization from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM9   |
      |RIC1	|
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM9 | FVM9 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | RIC1 | RIC1 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | FVM9   | RG1            |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM9   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM9   |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T9       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM9" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T9       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM9   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | FVM9     | admin    | Welcome FVM9 |
    When Apply Field Visit Correction date on "0" from ESS login
      | Time | Location | Comment       |
      | 0900 | L1       | FVS Corrected |   
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | RIC1     | admin    | Welcome RIC1 |
    Then Authorize Field visit corretion from RIC FromDate="-1" ToDate= "0"
      | UserName | AttendanceDate | Approve | Reject | Validaton          |
      | FVM9     |               0 | true    |        | Saved Successfully |
     And Verify In "Approve" Tab in Field Visit Correction Authorization Page from RIC Login
      | UserName | AttendanceDate |
      | FVM9     |              0 |
 	
	
	@FVM10
  Scenario: Reject Field Visit Correction authorization from SA Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM10   |
      |RIC1	|
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM10 | FVM10 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | FVM10  | RG1            |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM10  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM10  |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T10       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM10" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T10       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM10  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | FVM10    | admin    | Welcome FVM10 |
    When Apply Field Visit Correction date on "0" from ESS login
      | Time | Location | Comment       | 
       | 0900 | L1       | FVS Corrected |     
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login
      | UserName | AttendanceDate | Approve | Reject | Validaton          |
      | FVM10    |              0 |         | true   | Saved Successfully |
    And Verify In "Reject" Tab in Field Visit Correction Authorization Page from SA Login
      | UserName | AttendanceDate |
      | FVM10    |              0 |
 

  @FVM11
  Scenario: Approve Field Visit Correction authorization from SA Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM11   |
      |RIC1	|
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM11 | FVM11 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | FVM11  | RG1            |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM11  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM11  |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T11      | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM11" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T11       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | FVM11    | admin    | Welcome FVM11 |
    When Apply Field Visit Correction date on "0" from ESS login
      | Time | Location | Comment       |
      | 0900 | L1       | FVS Corrected |    
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login
      | UserName | Attendance Date | Approve | Reject | Validaton          |
      | FVM11    |               0 | true    |        | Saved Successfully |
    And Verify In "Approve" Tab in Field Visit Correction Authorization Page from SA Login
      | UserName | AttendanceDate |
      | FVM11    |              0 | 
    And Verify In "Approve" Tab in Field Visit Correction Authorization Page from SA Login
      | UserName | AttendanceDate |
      | FVM11    |               0 |
	
	@FVM12
  Scenario: Field visit status view after field visit correction authorization approval in SA login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   And Delete user via API
      | UserID |
      | FVM12   |
      |RIC1	|
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM12 | FVM12 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | FVM12  | RG1            |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM12  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM12  |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L1   | L1   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T12       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM12" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T12       | L1       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM12  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | FVM12    | admin    | Welcome FVM12|
    When Apply Field Visit Correction date on "0" from ESS login
      | Time | Location | Comment       | 
       | 0900 | L1       | FVS Corrected |     
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login
      | UserName | AttendanceDate | Approve | Reject | Validaton          |
      | FVM12    |              0 | true    |        | Saved Successfully |
    Then Validate scheduled visit form Field visit status Page
      | UserID | AttendancePeriodMonth | AttendancePeriodYear | StartDate| EndDate     | ScheduleStartTime | ScheduleEndTime |TaskName | Location |
      | FVM12   |                     0 |                  0   |    0      |0           |	   0900          |             1000 |T12       | L1      |
	
  
      
 @FVM13
  Scenario: Field visit status view after field visit correction authorization approval in ESS login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM13   |
      |RIC1	|
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM13 | FVM13 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | FVM13  | RG1            |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM13  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM13  |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L13   | L13   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:13:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T13       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM13" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T13       | L13       | Schedule |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | FVM13  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation           |
      | FVM13    | admin    | Welcome FVM13 |
    When Apply Field Visit Correction date on "0" from ESS login
      | Time | Location | Comment       |
     | 0900 | L13       | FVS Corrected |   
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login
      | UserName | Attendance Date | Approve | Reject | Validaton          |
      | FVM13    |               0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Validate scheduled visit form Field visit status Page
      | UserID | AttendancePeriodMonth | AttendancePeriodYear | StartDate| EndDate     | ScheduleStartTime | ScheduleEndTime |TaskName | Location |
      | FVM13  |                     0 |                  0   |    0      |0           |	   0900          |            1000 |T13      | L13      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | FVM13    | admin    | Welcome FVM13 |
   Then Validate scheduled visit form Field visit status Page for ESS login
      | AttendancePeriodMonth | AttendancePeriodYear | StartDate| EndDate     | ScheduleStartTime | ScheduleEndTime |TaskName | Location |
      |                     0 |                  0   |    0      |0           |	   0900          |             1000 |T13       | L13      |  

	
	  @FVM14
  Scenario: Field visit schedule is copied to another user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
     And Delete user via API
      | UserID |
      | FVM14   |
      |FVMM1	|
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM14 | FVM14 |               1 |         1 |               1 |                  1 |               |                |          1 |
      | FVMM1 | FVMM1 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM14  |
      | FVMM1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM14  |
      | FVMM1  |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L14   | L14   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:14:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T14      | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM14" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T14       | L14       | Schedule |
    And Copy created Field Visit Schedule
      | FVSOfUser | FVSToUser | Date | Validation          |
      | FVM14     | FVMM1     |    0 | Copied Successfully |
    Then Validate Scheduled visits for UserID="FVMM1" in table on Field Visit Schedule page
      | Date | ScheduledVisits |
      |    0 |                1 |
	
	@FVM15
  Scenario: Field visit schedule is re assigned to user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | FVM15   |
      
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | FVM-enable |
      | FVM15 | FVM15 |               1 |         1 |               1 |                  1 |               |                |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | FVM15  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | FVM15  |
    And Create Location from Location master
      | Code  | Name  | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L15   | L15   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:15:01 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | T15      | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVM15" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | T15       | L15       | Schedule |
    And Re-assign created Field Visit Schedule
      | FVSOfUser | FVSToUser |ScheduledDate    | ReassignDate | Validation              |
      | FVM15     | FVM15     | 0								|  -1 				 |  Reassigned Successfu...|
    Then Validate Scheduled visits for UserID="FVM15" in table on Field Visit Schedule page
      | Date | ScheduledVisits |
      |   -1 |               1 |


	