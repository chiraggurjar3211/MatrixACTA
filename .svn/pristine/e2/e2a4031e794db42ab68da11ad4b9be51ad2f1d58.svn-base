@TnA
Feature: Overtime/C-OFF Authorization_OvertimeFromRIC for N-Punch User - Calculation= Daily1
  I want to use this template for my feature file

  ####Single Records Scenarios Starts
  @OTCOFFAuth1
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only Overtime, Auto Authorize Overtime Component= unchecked, OT Authorized by RIC (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 11:00   | 010:00   |            | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | 008:00   |            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 11:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 08:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              | 10:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 08:00               |

  @OTCOFFAuth2
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auto Authorize C-OFF= unchecked, C-OFF Authorized In Multiples Of= 01:00 and Auth as C-OFF= 08:00, Authorized by RIC (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 11:00   |          | 011:00     | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 010:00     | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 11:00   |          | 11:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 11:00      |
      |    0 | 10:00      |

  @OTCOFFAuth3
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auto Authorize C-OFF= unchecked, C-OFF Authorized In Multiples Of= 01:00 and Auth as C-OFF= 008:30, Authorized by RIC (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    Then "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation                                                      |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 11:00   |          | 008:30     | Authorized C-OFF Hours to be in Multiples of the parameter a... |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 008:30     | Authorized C-OFF Hours to be in Multiples of the parameter a... |

  @OTCOFFAuth4
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auto Authorize C-OFF= checked (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 11:00      |
      |    0 | 10:00      |

  @OTCOFFAuth5
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Both, Auto Authorize C-OFF= unchecked, OT Approved by RIC (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 11:00   | 003:00   | 008:00     | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | 002:00   | 008:00     | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 11:00   | 03:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              | 03:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth6
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only Overtime, Auth as C-OFF column disabled in Overtime/C-OFF Authorization page (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 11:00   | 008:00   | false      | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | 004:00   | false      | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 11:00   | 08:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 04:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              | 08:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 04:00               |

  @OTCOFFAuth7
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auth as OT column disabled in Overtime/C-OFF Authorization page (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 11:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 11:00   | false    | 008:00     | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | false    | 008:00     | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 11:00   |          | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  ############################
  #N-Punch User - Multiple Records
  @OTCOFFAuth8
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 100,,,,          |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth9
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 50,,,,           |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 05:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth10
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, 	Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 01000,,,,        |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 10:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth11
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 100,,,,            |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 10:00      |

  @OTCOFFAuth12
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= OT Type-Wise, Authorize in Terms of= % and C-OFF, Define Hours for C-OFF= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 50,,,,             |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 05:00      |

  @OTCOFFAuth13
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= OT Type-Wise, Authorize in Terms of= Hours and C-OFF, Define Hours for C-OFF= 08:00 (N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | C-OFF   |                  | 01200,,,,          |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   |          | 12:00      | Authorized |
    Then Validate "Overtime/C-OFF" Application from RIC date From= "-1" To= "0"
      | UserID     | Date | Status     |
      | OTCOff_Ur1 |   -1 | Authorized |
      | OTCOff_Ur1 |    0 | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 12:00      |

  @OTCOFFAuth14
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                      100 |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth15
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= % and OT, Authorize Hours for each record OT= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                       50 |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth16
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Hours              | OT      | ,,,,             | ,,,,               |                    01200 |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   | 12:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 21:00    | 12:00              | 12:00               |

  @OTCOFFAuth17
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and C-OFF, Authorize Hours for each record C-OFF = 100% (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | C-OFF   |                  |                    |                          |                        100 | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth18
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and C-OFF, Authorize Hours for each record C-OFF= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | C-OFF   |                  |                    |                          |                         50 | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth19
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Hours              | C-OFF   | ,,,,             | ,,,,               |                          |                      01200 | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   |          | 12:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 12:00      |

  @OTCOFFAuth20
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Hours              | C-OFF   | ,,,,             | ,,,,               |                          |                      01200 | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   |          | 12:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 12:00      |

  @OTCOFFAuth21
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         |              100 |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   | 12:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 21:00    | 12:00              | 12:00               |

  @OTCOFFAuth22
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours, Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Hours              |         | 01000,,,,        | ,,,,               |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 10:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth23
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage, Define Hours for C-OFF= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         | ,,,,             | 50,,,,             |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth24
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours, Define Hours for C-OFF= 08:00 (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Hours              |         | ,,,,             | 00800,,,,          |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth25
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Percentage         |         | ,,,,             | ,,,,               |                      100 |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth26
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Hours, Authorize Hours for each record OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                    00800 |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 08:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 08:00               |

  @OTCOFFAuth27
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Percentage (N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Percentage         |         | ,,,,             | ,,,,               |                          |                        100 | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth28
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Hours, Authorize Hours C-OFF= 08:00 (N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                          |                      00800 | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth29
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, providing values for OT and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         | 100,,,,          | 100,,,,            |                          |                            | Check Process Error List for some records not processed |
    Then Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |

  @OTCOFFAuth30
  Scenario: Overtime/C-OFF Authorization from RIC -> Error Description= Auth OT Hours should not be greater than OT Hours
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 01200,,,,        | ,,,,               |                          |                            | Check Process Error List for some records not processed |
    Then Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                                  |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | Auth OT Hours should not be greater than OT Hours |
    And Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |

  @OTCOFFAuth31
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 100,,,,          | ,,,,               |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth32
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 50,,,,           | ,,,,               |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 05:00      |

  @OTCOFFAuth33
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     210000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | OT      | 00800,,,,        | ,,,,               |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 12:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 04:00      |

  @OTCOFFAuth34
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 100,,,,            |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |
      
  @OTCOFFAuth35
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF, Define Hours for C-OFF= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 50,,,,             |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth36
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and C-OFF, Define Hours for C-OFF= 08:00 (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | C-OFF   | ,,,,             | 00800,,,,          |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |

  @OTCOFFAuth37
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                      100 |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth38
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and OT, Authorize Hours for each record OT= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                       50 |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth39
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Hours              | OT      | ,,,,             | ,,,,               |                    00800 |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 08:00    | 02:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
      |    0 | 02:00      |

  @OTCOFFAuth40
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | C-OFF   | ,,,,             | ,,,,               |                          |                     100.00 | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth41
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= % and C-OFF, Authorize Hours for each record C-OFF= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | C-OFF   | ,,,,             | ,,,,               |                          |                      50.00 | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth42
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Hours              | C-OFF   | ,,,,             | ,,,,               |                          |                      00800 | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |

  @OTCOFFAuth43
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         | 50,,,,           | 50,,,,             |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth44
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | OT Type-Wise      | Hours              |         | 00200,,,,        | 00800,,,,          |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 02:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 02:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth45
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | Record-Wise       | Percentage         |         | ,,,,             | ,,,,               |                    50.00 |                      50.00 | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth46
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Hours (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                    00400 |                      00600 | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 04:00    | 06:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 04:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 06:00      |

  ##############
  ####Edit Multiple Records Scenarios####

  @OTCOFFAuth47
  Scenario: Edit Authorized Overtime from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 50,,,,           |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | Authorized |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 100,,,,          |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth48
  Scenario: Edit Authorized C-OFF from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 50,,,,             |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 100,,,,            |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 10:00      |

  @OTCOFFAuth49
  Scenario: Edit Authorized Overtime/C-OFF from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT,	Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTCOff_Ur1  |
      | OTCOff_Ur2  |
      | OTCOff_Ric1 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ur2  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | OT      | 00800,,,,        | ,,,,               |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 08:00    | 02:00      | Authorized |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | OT      | 00600,,,,        | ,,,,               |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 06:00    | 04:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 06:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 04:00      |

  
  #N-Punch User - Multiple Records
  @OTCOFFAuth50
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 100,,,,          |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth51
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 50,,,,           |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 05:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth52
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, 	Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 01000,,,,        |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 10:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth53
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 100,,,,            |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 10:00      |

  @OTCOFFAuth54
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF, Define Hours for C-OFF= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 50,,,,             |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 05:00      |

  @OTCOFFAuth55
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= OT Type-Wise, Authorize in Terms of= Hours and C-OFF, Define Hours for C-OFF= 08:00 (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | C-OFF   |                  | 01200,,,,          |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   |          | 12:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 12:00      |

  @OTCOFFAuth56
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                      100 |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth57
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Only OT, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and OT, Authorize Hours for each record OT= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                       50 |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth58
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Hours              | OT      | ,,,,             | ,,,,               |                    01200 |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   | 12:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 21:00    | 12:00              | 12:00               |

  @OTCOFFAuth59
  Scenario: Overtime/C-OFF Auth from SA-> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize=Available OT, Auth Mode=Record-Wise, Authorize in Terms of= % and C-OFF, Authorize Hours for each record C-OFF = 100% (N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | C-OFF   |                  |                    |                          |                        100 | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth60
  Scenario: Overtime/C-OFF Auth from SA-> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= % and C-OFF, Authorize Hours for each record C-OFF= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Percentage         | C-OFF   |                  |                    |                          |                         50 | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth61
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Hours              | C-OFF   | ,,,,             | ,,,,               |                          |                      01200 | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   |          | 12:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 12:00      |

  @OTCOFFAuth62
  Scenario: Overtime/C-OFF Authorization from SA 2-> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | Record-Wise       | Hours              | C-OFF   | ,,,,             | ,,,,               |                          |                      01200 | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   |          | 12:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 12:00      |

  @OTCOFFAuth63
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     210000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         |              100 |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 12:00   | 12:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 21:00    | 12:00              | 12:00               |

  @OTCOFFAuth64
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours, Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Hours              |         | 01000,,,,        | ,,,,               |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 10:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth65
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage, Define Hours for C-OFF= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         | ,,,,             | 50,,,,             |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth66
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours, Define Hours for C-OFF= 08:00 (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Hours              |         | ,,,,             | 00800,,,,          |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth67
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Percentage         |         | ,,,,             | ,,,,               |                      100 |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth68
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Hours, Authorize Hours for each record OT= 08:00(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                    00800 |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 08:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 08:00               |

  @OTCOFFAuth69
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Percentage         |         | ,,,,             | ,,,,               |                          |                        100 | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth70
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Hours, Authorize Hours for each record C-OFF= 08:00 (N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                          |                      00800 | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth71
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, providing values for OT and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         | 100,,,,          | 100,,,,            |                          |                            | Check Process Error List for some records not processed |
    Then Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |

  @OTCOFFAuth72
  Scenario: Overtime/C-OFF Authorization from SA -> Error Description= Auth OT Hours should not be greater than OT Hours
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 01200,,,,        | ,,,,               |                          |                            | Check Process Error List for some records not processed |
    Then Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                                  |
      | OTCOff_Ur1 |    0 | OT1    | 10:00   | Auth OT Hours should not be greater than OT Hours |
    And Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |

  @OTCOFFAuth73
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 100,,,,          | ,,,,               |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth74
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 50,,,,           | ,,,,               |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 05:00      |

  @OTCOFFAuth75
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     210000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 12:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | OT      | 00800,,,,        | ,,,,               |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 12:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 04:00      |

  @OTCOFFAuth76
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 100,,,,            |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth77
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF, Define Hours for C-OFF= 50%(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 50,,,,             |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth78
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and C-OFF, Define Hours for C-OFF= 08:00 (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | C-OFF   | ,,,,             | 00800,,,,          |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |

  @OTCOFFAuth79
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage and OT (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                      100 |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 12:00    |            | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 10:00               |

  @OTCOFFAuth80
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and OT, Authorize Hours for each record OT= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | OT      | ,,,,             | ,,,,               |                       50 |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth81
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Hours              | OT      | ,,,,             | ,,,,               |                    00800 |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    | 04:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 08:00    | 02:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
      |    0 | 02:00      |

  @OTCOFFAuth82
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | C-OFF   | ,,,,             | ,,,,               |                          |                     100.00 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth83
  Scenario: Overtime/C-OFF Auth from SA -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and C-OFF, Auth Hours for each record C-OFF= 50%(N-Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Percentage         | C-OFF   | ,,,,             | ,,,,               |                          |                      50.00 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |

  @OTCOFFAuth84
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | Record-Wise       | Hours              | C-OFF   | ,,,,             | ,,,,               |                          |                      00800 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |

  @OTCOFFAuth85
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | OT Type-Wise      | Percentage         |         | 50,,,,           | 50,,,,             |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth86
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | OT Type-Wise      | Hours              |         | 00200,,,,        | 00800,,,,          |                          |                            | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 02:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 02:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 02:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth87
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | Record-Wise       | Percentage         |         | ,,,,             | ,,,,               |                    50.00 |                      50.00 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 05:00    | 05:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth88
  Scenario: Overtime/C-OFF Authorization from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Hours (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     150000 |
      | OTCOff_Ur1 |          0 |     160000 |
      | OTCOff_Ur1 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                    00400 |                      00600 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 04:00    | 06:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 19:00    | 10:00              | 04:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 06:00      |

  ####Edit Multiple Records Scenarios####
  
  @OTCOFFAuth89
  Scenario: Edit Authorized Overtime from SA -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, 	Define Hours for OT= 08:00(N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |  |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 01000,,,,        |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 00900,,,,        |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 09:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 09:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 09:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 09:00               |

  @OTCOFFAuth90
  Scenario: Edit Authorized C-OFF from SA -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create C-OFF Policy
      | PlcName  | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc  | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 50,,,,             |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 05:00      | Authorized |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | C-OFF   | ,,,,             | 100,,,,            |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from SA
      | UserID     | Date | OTType | OTHours | ErrorDescription                         |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | OT Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | OT Eligibility is disabled for this User |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 12:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |          | 10:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 10:00      |

  @OTCOFFAuth91
  Scenario: Edit Authorized Overtime/C-OFF from SA -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Hours (N-Punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Delete "AH" shift schedule
    And Delete "AH" shift
    And Delete Overtime Policy from TnA module
      | Name       |
      | OTDaily1_1 |
    And Create NetWork Hours Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTDaily1_1 | OTDaily1_1     | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTDaily1_1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay                |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOff_Ur1 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   |                | True      | N-Punch                  | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | OTCOff_Ur1 |
      | OTCOff_Ur2 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     150000 |
      | OTCOff_Ur1 |         -1 |     160000 |
      | OTCOff_Ur1 |         -1 |     210000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     150000 |
      | OTCOff_Ur2 |          0 |     160000 |
      | OTCOff_Ur2 |          0 |     190000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
      | OTCOff_Ur2 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Pending   | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                    00800 |                      00200 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    | 02:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 08:00    | 02:00      | Authorized |
    When Overtime/C-OFF Authorization for "Multiple Records" and Period "Daily" from SA on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from SA
      | Authorize        | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Defined OT Hours | Record-Wise       | Hours              |         | ,,,,             | ,,,,               |                    00400 |                      00600 | Saved Successfully |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 04:00    | 06:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 21:00    | 12:00              | 04:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 19:00    | 10:00              | 04:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 06:00      |

 