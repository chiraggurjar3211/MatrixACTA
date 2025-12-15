@T&A
Feature: 5 Level RIC - All Approval Policy - Overtime Daily1
  I want to use this template for my feature file

  @OTDaily1_RIC_All1
  Scenario: Auth Mode behaviour of All Approval Policy with 5 RIC - Overtime Authorized by Final RIC only
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |

  @OTDaily1_RIC_All2
  Scenario: Auth Mode behaviour of All Approval Policy with 5 RIC- Overtime Authorized by each RIC in sequence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Pending |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status     |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized |
      | OTAll_Ric2 - OTAll_Ric2             | Authorized |
      | OTAll_Ric3 - OTAll_Ric3             | Authorized |
      | OTAll_Ric4 - OTAll_Ric4             | Authorized |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Authorized |

 @OTDaily1_RIC_All3
  Scenario: Auth Mode behaviour of All Approval Policy with 5 RIC- Overtime Authorized by RIC1, RIC5 and Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |  |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |   |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Pending |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized       |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | Authorized       |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |

  @OTDaily1_RIC_All4
  Scenario: Behaviour of All Approval Policy with 5 RIC- Different OT Hours Authorized by All RICs
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 009:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 008:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric5 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric5 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric5 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric5 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric5 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status     |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized |
      | OTAll_Ric2 - OTAll_Ric2             | Authorized |
      | OTAll_Ric3 - OTAll_Ric3             | Authorized |
      | OTAll_Ric4 - OTAll_Ric4             | Authorized |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Authorized |

  @OTDaily1_RIC_All5
  Scenario: Behaviour of All Approval Policy- Same OT Hours Authorized by All RICs but different OT Authorized by Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |   |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status     |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized |
      | OTAll_Ric2 - OTAll_Ric2             | Authorized |
      | OTAll_Ric3 - OTAll_Ric3             | Authorized |
      | OTAll_Ric4 - OTAll_Ric4             | Authorized |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Authorized |

  #
  @OTDaily1_RIC_All6
  Scenario: RIC selection changed in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_All7
  Scenario: RIC selection changed in Approval Policy page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All8
  Scenario: Authorization Mode gets changed- All to Any One in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1_RIC_All9
  Scenario: Authorization Mode gets changed- All to Any One in Approval Policy page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All10
  Scenario: Authorization Mode gets changed- All to All Sequential in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_All11
  Scenario: Authorization Mode gets changed- All to All Sequential in Approval Policy page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All12
  Scenario: Final In-Charge gets changed in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All13
  Scenario: Final In-Charge gets changed in Approval Policy page, OT Authorization= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All14
  Scenario: Final In-Charge gets changed in Approval Policy, OT Authorized by multiple RICs but Not Authorized by Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status     |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized |
      | OTAll_Ric2 - OTAll_Ric2             | Authorized |
      | OTAll_Ric3 - OTAll_Ric3             | Authorized |
      | OTAll_Ric5 - OTAll_Ric5             | Pending    |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending    |
    When Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  #
  @OTDaily1_RIC_All15
  Scenario: Any RIC gets removed from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       |               | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  #
  @OTDaily1_RIC_All16
  Scenario: Any RIC gets removed from Reporting Group Page, OT Authorization status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       |               | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All17
  Scenario: Final RIC (After authorized OT) gets removed from Reporting Group Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTAll_Ur1  |
      | OTAll_Ric1 |
      | OTAll_Ric2 |
      | OTAll_Ric3 |
      | OTAll_Ric4 |
      | OTAll_Ric5 |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All18
  Scenario: Any RIC gets changed from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1.1  | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1.1 - OTAll_Ric1.1         | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAll_Ric1.1 | admin    | Welcome OTAll_Ric1.1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All19
  Scenario: Any RIC gets changed from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1.1  | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All20
  Scenario: Any RIC gets added from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    |               | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All21
  Scenario: Any RIC gets added from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    |               | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric4 - OTAll_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric4 - OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All22
  Scenario: Approval Policy gets changed from Reporting Group Page- All to Any One, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_Any1AprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_Any1AprvlPlc1     | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All23
  Scenario: Approval Policy gets changed from Reporting Group Page- All to Any One, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_Any1AprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_Any1AprvlPlc1     | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All24
  Scenario: Approval Policy gets changed from Reporting Group Page- All to All Sequential, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_All25
  Scenario: Approval Policy gets changed from Reporting Group Page- All to All Sequential, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All26
  Scenario: Approval Policy gets removed from Reporting Group, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All27
  Scenario: Approval Policy gets removed from Reporting Group, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All28
  Scenario: Approval Policy gets added from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All29
  Scenario: Approval Policy gets added from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy     | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric4 - OTAll_Ric4 | Authorized |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric4 - OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All30
  Scenario: Approval Policy gets added in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_AllApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All31
  Scenario: Approval Policy gets added in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric4 - OTAll_Ric4 | Authorized |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_AllApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric4 - OTAll_Ric4 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All32
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All Sequential, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_AllApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  #
  @OTDaily1_RIC_All33
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All Sequential, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |     |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   |    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status     |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized |
      | OTAll_Ric2 - OTAll_Ric2             | Authorized |
      | OTAll_Ric3 - OTAll_Ric3             | Authorized |
      | OTAll_Ric4 - OTAll_Ric4             | Authorized |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_AllApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status     |
      | OTAll_Ric1 - OTAll_Ric1             | Authorized |
      | OTAll_Ric2 - OTAll_Ric2             | Authorized |
      | OTAll_Ric3 - OTAll_Ric3             | Authorized |
      | OTAll_Ric4 - OTAll_Ric4             | Authorized |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All34
  Scenario: Approval Policy gets removed in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_All35
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All36
  Scenario: Approval Policy gets removed in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All37
  Scenario: Approval Policy gets removed in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All38
  Scenario: Approval Policy gets changed All to All Sequential in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_AllSqAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_All39
  Scenario: Approval Policy gets changed from All to All Sequential in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_AllSqAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All40
  Scenario: Approval Policy gets changed All to Any One in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
    | UserID       |
    | OTAll_Ur1    |
    | OTAll_Ric1.1 |
    | OTAll_Ric1   |
    | OTAll_Ric2   |
    | OTAll_Ric3   |
    | OTAll_Ric4   |
    | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
    | Name         |
    | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
    | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
    | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
    | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
    | OTAllDaily1_1 | OTAllDaily1_1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
    | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
    | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
    | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
    | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
    | ShiftID | RepeatShiftDays |
    | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
    | OffDay1 |
    | None    |
    And Create User via api
    | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
    | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
    | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
    | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
    | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
    | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
    | OT_AllApprPlc1     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    | OT_Any1AprvlPlc1 | Any One   | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_Any1AprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All41
  Scenario: Approval Policy gets changed from All to Any One in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_Any1AprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1       | RIC2       | RIC3       | RIC4       | RIC5       | Validation         |
      | OTAll_RGrp1      |          |            | OTAll_Ric1 | OTAll_Ric2 | OTAll_Ric3 | OTAll_Ric4 | OTAll_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    | OT_AllApprPlc1 | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    | OT_Any1AprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #Pending - Issue Authorization not coverted SA to Approval Policy Selected after adding Reporting Group
  @OTDaily1_RIC_All42
  Scenario: Reporting Group gets added in User Configuration page, OT Authorization= Pending(Pending - Issue Authorization not coverted SA to Approval Policy Selected after adding Reporting Group)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   |                |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All43
  Scenario: Reporting Group gets added in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   |                |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | OTAll_Ur1 |    0 | OT1    | 10:00   | 005:00   |            | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status     |
      | SA - System Admin | Authorized |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp1    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status     |
      | SA - System Admin | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTDaily1_RIC_All44
  Scenario: Reporting Group gets removed in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 |                |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |

  @OTDaily1_RIC_All45
  Scenario: Reporting Group gets removed in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 |                |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All46
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and All Sequential, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
      | OTAll_RGrp2 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp2    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_All47
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and All Sequential, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1    | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_AllSqAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
      | OTAll_RGrp2 | OT_AllSqAprvlPlc1    | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp2    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  #
  @OTDaily1_RIC_All48
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and Any One, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_Any1AprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
      | OTAll_RGrp2 | OT_Any1AprvlPlc1     | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp2    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_All49
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and Any One, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | OT_Any1AprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
      | OTAll_RGrp2 | OT_Any1AprvlPlc1     | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Assign groups to user from user configuration
      | UserID    | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAll_Ur1 | OTAll_RGrp2    |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All50
  Scenario: Any RIC gets deleted, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Delete user via API
      | UserID     |
      | OTAll_Ric1 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1_RIC_All51
  Scenario: Any RIC gets deleted, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Delete user via API
      | UserID     |
      | OTAll_Ric1 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All52
  Scenario: Final RIC gets deleted, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Delete user via API
      | UserID     |
      | OTAll_Ric4 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status           |
      | OTAll_Ric1 - OTAll_Ric1 | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2 | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3 | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 | No Authorization |
      | OTAll_Ric4 - Final RIC  | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All53
  Scenario: Any RIC gets deactivate from User Configuration Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric2 | admin    | Welcome OTAll_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric5 | admin    | Welcome OTAll_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid     | Active | Validation         |
      | OTAll_Ric1 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1_RIC_All54
  Scenario: Any RIC gets deactivate from User Configuration Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create user from user configuration
      | userid     | Active | Validation         |
      | OTAll_Ric1 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All55
  Scenario: Final RIC gets deactivate from User Configuration Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric4 | admin    | Welcome OTAll_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    When Create user from user configuration
      | userid     | Active | Validation         |
      | OTAll_Ric4 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4 - Final RIC | Authorized       |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_All56
  Scenario: General Rules- Match, Reporting Group Configuration = RIC 1 & RIC 3 and Approval Policy Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    |               | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1_RIC_All57
  Scenario: General Rules- Match, Reporting Group Configuration = RIC 1 & RIC 3 and Approval Policy Configuration = In-Charge 1 & In-Charge 3, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    |               | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Authorized       |

  @OTDaily1_RIC_All58
  Scenario: General Rules- Mismatch, Reporting Group Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Configuration = In-Charge 1 & In-Charge 3,   Then application flow will be based on Approval Policy selected, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |

  @OTDaily1_RIC_All59
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Authorized       |

  @OTDaily1_RIC_All60
  Scenario: General Rules - Mismatch, RIC Configuration = RIC 1, RIC 2, RIC 3, Approval Policy Configuration = In-Charge 1 & In-Charge 4, Then application flow will be based on Any One Mode, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | false      | true       | false      | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |

  @OTDaily1_RIC_All61
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 4, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | false      | false      | true       | false      | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric3 | admin    | Welcome OTAll_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric3 - OTAll_Ric3 | Authorized |

  @OTDaily1_RIC_All62
  Scenario: General Rules - Mismatch, Reporting Group Configuration = RIC 1, RIC 2, Approval Policy Config = In-Charge 1, In-Charge 2 & In-Charge 3, Then application flow will get updated to Any One Authorization Mode, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    |               |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |

  @OTDaily1_RIC_All63
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, Approval Policy Page Configuration = In-Charge 1, In-Charge 2 & In-Charge 3, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1.1 | OTAll_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric1   | OTAll_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2   | OTAll_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3   | OTAll_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4   | OTAll_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5   | OTAll_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc1 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc1       | OTAll_Ric1    | OTAll_Ric2    |               |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid       | user-verified-for-password | new-password | type |
      | OTAll_Ur1    |                          1 | admin        |    1 |
      | OTAll_Ric1.1 |                          1 | admin        |    1 |
      | OTAll_Ric1   |                          1 | admin        |    1 |
      | OTAll_Ric2   |                          1 | admin        |    1 |
      | OTAll_Ric3   |                          1 | admin        |    1 |
      | OTAll_Ric4   |                          1 | admin        |    1 |
      | OTAll_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTAll_Ric1 | admin    | Welcome OTAll_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAll_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAll_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | OTAll_Ur1 | admin    | Welcome OTAll_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                | Status     |
      | OTAll_Ric1 - OTAll_Ric1 | Authorized |

  @OTDaily1_RIC_All64
  Scenario: General Rules - Mismatch with Exception, RG Confi = RIC 1,2,3, AP Config = In-Charge 1,2,3 and Exceptions = In-Charge 1,2,3,4, Authorization in Exception= Any One, Then application flow will get updated to Any One Authorization Mode
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |

  #
  #
  @OTDaily1_RIC_All65
  Scenario: General Rules - Mismatch with Exception, RG Config = RIC 1,2,3, AP Config = In-Charge 1,2,3 and Exceptions Config= In-Charge 1,2,3,4, Authorization in Exception= All Sequential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |

  @OTDaily1_RIC_All66
  Scenario: General Rules - Mismatch with Exception Examples, Reporting Group Page Configuration = RIC 1,2,3, Approval Policy Page Configuration = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= Any One(Always Faileed  Issue Id CSR-9736)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |

  @OTDaily1_RIC_All67
  Scenario: General Rules - Mismatch with Exception Examples, RG Configuration = RIC 1,2,3, AP Confi = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1, In-Charge 2, In-Charge 3 & In-Charge 4, Authorization Mode in Exception= All Sequential(Always Faileed  Issue Id CSR-9736)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |

  @OTDaily1_RIC_All68
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |

  @OTDaily1_RIC_All69
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    |               |               |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     080000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |

  @OTDaily1_RIC_All70
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= Duration, OT Hours = 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |

  #
  @OTDaily1_RIC_All71
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA, OT Hours = 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     080000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                | Status  |
      | OTAll_Ric1 - OTAll_Ric1 | Pending |
      | OTAll_Ric2 - OTAll_Ric2 | Pending |
      | OTAll_Ric3 - OTAll_Ric3 | Pending |
      | OTAll_Ric4 - OTAll_Ric4 | Pending |
      | OTAll_Ric5 - OTAll_Ric5 | Pending |

  @OTDaily1_RIC_All72
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA, OT Hours = 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     080000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                            | Status           |
      | OTAll_Ric1 - OTAll_Ric1             | Pending          |
      | OTAll_Ric2 - OTAll_Ric2             | No Authorization |
      | OTAll_Ric3 - OTAll_Ric3             | No Authorization |
      | OTAll_Ric4 - OTAll_Ric4             | No Authorization |
      | OTAll_Ric5 - OTAll_Ric5 - Final RIC | No Authorization |

  @OTDaily1_RIC_All73
  Scenario: Exception Examples for Normal Application, RG Configuration = RIC 1 to 5, AP Config = In-Charge 1 to 5 and Exceptions Config = In-Charge 1 to In-Charge 5, Exception Authorization Mode= Any One(Always Faileed  Issue Id CSR-9736)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         |     01:00 |   02:00 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |

  @OTDaily1_RIC_All74
  Scenario: Exception Examples for Normal Application, RG Configuration = RIC 1 to 5, AP Configuration = In-Charge 1 to 5 and Exceptions Application Configuration = In-Charge 1 to 5, Exception Authorization Mode= All Sequential, Customized Based On= Duration(Always Faileed  Issue Id CSR-9736)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | OTAll_Ur1    |
      | OTAll_Ric1.1 |
      | OTAll_Ric1   |
      | OTAll_Ric2   |
      | OTAll_Ric3   |
      | OTAll_Ric4   |
      | OTAll_Ric5   |
    And Delete "BL" shift schedule
    And Delete "BL" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | OTAllDaily1_1 |
    And Create NetWork Hours Policy "OTAllDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllDaily1_1 | OTAllDaily1_1  | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAll_Ric1 | OTAll_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric2 | OTAll_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric3 | OTAll_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric4 | OTAll_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAll_Ric5 | OTAll_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllApprPlc11 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name     | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAll_RGrp1 | OT_AllApprPlc11      | OTAll_Ric1    | OTAll_Ric2    | OTAll_Ric3    | OTAll_Ric4    | OTAll_Ric5    |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc   | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAll_Ur1 | True   | OTAll_RGrp1    |                | True      |                        4 | Only Overtime     | OTAllDaily1_1 | BL            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | OTAll_Ur1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTAll_Ur1  |                          1 | admin        |    1 |
      | OTAll_Ric1 |                          1 | admin        |    1 |
      | OTAll_Ric2 |                          1 | admin        |    1 |
      | OTAll_Ric3 |                          1 | admin        |    1 |
      | OTAll_Ric4 |                          1 | admin        |    1 |
      | OTAll_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | OTAll_Ur1 |          0 |     070000 |
      | OTAll_Ur1 |          0 |     130000 |
      | OTAll_Ur1 |          0 |     140000 |
      | OTAll_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAll_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                            | Status  |
      | OTAll_Ric1 - OTAll_Ric1             | Pending |
      | OTAll_Ric2 - OTAll_Ric2             | Pending |
      | OTAll_Ric4 - OTAll_Ric4             | Pending |
      | OTAll_Ric5 - OTAll_Ric5             | Pending |
      | OTAll_Ric3 - OTAll_Ric3 - Final RIC | Pending |
