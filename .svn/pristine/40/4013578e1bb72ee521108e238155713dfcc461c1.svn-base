@T&A
Feature: 5 Level RIC - All Approval Policy - Overtime Daily1
  I want to use this template for my feature file

  @OTDaily1_RIC_AllSeq1
  Scenario: Behaviour of All Sequential Approval Policy with 5 RIC - OT Approved by multilevel RICs
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized       |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending          |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized       |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized       |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Pending          |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Pending    |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_AllSeq2
  Scenario: Behaviour of All Sequential Approval Policy with 5 RIC- Different OT Approved by each RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 008:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized       |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending          |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 08:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 08:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 007:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized       |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized       |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Pending          |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 07:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 009:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Pending    |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |

  @OTDaily1_RIC_AllSeq3
  Scenario: RIC selection changed in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | false      | true       | true       | true       | false      |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq4
  Scenario: RIC selection changed in Approval Policy page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Verify "Overtime/C-OFF" Auth Details in RIC Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | false      | true       | true       | true       | false      |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq5
  Scenario: Authorization Mode gets changed from All Sequential to Any One in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq6
  Scenario: Authorization Mode gets changed from All Sequential to All in Approval Policy page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq7
  Scenario: Authorization Mode gets changed from All Sequential to All in Approval Policy page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq8
  Scenario: Authorization Mode gets changed from All Sequential to All in Approval Policy page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All               | true       | true       | true       | true       | true       |                | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq9
  Scenario: Any RIC gets removed from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    |               | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq10
  Scenario: Any RIC gets removed from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    |               | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq11
  Scenario: Final RIC gets removed from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ur1  |
      | OTAllSeq_Ric1 |
      | OTAllSeq_Ric2 |
      | OTAllSeq_Ric3 |
      | OTAllSeq_Ric4 |
      | OTAllSeq_Ric5 |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 |               |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq12
  Scenario: Any RIC gets changed from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1   | OTAllSeq_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric1.1 | OTAllSeq_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2   | OTAllSeq_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3   | OTAllSeq_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4   | OTAllSeq_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5   | OTAllSeq_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1    |                          1 | admin        |    1 |
      | OTAllSeq_Ric1.1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric1   |                          1 | admin        |    1 |
      | OTAllSeq_Ric2   |                          1 | admin        |    1 |
      | OTAllSeq_Ric3   |                          1 | admin        |    1 |
      | OTAllSeq_Ric4   |                          1 | admin        |    1 |
      | OTAllSeq_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1   | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1.1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1.1 - OTAllSeq_Ric1.1         | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq13
  Scenario: Any RIC gets changed from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1   | OTAllSeq_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric1.1 | OTAllSeq_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2   | OTAllSeq_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3   | OTAllSeq_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4   | OTAllSeq_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5   | OTAllSeq_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1    |                          1 | admin        |    1 |
      | OTAllSeq_Ric1   |                          1 | admin        |    1 |
      | OTAllSeq_Ric1.1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2   |                          1 | admin        |    1 |
      | OTAllSeq_Ric3   |                          1 | admin        |    1 |
      | OTAllSeq_Ric4   |                          1 | admin        |    1 |
      | OTAllSeq_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1   | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1.1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username        | password | Validation              |
      | OTAllSeq_Ric1.1 | admin    | Welcome OTAllSeq_Ric1.1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq14
  Scenario: Any RIC gets added from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1   | OTAllSeq_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric1.1 | OTAllSeq_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2   | OTAllSeq_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3   | OTAllSeq_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4   | OTAllSeq_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5   | OTAllSeq_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 |               | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1    |                          1 | admin        |    1 |
      | OTAllSeq_Ric1.1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric1   |                          1 | admin        |    1 |
      | OTAllSeq_Ric2   |                          1 | admin        |    1 |
      | OTAllSeq_Ric3   |                          1 | admin        |    1 |
      | OTAllSeq_Ric4   |                          1 | admin        |    1 |
      | OTAllSeq_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq15
  Scenario: Any RIC gets added from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1   | OTAllSeq_Ric1   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric1.1 | OTAllSeq_Ric1.1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2   | OTAllSeq_Ric2   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3   | OTAllSeq_Ric3   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4   | OTAllSeq_Ric4   |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5   | OTAllSeq_Ric5   |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 |               | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1    |                          1 | admin        |    1 |
      | OTAllSeq_Ric1   |                          1 | admin        |    1 |
      | OTAllSeq_Ric1.1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2   |                          1 | admin        |    1 |
      | OTAllSeq_Ric3   |                          1 | admin        |    1 |
      | OTAllSeq_Ric4   |                          1 | admin        |    1 |
      | OTAllSeq_Ric5   |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy        | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy        | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy        | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy        | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq16
  Scenario: Approval Policy gets changed- All Sequential to Any One in Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AOAprvlPlc1    | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AOAprvlPlc1       | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq17
  Scenario: Approval Policy gets changed All Sequential to Any One in Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AOAprvlPlc1    | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq18
  Scenario: Approval Policy gets changed- All Sequential to All in Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllAprvalPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq19
  Scenario: Approval Policy gets changed All Sequential to All in Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllAprvalPlc1     | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq20
  Scenario: Approval Policy gets removed from Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq21
  Scenario: Approval Policy gets removed from Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq22
  Scenario: Approval Policy gets added in Reporting Group Page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq23
  Scenario: Approval Policy gets added in Reporting Group Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq24
  Scenario: Approval Policy gets added in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq25
  Scenario: Approval Policy gets added in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq26
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllAprvalPlc1     | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq27
  Scenario: Approval Policy gets removed in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq28
  Scenario: Approval Policy gets removed in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq29
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllAprvalPlc1     | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq30
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllAprvalPlc1     | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq31
  Scenario: Approval Policy gets changed from All Sequential to All in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AllAprvalPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq32
  Scenario: Approval Policy gets changed from All Sequential to All in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AllAprvalPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  #
  @OTDaily1_RIC_AllSeq33
  Scenario: Approval Policy gets changed from All Sequential to Any One in User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AOAprvlPlc1    | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AOAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq34
  Scenario: Approval Policy gets changed from All Sequential to Any One in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AOAprvlPlc1    | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1          | RIC2          | RIC3          | RIC4          | RIC5          | Validation         |
      | OTAllSeq_RGrp1   |          |            | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 | OT_AOAprvlPlc1 |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq35
  Scenario: Reporting Group gets added in User Configuration page, OT Authorization= Pending (Failed Due to Application Not transfer to RICS)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   |                |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq36
  Scenario: Reporting Group gets added in User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   |                |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status     |
      | SA - System Admin | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp1 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status     |
      | SA - System Admin | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_AllSeq37
  Scenario: Reporting Group gets removed from User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 |                |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge          | Status  |
      | SA - System Admin | Pending |

  #
  @OTDaily1_RIC_AllSeq38
  Scenario: Reporting Group gets removed from User Configuration page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 |                |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq39
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Grp Approval Plc= 1st- All Sequential, 2nd- All, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
      | OTAllSeq_RGrp2 | OT_AllAprvalPlc1     | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp2 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq40
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Grp Approval Plc= 1st- All Sequential, 2nd- All, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
      | OTAllSeq_RGrp2 | OT_AllAprvalPlc1     | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp2 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq41
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Grp Approval Plc= 1st- All Sequential, 2nd- Any One, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AOAprvlPlc1    | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
      | OTAllSeq_RGrp2 | OT_AOAprvlPlc1       | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp2 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq42
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Grp Approval Plc= 1st- All Sequential, 2nd- Any One, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | OT_AOAprvlPlc1    | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
      | OTAllSeq_RGrp2 | OT_AOAprvlPlc1       | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | OTAllSeq_Ur1 | OTAllSeq_RGrp2 |                |            |              | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq43
  Scenario: Any RIC of Reporting Group Page gets deleted, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Delete user via API
      | UserID        |
      | OTAllSeq_Ric1 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq44
  Scenario: Any RIC of Reporting Group Page gets deleted, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ric1 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq45
  Scenario: Final RIC of Reporting Group gets deleted, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Delete user via API
      | UserID        |
      | OTAllSeq_Ric5 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Authorized |
      | OTAllSeq_Ric5 - Final RIC     | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq46
  Scenario: Any RIC gets deactivate from User Configuration page, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid        | Active | Validation         |
      | OTAllSeq_Ric1 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq47
  Scenario: Any RIC gets deactivate from User Configuration Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Create user from user configuration
      | userid        | Active | Validation         |
      | OTAllSeq_Ric1 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |

  @OTDaily1_RIC_AllSeq48
  Scenario: Final RIC gets deactivate from User Configuration Page, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    When Create user from user configuration
      | userid        | Active | Validation         |
      | OTAllSeq_Ric5 | false  | Saved Successfully |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Authorized |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | Authorized |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web

  @OTDaily1_RIC_AllSeq49
  Scenario: Auto Forward OT Application, Status gets changed to Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Configure Auto Forward Application for PolicyName= "OT_AllSeqApprPlc1"
      | ReportingIn-Charge | AutoForward | AutoForwardAfterDays | Action  |
      | In-Charge 1        | true        |                    1 | Approve |
      | In-Charge 2        | false       |                      |         |
      | In-Charge 3        | false       |                      |         |
      | In-Charge 4        | false       |                      |         |
      | In-Charge 5        | false       |                      |         |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    When change system date from current date to "2".
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "-2" to "-2" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="-2" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And change system date from current date to "-2".

  #Sample Test Case - Run if not working then delete
  @OTDaily1_RIC_AllSeq50
  Scenario: Auto Forward OT Application, Status gets changed to Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Configure Auto Forward Application for PolicyName= "OT_AllSeqApprPlc1"
      | ReportingIn-Charge | AutoForward | AutoForwardAfterDays | Action |
      | In-Charge 1        | true        |                    1 | Reject |
      | In-Charge 2        | false       |                      |        |
      | In-Charge 3        | false       |                      |        |
      | In-Charge 4        | false       |                      |        |
      | In-Charge 5        | false       |                      |        |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    When change system date from current date to "2".
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-2" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And change system date from current date to "-2".

  @OTDaily1_RIC_AllSeq50
  Scenario: Auto Forward OT Application, Status gets changed to Approved, for 2 RICs
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Configure Auto Forward Application for PolicyName= "OT_AllSeqApprPlc1"
      | ReportingIn-Charge | AutoForward | AutoForwardAfterDays | Action  |
      | In-Charge 1        | true        |                    1 | Approve |
      | In-Charge 2        | true        |                    1 | Approve |
      | In-Charge 3        | false       |                      |         |
      | In-Charge 4        | false       |                      |         |
      | In-Charge 5        | false       |                      |         |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    When change system date from current date to "2".
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And change system date from current date to "2".
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized       |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Authorized       |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending          |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |
    And change system date from current date to "-4".

  @OTDaily1_RIC_AllSeq51
  Scenario: General Rules - Match, Reporting Group Configuration= RIC 1 & RIC 3 and Approval Policy Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 |               | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq53
  Scenario: General Rules- Match, Reporting Group Configuration= RIC 1 & RIC 3 and Approval Policy Configuration= In-Charge 1 & In-Charge 3, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 |               | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | Authorized |

  @OTDaily1_RIC_AllSeq54
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq55
  Scenario: General Rules- Mismatch, Reporting Group Configuration= RIC 1, RIC 2 & RIC 3, Approval Policy Configuration= In-Charge 1 & In-Charge 3, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status           |
      | Pending    | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                                  | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Authorized |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | Authorized |

  @OTDaily1_RIC_AllSeq56
  Scenario: General Rules- Mismatch, RG Configuration= RIC 1,2,3, AP Configuration= In-Charge 1 & 4, Then application flow for all applications will be based on Any One Authorization Mode, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | false      | true       | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq57
  Scenario: General Rules - Mismatch, RG Configuration = RIC 1,2,3, AP Configuration = In-Charge 1 & 4, Then application flow for all applications will be based on Any One Authorization Mode, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | false      | false      | true       | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |

  @OTDaily1_RIC_AllSeq58
  Scenario: General Rules - Mismatch, RG Configuration = RIC 1,2, AP Configuration = In-Charge 1,2,3, Then application flow for all applications will get updated to Any One Authorization Mode, OT Authorization= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 |               |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq59
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, Approval Policy Page Configuration = In-Charge 1, In-Charge 2 & In-Charge 3, OT Authorization Status= Authorized
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc1 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc1    | OTAllSeq_Ric1 | OTAllSeq_Ric2 |               |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthBy | Status     |
      | Authorized | OTAllSeq_Ur1 |    0 | OT1    | 10:00   | 10:00    |            |        | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Authorized" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="10:00"
      | Incharge                      | Status     |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTDaily1_RIC_AllSeq60
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     080000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:00    | 18:00    | 01:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq61
  Scenario: General Rules- Mismatch with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     080000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:00    | 18:00    | 01:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq62
  Scenario: General Rules - Mismatch with Exception, RG config = RIC 1,2,3, AP config = In-Charge 1,2,3 and Exceptions Application config = In-Charge 1,2,3,4, Authorization Mode in Exception= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 02:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq63
  Scenario: General Rules2 - Mismatch with Exception, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 20:00    | 04:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq64
  Scenario: General Rules - Mismatch with Exception, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Config = In-Charge 1, 2,3, 4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 02:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq65
  Scenario: General Rules2 - Mismatch with Exception, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 |               |               |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 20:00    | 04:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq66
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA, OT Hours= 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     080000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:00    | 18:00    | 01:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq67
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA, OT Hours= 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Overtime/Coff   |             | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     080000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="01:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:00    | 18:00    | 01:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 01:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq68
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= Duration, OT Hours= 02:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                                  | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5             | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 02:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq69
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to 5 and Exceptions Application Configuration = In-Charge 1 to 5, Exception Authorization Mode= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 20:00    | 04:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |

  @OTDaily1_RIC_AllSeq70
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= Duration, OT Hours= 02:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     180000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="02:00"
      | Incharge                      | Status  |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1 | Pending |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2 | Pending |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3 | Pending |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4 | Pending |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 02:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 02:00   |          |            | Pending |

  @OTDaily1_RIC_AllSeq71
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to P5 and Exceptions = In-Charge 1 to 5, Exception Authorization Mode= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTAllSeq_Ur1    |
      | OTAllSeq_Ric1.1 |
      | OTAllSeq_Ric1   |
      | OTAllSeq_Ric2   |
      | OTAllSeq_Ric3   |
      | OTAllSeq_Ric4   |
      | OTAllSeq_Ric5   |
    And Delete "BM" shift schedule
    And Delete "BM" shift
    And Delete Overtime Policy from TnA module
      | Name             |
      | OTAllSeqDaily1_1 |
    And Create NetWork Hours Policy "OTAllSeqDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName          | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTAllSeqDaily1_1 | OTAllSeqDaily1_1 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTAllSeqDaily1_1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BM"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTAllSeq_Ric1 | OTAllSeq_Ric1 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric2 | OTAllSeq_Ric2 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric3 | OTAllSeq_Ric3 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric4 | OTAllSeq_Ric4 |               1 |         1 |               1 |                  1 |
      | OTAllSeq_Ric5 | OTAllSeq_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | OT_AllSeqApprPlc11 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "OT_AllSeqApprPlc11"
      | ApplicationType | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Overtime/Coff   |             | Duration         | 01:00     | 02:00   | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name        | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | OTAllSeq_RGrp1 | OT_AllSeqApprPlc11   | OTAllSeq_Ric1 | OTAllSeq_Ric2 | OTAllSeq_Ric3 | OTAllSeq_Ric4 | OTAllSeq_Ric5 |
    And Create user from user configuration
      | userid       | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc      | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTAllSeq_Ur1 | True   | OTAllSeq_RGrp1 |                | True      |                        4 | Only Overtime     | OTAllSeqDaily1_1 | BM            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | OTAllSeq_Ur1 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | OTAllSeq_Ur1  |                          1 | admin        |    1 |
      | OTAllSeq_Ric1 |                          1 | admin        |    1 |
      | OTAllSeq_Ric2 |                          1 | admin        |    1 |
      | OTAllSeq_Ric3 |                          1 | admin        |    1 |
      | OTAllSeq_Ric4 |                          1 | admin        |    1 |
      | OTAllSeq_Ric5 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | OTAllSeq_Ur1 |          0 |     070000 |
      | OTAllSeq_Ur1 |          0 |     130000 |
      | OTAllSeq_Ur1 |          0 |     140000 |
      | OTAllSeq_Ur1 |          0 |     200000 |
    Then Verify OT/C-OFF Auth Details in SA Period= "Daily" on "0" to "0" Panel="Pending" User="OTAllSeq_Ur1" AtdDate="0" OTType="OT1" OTHours="04:00"
      | Incharge                                  | Status           |
      | OTAllSeq_Ric1 - OTAllSeq_Ric1             | Pending          |
      | OTAllSeq_Ric2 - OTAllSeq_Ric2             | No Authorization |
      | OTAllSeq_Ric3 - OTAllSeq_Ric3             | No Authorization |
      | OTAllSeq_Ric4 - OTAllSeq_Ric4             | No Authorization |
      | OTAllSeq_Ric5 - OTAllSeq_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username     | password | Validation           |
      | OTAllSeq_Ur1 | admin    | Welcome OTAllSeq_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 20:00    | 04:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric1 | admin    | Welcome OTAllSeq_Ric1 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status  |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | Pending |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric2 | admin    | Welcome OTAllSeq_Ric2 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric3 | admin    | Welcome OTAllSeq_Ric3 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric4 | admin    | Welcome OTAllSeq_Ric4 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | OTAllSeq_Ric5 | admin    | Welcome OTAllSeq_Ric5 |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status           |
      | Pending   | OTAllSeq_Ur1 |    0 | OT1    | 04:00   |          |            | No Authorization |
