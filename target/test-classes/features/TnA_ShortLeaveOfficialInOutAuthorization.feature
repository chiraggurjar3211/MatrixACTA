@TnA
Feature: Short Leave/Official In-Out Authorization
  I want to use this template for my feature file

  @SLOIOAuth_1
  Scenario: ShortLeave IN/OUT Approved by RIC -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                | False                |                           |                          | False               | False               | False                | False                | true          | true                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | true    |        | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Approved |
      | Approved  | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 18:00    | PR       | PR       | SHORT LEAVE |
      |   -2 | 09:00    | 17:00    | PR       | PR       | SHORT LEAVE |

  @SLOIOAuth_2
  Scenario: ShortLeave IN/OUT Rejected by RIC -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | true          | true                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Rejected |
      | Rejected  | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Rejected |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |

  @SLOIOAuth_3
  Scenario: ShortLeave IN/OUT Approved/Rejected by RIC -> Two applications on One day, Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | True          | True                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      |   -1 | 09:15    | 17:00    | PR       | AB       | AB:Early-OUT |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason   |
      | 09:15 | ShortLeave IN   | Bank     |
      | 17:00 | ShortLeave OUT  | Personal |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    When Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-1" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-1" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Approved |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 17:00    | PR       | AB       | SHORT LEAVE |

  @SLOIOAuth_4
  Scenario: ShortLeave IN/OUT -> Short Leave Authorization Required= false, Add Short Leave Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 18:00    | PR       | PR       | SHORT LEAVE |
      |   -2 | 09:00    | 17:00    | PR       | PR       | SHORT LEAVE |

  @SLOIOAuth_5
  Scenario: Official IN/OUT Approved by RIC -> Official IN/OUT Authorization Required= true, Add Official Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | True             | True               |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | true    |        | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Approved |
      | Approved  | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      |   -1 | 09:15    | 18:00    | PR       | PR       | OFFICIAL |
      |   -2 | 09:00    | 17:00    | PR       | PR       | OFFICIAL |

  @SLOIOAuth_6
  Scenario: Official IN/OUT Rejected by RIC -> Official IN/OUT Authorization Required= true, Add Official Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | True             | True               |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    When Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Rejected |
      | Rejected  | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Rejected |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |

  @SLOIOAuth_7
  Scenario: Official IN/OUT Approved/Rejected by RIC -> Two applications on One day, Official IN/OUT Authorization Required= true, Add Official Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | True             | True               |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      |   -1 | 09:15    | 17:00    | PR       | AB       | AB:Early-OUT |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason        |
      | 09:15 | Official IN     | ByAutomation1 |
      | 17:00 | Official OUT    | ByAutomation2 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-1" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -1 | Official        | 17:00 | 18:00 | true    |        | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-1" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Rejected |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Official        | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Rejected |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      |   -1 | 09:15    | 17:00    | PR       | AB       | OFFICIAL |

  @SLOIOAuth_8
  Scenario: Official IN/OUT -> Official IN/OUT Authorization Required= false, Add Official Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | False            | True               |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      |   -1 | 09:15    | 18:00    | PR       | PR       | OFFICIAL |
      |   -2 | 09:00    | 17:00    | PR       | PR       | OFFICIAL |

  @SLOIOAuth_9
  Scenario: ShortLeave IN/OUT Approved by RIC -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | true          | true                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    When Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | true    |        | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Approved |
      | Approved  | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 18:00    | PR       | PR       | SHORT LEAVE |
      |   -2 | 09:00    | 17:00    | PR       | PR       | SHORT LEAVE |

  @SLOIOAuth_10
  Scenario: ShortLeave IN/OUT Rejected by RIC -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | true          | true                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    When Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Rejected |
      | Rejected  | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Rejected |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |

  ####N-Punch user application starts################
  @SLOIOAuth_11
  Scenario: Short Leave Approved/Rejected by RIC -> Two applications on One day, Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | True          | True                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      |   -1 | 09:15    | 17:00    | PR       | AB       | AB:Early-OUT |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-1" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-1" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Approved |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 17:00    | PR       | AB       | SHORT LEAVE |

  @SLOIOAuth_12
  Scenario: ShortLeave IN/OUT -> Short Leave Authorization Required= false, Add Short Leave Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 18:00    | PR       | PR       | SHORT LEAVE |
      |   -2 | 09:00    | 17:00    | PR       | PR       | SHORT LEAVE |

@SLOIOAuth_13
  Scenario: Official IN/OUT Approved by RIC -> Official IN/OUT Authorization Required= true, Add Official Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | True             | True               |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    When Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official   | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Official   | 17:00 | 18:00 | true    |        | Saved Successfully |
    Then Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Official   | 09:00 | 09:15 | Approved |
      | Approved  | ShLvOffIO_Ur1 |   -2 | Official   | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      |   -1 | 09:15    | 18:00    | PR       | PR       | OFFICIAL |
      |   -2 | 09:00    | 17:00    | PR       | PR       | OFFICIAL |

  
 
   @SLOIOAuth_14
  Scenario: Official IN/OUT Rejected by RIC -> Official IN/OUT Authorization Required= true, Add Official Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | True             | True               |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Rejected |
      | Rejected  | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Rejected |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
      
         @SLOIOAuth_15
  Scenario: Official IN/OUT Approved/Rejected by RIC -> Two applications on One day, Official IN/OUT Authorization Required= true, Add Official Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | ShLvOffIO_Ur1  |
      | ShLvOffIO_Ric1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | True             | True               |                       | Saved Successfully |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ShLvOffIO_Ric1 | ShLvOffIO_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ShLvOffIO_RGrp1  |        1 | ShLvOffIO_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup  | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | ShLvOffIO_RGrp1 | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      |   -1 | 09:15    | 17:00    | PR       | AB       | AB:Early-OUT |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
      | 17:00 | Official OUT    | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | ShLvOffIO_Ric1 | admin    | Welcome ShLvOffIO_Ric1 |
    When Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "-1" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -1 | Official        | 17:00 | 18:00 | true    |        | Saved Successfully |
    Then Validate "Short Leave/Official IN-OUT" Application from RIC date From= "-1" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      |  Rejected | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Rejected |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Official        | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Rejected |
      |   -1 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      |   -1 | 09:15    | 17:00    | PR       | AB       | OFFICIAL |
      
       @SLOIOAuth_16
  Scenario: Official IN/OUT -> Official IN/OUT Authorization Required= false, Add Official Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | False            | True               |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      |   -1 | 09:15    | 18:00    | PR       | PR       | OFFICIAL |
      |   -2 | 09:00    | 17:00    | PR       | PR       | OFFICIAL |
 
 ####ShortLeave/Official IN/OUT Approval by SA Start
 
 @SLOIOAuth_17
  Scenario: ShortLeave/Official IN/OUT Approved by SA -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                | False                |                           |                          | False               | False               | False                | False                | true          | true                 | true            | true              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   |                | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Approve Reject Short Leave/Official IN-OUT Application from SA Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | true    |        | Saved Successfully |
    And Validate Short Leave/Official IN-OUT Application from SA date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Approved |
      | Approved  | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 18:00    | PR       | PR       | SHORT LEAVE |
      |   -2 | 09:00    | 17:00    | PR       | PR       | OFFICIAL    |
      
      
  @SLOIOAuth_18
  Scenario: ShortLeave/Official IN/OUT Rejected by SA -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | true          | true                 | true            | true              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   |                | True      | True      | True      | True      | True               |                        4 | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     130000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     130000 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Approve Reject Short Leave/Official IN-OUT Application from SA Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate Short Leave/Official IN-OUT Application from SA date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Rejected |
      | Rejected  | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Rejected |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
      
      @SLOIOAuth_19
  Scenario: ShortLeave/Official IN/OUT Approved by SA -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | true          | true                 | true            | true              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   |                | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | Official OUT    | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Short Leave/Official IN-OUT Application from SA Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | true    |        | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | true    |        | Saved Successfully |
    And Validate Short Leave/Official IN-OUT Application from SA date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Approved  | ShLvOffIO_Ur1 |   -1 | Short Leave     | 09:00 | 09:15 | Approved |
      | Approved  | ShLvOffIO_Ur1 |   -2 | Official        | 17:00 | 18:00 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      |   -1 | 09:15    | 18:00    | PR       | PR       | SHORT LEAVE |
      |   -2 | 09:00    | 17:00    | PR       | PR       | OFFICIAL    |
      
      
 @SLOIOAuth_20
  Scenario: ShortLeave/Official IN/OUT Rejected by SA -> Short Leave Authorization Required= true, Add Short Leave Hours In Work Hours= true (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Delete "AI" shift schedule
    And Delete "AI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AI"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffIO | N-Punch          | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | true          | true                 | true            | true              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffIO_Ur1 | True   |                | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffIO     | AI            | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | ShLvOffIO_Ur1  |                          1 | admin        |    1 |
      | ShLvOffIO_Ric1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffIO_Ur1 |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffIO_Ur1 |         -1 |     091500 |
      | ShLvOffIO_Ur1 |         -1 |     133000 |
      | ShLvOffIO_Ur1 |         -1 |     140000 |
      | ShLvOffIO_Ur1 |         -1 |     150000 |
      | ShLvOffIO_Ur1 |         -1 |     153000 |
      | ShLvOffIO_Ur1 |         -1 |     180000 |
      | ShLvOffIO_Ur1 |         -2 |     090000 |
      | ShLvOffIO_Ur1 |         -2 |     133000 |
      | ShLvOffIO_Ur1 |         -2 |     134500 |
      | ShLvOffIO_Ur1 |         -2 |     140000 |
      | ShLvOffIO_Ur1 |         -2 |     141500 |
      | ShLvOffIO_Ur1 |         -2 |     151500 |
      | ShLvOffIO_Ur1 |         -2 |     154500 |
      | ShLvOffIO_Ur1 |         -2 |     170000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-1" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | Official IN     | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "-2" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:00 | ShortLeave OUT  | ByAutomation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Pending |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Short Leave/Official IN-OUT Application from SA Date from= "-2" To= "0"
      | UserID        | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 |         | true   | Saved Successfully |
      | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 |         | true   | Saved Successfully |
    And Validate Short Leave/Official IN-OUT Application from SA date From= "-2" To= "0"
      | PanelName | UserID        | Date | SpecialFunction | Start | End   | Status   |
      | Rejected  | ShLvOffIO_Ur1 |   -1 | Official        | 09:00 | 09:15 | Rejected |
      | Rejected  | ShLvOffIO_Ur1 |   -2 | Short Leave     | 17:00 | 18:00 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffIO_Ur1 | admin    | Welcome ShLvOffIO_Ur1 |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Official Hours   | Rejected |
      |   -2 | 17:00 | 18:00 | 01:00            | 01:00           | Short Leave      | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Remark           |
      |   -1 | 09:15    | 18:00    | PR       | AB       | AB:Less Work Hrs |
      |   -2 | 09:00    | 17:00    | PR       | AB       | AB:Early-OUT     |
  
 

 
  

