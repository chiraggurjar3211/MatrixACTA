@T&A
Feature: 5 Level RIC - Any One Approval Policy - Overtime Daily1
  I want to use this template for my feature file

  @OTDaily1RICAnyOne1
  Scenario: Any One Approval Policy- Full OT Authorized by any one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1RICAnyOne2
  Scenario: Any One Approval Policy- Half OT Authorized by any one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTDaily1RICAnyOne3
  Scenario: Any One Approval Policy- Half OT Authorized by one RIC then Full OT Authorized by Other
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1RICAnyOne4
  Scenario: Any One Approval Policy- Full OT Authorized by one RIC then Half OT Authorized by Other
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTDaily1RICAnyOne5
  Scenario: RIC selection changed in Approval Policy page, OT Authorization status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | Status           |
      | Pending   | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | Status           |
      | Pending   | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | Status           |
      | Pending   | No Authorization |

  @OTDaily1RICAnyOne6
  Scenario: RIC selection changed in Approval Policy page, OT Authorization status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | Status           |
      | Pending   | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | Status           |
      | Authorized | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric5 - OTAO_Ric5 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | Status           |
      | Pending   | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1RICAnyOne7
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy page, OT Authorization status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric4 - OTAO_Ric4             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric3 - OTAO_Ric3 - Final RIC | Pending |

  @OTDaily1RICAnyOne8
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy page, OT Authorization status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |

  @OTDaily1RICAnyOne9
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy page, OT Authorization status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne10
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy page, OT Authorization status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne11
  Scenario: Any RIC gets removed from Reporting Group Page, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    |               | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1RICAnyOne12
  Scenario: Any RIC gets removed from Reporting Group, OT Authorization Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1.1 |
      | OTAO_Ric1   |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    |               | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne13
  Scenario: RIC (Which Authorized OT) gets removed from Reporting Group, OT Authorization Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | OTAO_Ur1  |
      | OTAO_Ric1 |
      | OTAO_Ric2 |
      | OTAO_Ric3 |
      | OTAO_Ric4 |
      | OTAO_Ric5 |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne14
  Scenario: Any RIC gets changed in Reporting Group, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1.1 | OTAO_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric1   | OTAO_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2   | OTAO_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3   | OTAO_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4   | OTAO_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5   | OTAO_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTAO_Ur1    |                          1 | admin        |    1 |
      | OTAO_Ric1.1 |                          1 | admin        |    1 |
      | OTAO_Ric1   |                          1 | admin        |    1 |
      | OTAO_Ric2   |                          1 | admin        |    1 |
      | OTAO_Ric3   |                          1 | admin        |    1 |
      | OTAO_Ric4   |                          1 | admin        |    1 |
      | OTAO_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1.1   | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                  | Status  |
      | OTAO_Ric1.1 - OTAO_Ric1.1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2     | Pending |
      | OTAO_Ric3 - OTAO_Ric3     | Pending |
      | OTAO_Ric4 - OTAO_Ric4     | Pending |
      | OTAO_Ric5 - OTAO_Ric5     | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTAO_Ric1.1 | admin    | Welcome OTAO_Ric1.1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1RICAnyOne15
  Scenario: Any RIC gets changed in Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1.1 | OTAO_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric1   | OTAO_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2   | OTAO_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3   | OTAO_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4   | OTAO_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5   | OTAO_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTAO_Ur1    |                          1 | admin        |    1 |
      | OTAO_Ric1.1 |                          1 | admin        |    1 |
      | OTAO_Ric1   |                          1 | admin        |    1 |
      | OTAO_Ric2   |                          1 | admin        |    1 |
      | OTAO_Ric3   |                          1 | admin        |    1 |
      | OTAO_Ric4   |                          1 | admin        |    1 |
      | OTAO_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1.1   | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTAO_Ric1.1 | admin    | Welcome OTAO_Ric1.1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | Status           |
      | Authorized | No Authorization |

  @OTDaily1RICAnyOne16
  Scenario: Any RIC gets added in Reporting Group, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     |               | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne17
  Scenario: Any RIC gets added in Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     |               | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | Status           |
      | Authorized | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne18
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric3 - OTAO_Ric3             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric4 - OTAO_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne19
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne20
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne21
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne22
  Scenario: Approval Policy gets removed from Reporting Group, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne23
  Scenario: Approval Policy gets removed from Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne24
  Scenario: Approval Policy gets added in Reporting Group, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne25
  Scenario: Approval Policy gets added in Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne26
  Scenario: Approval Policy gets added in User Configuration, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AnyOneApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne27
  Scenario: Approval Policy gets added in User Configuration, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AnyOneApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne28
  Scenario: Approval Policy gets added in User Configuration, Reporting Group Approval Policy= All, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric4 - OTAO_Ric4             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric3 - OTAO_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AnyOneApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne29
  Scenario: Approval Policy gets added in User Configuration, Reporting Group Approval Policy= All, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric3 - OTAO_Ric3             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric4 - OTAO_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | No Authorization |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AnyOneApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | No Authorization |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne30
  Scenario: Approval Policy gets added in User Configuration, Reporting Group Approval Policy= All Sequential, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AnyOneApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne31
  Scenario: Approval Policy gets added in User Configuration, Reporting Group Approval Policy= All Sequential, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status     |
      | OTAO_Ric1 - OTAO_Ric1             | Authorized |
      | OTAO_Ric2 - OTAO_Ric2             | Authorized |
      | OTAO_Ric3 - OTAO_Ric3             | Authorized |
      | OTAO_Ric4 - OTAO_Ric4             | Authorized |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AnyOneApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status     |
      | OTAO_Ric1 - OTAO_Ric1             | Authorized |
      | OTAO_Ric2 - OTAO_Ric2             | Authorized |
      | OTAO_Ric3 - OTAO_Ric3             | Authorized |
      | OTAO_Ric4 - OTAO_Ric4             | Authorized |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            |        | Authorized |

  @OTDaily1RICAnyOne32
  Scenario: Approval Policy gets removed in User Configuration, Reporting Group Approval Policy= All, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric4 - OTAO_Ric4             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric3 - OTAO_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne33
  Scenario: Approval Policy gets removed in User Configuration, Reporting Group Approval Policy= All, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne34
  Scenario: Approval Policy gets removed in User Configuration, Reporting Group Approval Policy= All Sequential, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne35
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |

  @OTDaily1RICAnyOne36
  Scenario: Approval Policy gets changed from Any One to All in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy  | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AllAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric4 - OTAO_Ric4             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric3 - OTAO_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne37
  Scenario: Approval Policy gets changed from Any One to All in User Configuration page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy  | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AllAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne38
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy     | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AllSeqAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne39
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp1       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | OT_AnyOneApprPlc1 | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy     | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     | OT_AllSeqAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |

  #Pending - Not generating expected result
  @OTDaily1RICAnyOne40
  Scenario: Reporting Group gets added in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   |                |                | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "0" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne41
  Scenario: Reporting Group gets added in User Configuration page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   |                | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | OTAO_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status     |
      | SA - System Admin | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp1     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status     |
      | SA - System Admin | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1RICAnyOne42
  Scenario: Reporting Group gets removed in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     |                | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 |                |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne43
  Scenario: Reporting Group gets removed in User Configuration page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 |                |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTDaily1RICAnyOne44
  Scenario: Reporting Group gets changed in User Configuration page, Any One to All, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
      | OTAO_RGrp2 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp2     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric3 - OTAO_Ric3             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric4 - OTAO_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne45
  Scenario: Reporting Group gets changed in User Configuration page, Any One to All, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
      | OTAO_RGrp2 | OT_AllAprvlPlc1      | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1      | RIC2      | RIC3      | RIC4      | RIC5      | Validation         |
      | OTAO_RGrp2       |          |            | OTAO_Ric1 | OTAO_Ric2 | OTAO_Ric3 | OTAO_Ric4 | OTAO_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne46
  Scenario: Reporting Group gets changed in User Configuration page, Any One to All Sequential, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
      | OTAO_RGrp2 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     |                | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp2     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne47
  Scenario: Reporting Group gets changed in User Configuration page, Any One to All Sequential, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllSeqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
      | OTAO_RGrp2 | OT_AllSeqAprvlPlc1   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     |                | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    When Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAO_Ur1 | OTAO_RGrp2     |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric1 - OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric1 | Authorized |

  @OTDaily1RICAnyOne48
  Scenario: Any RIC gets deleted from User Configuration Page, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Delete user via API
      | UserID    |
      | OTAO_Ric1 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne49
  Scenario: Any RIC gets deleted from User Configuration Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Delete user via API
      | UserID    |
      | OTAO_Ric4 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge  | Status     |
      | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne50
  Scenario: Any RIC gets deactivate from User Configuration Page, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid    | Active | Validation         |
      | OTAO_Ric1 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1RICAnyOne51
  Scenario: Any RIC gets deactivate from User Configuration Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Create user from user configuration
      | userid    | Active | Validation         |
      | OTAO_Ric2 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne52
  Scenario: RIC who Authorized OT gets deactivate from User Configuration Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    When Create user from user configuration
      | userid    | Active | Validation         |
      | OTAO_Ric4 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status     |
      | OTAO_Ric4 - OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric4 | Authorized |

  @OTDaily1RICAnyOne53
  Scenario: General Rules- Match, Reporting Group= RIC1 & RIC3 and Approval Policy= In-Charge1 & In-Charge3, application flow will be based on Approval Policy selected, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     |               | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne54
  Scenario: General Rules- Match, Reporting Group= RIC1 & RIC3 and Approval Policy= In-Charge1 & In-Charge3, application flow will be based on Approval Policy selected,, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     |               | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTDaily1RICAnyOne55
  Scenario: General Rules - Mismatch, Reporting Group= RIC1, RIC2 & RIC3, Approval Policy= In-Charge 1 & In-Charge 3, application flow will be based on Approval Policy selected, OT Authorization Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | Status           |
      | Pending   | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne56
  Scenario: General Rules - Mismatch, Reporting Group= RIC1, RIC2 & RIC3, Approval Policy= In-Charge 1 & In-Charge 3, application flow will be based on Approval Policy selected, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | OT_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc1    | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status     |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy    | Status           |
      | Authorized | OTAO_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | OTAO_Ric3 | No Authorization |
      | Pending    | OTAO_Ur1 |    0 | OT1    | 10:00   |          |            | OTAO_Ric3 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | OTAO_Ur1 | admin    | Welcome OTAO_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTDaily1RICAnyOne57
  Scenario: General Rules- Mismatch with Exception Examples, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Config= In-Charge 1,2,3,4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne58
  Scenario: Mismatch with Exception Examples for Normal Application, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="12:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne59
  Scenario: General Rules- Mismatch with Exception Examples, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All Sequential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne60
  Scenario: Mismatch with Exception Examples for Normal Application, RG = RIC 1,2,3, Approval Policy Page Configuration = In-Charge 1,2,3and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All Sequential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     |               |               |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="12:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne61
  Scenario: GENERAL RULES-Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= Duration, OT Duration = 02:00   Issue CSR-9736
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 | In-Charge 3    |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric4 - OTAO_Ric4             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric3 - OTAO_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne62
  Scenario: General Rules- Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= Duration, OT Duration = 02:00   Issue CSR-9736
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 02:00   |          |            |        | No Authorization |

  @OTDaily1RICAnyOne63
  Scenario: General Rules- Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA, OT Duration = 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     080000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                          | Status           |
      | OTAO_Ric1 - OTAO_Ric1             | Pending          |
      | OTAO_Ric2 - OTAO_Ric2             | No Authorization |
      | OTAO_Ric3 - OTAO_Ric3             | No Authorization |
      | OTAO_Ric4 - OTAO_Ric4             | No Authorization |
      | OTAO_Ric5 - OTAO_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | No Authorization |

  @OTDaily1RICAnyOne64
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to 5 and Exceptions Configuration = In-Charge 1 to 5, Exception Authorization Mode= All Sequential, Customized Based On= Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     190000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="11:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 11:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 11:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 11:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 11:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 11:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne65
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to 5 and Exceptions Configuration = In-Charge 1 to 5, Exception Authorization Mode= All, Customized Based On= Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 | In-Charge 3    |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     070000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="12:00"
      | Incharge              | Status  |
      | OTAO_Ric1 - OTAO_Ric1 | Pending |
      | OTAO_Ric2 - OTAO_Ric2 | Pending |
      | OTAO_Ric3 - OTAO_Ric3 | Pending |
      | OTAO_Ric4 - OTAO_Ric4 | Pending |
      | OTAO_Ric5 - OTAO_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 12:00   |          |            |        | Pending |

  @OTDaily1RICAnyOne66
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA, OT Duration= 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTAO_Ur1    |
      | OTAO_Ric1   |
      | OTAO_Ric1.1 |
      | OTAO_Ric2   |
      | OTAO_Ric3   |
      | OTAO_Ric4   |
      | OTAO_Ric5   |
    And Delete "BK" shift schedule
    And Delete "BK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTAODaily1_1 |
    And Create NetWork Hours Policy "OTAODaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAODaily1_1 | OTAODaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAODaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BK"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAO_Ric1 | OTAO_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric2 | OTAO_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric3 | OTAO_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric4 | OTAO_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAO_Ric5 | OTAO_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | OT_AnyOneApprPlc11 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AnyOneApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name    | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAO_RGrp1 | OT_AnyOneApprPlc11   | OTAO_Ric1     | OTAO_Ric2     | OTAO_Ric3     | OTAO_Ric4     | OTAO_Ric5     |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAO_Ur1 | True   | OTAO_RGrp1     | True      |                        4 | Only Overtime     | OTAODaily1_1 | BK            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | OTAO_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | OTAO_Ur1  |                          1 | admin        |    1 |
      | OTAO_Ric1 |                          1 | admin        |    1 |
      | OTAO_Ric2 |                          1 | admin        |    1 |
      | OTAO_Ric3 |                          1 | admin        |    1 |
      | OTAO_Ric4 |                          1 | admin        |    1 |
      | OTAO_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | OTAO_Ur1 |          0 |     080000 |
      | OTAO_Ur1 |          0 |     130000 |
      | OTAO_Ur1 |          0 |     140000 |
      | OTAO_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAO_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                          | Status  |
      | OTAO_Ric1 - OTAO_Ric1             | Pending |
      | OTAO_Ric2 - OTAO_Ric2             | Pending |
      | OTAO_Ric3 - OTAO_Ric3             | Pending |
      | OTAO_Ric5 - OTAO_Ric5             | Pending |
      | OTAO_Ric4 - OTAO_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric1 | admin    | Welcome OTAO_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric2 | admin    | Welcome OTAO_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric3 | admin    | Welcome OTAO_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric4 | admin    | Welcome OTAO_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAO_Ric5 | admin    | Welcome OTAO_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID   | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAO_Ur1 |    0 | OT1    | 01:00   |          |            |        | Pending |
