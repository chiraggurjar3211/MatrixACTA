@T&A
Feature: Daily Attendance Authorization
  I want to use this template for my feature file


    @TA_DailyAtd1
  Scenario: Daily Attendance - 4 punch user - "Daily Attendance Authorization Required"= true - Authorized by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | DA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AD"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | DA_AtdPlc1 |                4 | True            |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | AtdEnable | AttendancePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | DA_Ur1 | True   | True      | DA_AtdPlc1    |                   | AD            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | DA_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DA_Ur1 |         -1 |     090000 |
      | DA_Ur1 |         -1 |     130000 |
      | DA_Ur1 |         -1 |     140000 |
      | DA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | AB       | AB       |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Daily Attendance Authorization from SA Date from= "-2" To= "0"
      | UserID | Date | Authorize |
      | DA_Ur1  |   -1 | true      |
    And Verify Authorized Attendance from Daily Attendance page in SA Date from= "-2" To= "0"
      | UserID | Date | Status      |
      | DA_Ur1  |   -1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |
  
  
  
   @TA_DailyAtd2
  Scenario: Daily Attendance - 4 punch user - "Daily Attendance Authorization Required"= true - Authorized by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DA_Ur1  |
      | DA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AD"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | DA_AtdPlc1 |                4 | True            |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | DA_Ric1 | DA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | DA_RGrp1         | AnyOne     | DA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |   Validation         |
      | DA_Ur1 | True   | DA_RGrp1       | True      | DA_AtdPlc1    |                   | AD            | True      | True      | True      | True               |                        4 |    Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | DA_Ur1  |                          1 | admin        |    1 |
      | DA_Ric1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DA_Ur1 |         -1 |     090000 |
      | DA_Ur1 |         -1 |     130000 |
      | DA_Ur1 |         -1 |     140000 |
      | DA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | AB       | AB       |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | DA_Ric1  | admin    | Welcome DA_Ric1 |
    And Approve Reject "Attendance" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Authorize | 
      | DA_Ur1  |   -1 | true      | 
    And Validate "Attendance" Application from RIC date From= "-2" To= "0"
     | UserID | Date | Status     |
     | DA_Ur1  |   -1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |
  
  @TA_DailyAtd3
  Scenario: Daily Attendance - N-Punch user - "Daily Attendance Authorization Required"= true - Authorized by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | DA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AD      |               7 |
   And Configure Off Day Configuration in Shift Schedule "AD"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | DA_AtdPlc1 | N-Punch          | True            |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | DA_Ur1 | True   |                | True      | DA_AtdPlc1    |                   | AD            | True      | True      | True      | True               | N-Punch                  |    Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | DA_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DA_Ur1 |         -1 |     090000 |
      | DA_Ur1 |         -1 |     120000 |
      | DA_Ur1 |         -1 |     130000 |
      | DA_Ur1 |         -1 |     150000 |
      | DA_Ur1 |         -1 |     170000 |
      | DA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | AB       | AB       |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Daily Attendance Authorization from SA Date from= "-2" To= "0"
      | UserID | Date | Authorize | 
      | DA_Ur1  |   -1 | true      |
    Then Verify Authorized Attendance from Daily Attendance page in SA Date from= "-2" To= "0"
      | UserID | Date | Status     |
      | DA_Ur1  |   -1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |Work Hours|
      |   -1 | 09:00    | 18:00    | PR       | AB       |06:00|
   
  
  @TA_DailyAtd4
  Scenario: Daily Attendance - N-Punch user - "Daily Attendance Authorization Required"= true - Authorized by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DA_Ur1  |
      | DA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AD"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | DA_AtdPlc1 | N-Punch          | True            |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | DA_Ric1 | DA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | DA_RGrp1         | AnyOne     | DA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | DA_Ur1 | True   | DA_RGrp1       | True      | DA_AtdPlc1    |                   | AD            | True      | True      | True      | True               | N-Punch                  |    Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | DA_Ur1  |                          1 | admin        |    1 |
      | DA_Ric1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DA_Ur1 |         -1 |     090000 |
      | DA_Ur1 |         -1 |     120000 |
      | DA_Ur1 |         -1 |     130000 |
      | DA_Ur1 |         -1 |     150000 |
      | DA_Ur1 |         -1 |     170000 |
      | DA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
     And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | AB       | AB       | 
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | DA_Ric1  | admin    | Welcome DA_Ric1 |
     When Approve Reject "Attendance" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Authorize | 
      | DA_Ur1  |   -1 | true      | 
    Then Validate "Attendance" Application from RIC date From= "-2" To= "0"
     | UserID | Date | Status     |
     | DA_Ur1  |   -1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
     And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |Work Hours|
      |   -1 | 09:00    | 18:00    | PR       | AB       |06:00|
 
  
   @TA_DailyAtd5
  Scenario: Daily Attendance - 4 Punch user - "Daily Attendance Authorization Required"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | DA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AD"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | DA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | DA_Ur1 | True   |                | True      | DA_AtdPlc1    |                   | AD            | True      | True      | True      | True               |                        4 |   Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | DA_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DA_Ur1 |         -1 |     090000 |
      | DA_Ur1 |         -1 |     130000 |
      | DA_Ur1 |         -1 |     140000 |
      | DA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       | 
  
  
  
 
 
 @TA_DailyAtd6
  Scenario: Daily Attendance - N-Punch user - "Daily Attendance Authorization Required"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | DA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AD"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | DA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DA_Ur1 | True   |                | True      | DA_AtdPlc1    |                   | AD            | True      | True      | True      | True               | N-Punch                  |   Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | DA_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DA_Ur1 |         -1 |     090000 |
      | DA_Ur1 |         -1 |     130000 |
      | DA_Ur1 |         -1 |     133000 |
      | DA_Ur1 |         -1 |     140000 |
      | DA_Ur1 |         -1 |     143000 |
      | DA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | DA_Ur1   | admin    | Welcome DA_Ur1 |
     Then Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |  
 