
@TnA
Feature: Overtime/C-OFF Authorization_OvertimeFromRIC- Calculation= Daily1
  I want to use this template for my feature file

  ####Single Records Scenarios Starts
  @OTCOFFAuth4P1
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only Overtime, Auto Authorize Overtime Component= unchecked, OT Authorized by RIC (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 012:00   |            | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | 010:00   |            | Saved Successfully |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P2
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auto Authorize C-OFF= unchecked, C-OFF Authorized In Multiples Of= 01:00 and Auth as C-OFF= 08:00, Authorized by RIC (4 punch user)
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
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 008:00     | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 008:00     | Saved Successfully |
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

  @OTCOFFAuth4P3
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auto Authorize C-OFF= unchecked, C-OFF Authorized In Multiples Of= 01:00 and Auth as C-OFF= 008:30, Authorized by RIC (4 punch user)
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
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    Then "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation                                                      |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   |          | 008:30     | Authorized C-OFF Hours to be in Multiples of the parameter a... |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   |          | 008:30     | Authorized C-OFF Hours to be in Multiples of the parameter a... |

  @OTCOFFAuth4P4
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auto Authorize C-OFF= checked (4 Punch User)
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
      | OTCOff_Ur1 | True   |                | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | OTCOff_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 12:00      |
      |    0 | 10:00      |

  @OTCOFFAuth4P5
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Both, Auto Authorize C-OFF= unchecked, OT Approved by RIC (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ur1  |                          1 | admin        |    1 |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 004:00   | 008:00     | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | 002:00   | 008:00     | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 04:00    | 08:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 02:00    | 08:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 02:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth4P6
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only Overtime, Auth as C-OFF= disable in Overtime/C-OFF Authorization page (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 012:00   | false      | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | 010:00   | false      | Saved Successfully |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P7
  Scenario: Overtime/C-OFF Authorization -> OT/C-OFF Eligibility= Only C-OFF, Auth as OT= disable in Overtime/C-OFF Authorization page (4 punch user)
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
      | COffPlc1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     070000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 12:00   | false    | 008:00     | Saved Successfully |
      | Pending   | OTCOff_Ur1 |    0 | OT1    | 10:00   | false    | 008:00     | Saved Successfully |
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


  ############################
  ####Multiple Records Starts########
  @OTCOFFAuth4P8
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P9
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTCOFFAuth4P10
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, 	Define Hours for OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 10:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P11
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P12
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF, Define Hours for C-OFF= 50%(4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P13
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= OT Type-Wise, Authorize in Terms of= Hours and C-OFF, Define Hours for C-OFF= 08:00 (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     200000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 20:00    | 12:00              |                     |
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

  @OTCOFFAuth4P14
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage and OT (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P15
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and OT, Authorize Hours for each record OT= 50%(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTCOFFAuth4P16
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     200000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 20:00    | 12:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 20:00    | 12:00              | 12:00               |

  @OTCOFFAuth4P17
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= % and C-OFF, Authorize Hours for each record C-OFF = 100% (4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P18
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= % and C-OFF, Authorize Hours for each record C-OFF= 50%(4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P19
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     200000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 20:00    | 12:00              |                     |
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

  @OTCOFFAuth4P20
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     200000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 20:00    | 12:00              |                     |
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

  @OTCOFFAuth4P21
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     200000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 20:00    | 12:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 20:00    | 12:00              | 12:00               |

  @OTCOFFAuth4P22
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours, Define Hours for OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 10:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P23
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage, Define Hours for C-OFF= 50%(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P24
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours, Define Hours for C-OFF= 08:00 (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P25
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P26
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only Overtime, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Hours, Authorize Hours for each record OT= 08:00(4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 08:00               |

  @OTCOFFAuth4P27
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P28
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Only C-OFF, Auth For= Multiple Records, Authorize= Defined OT Hours, Auth Mode= Record-Wise, Authorize in Terms of= Hours, Authorize Hours for each record C-OFF= 08:00 (4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P29
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Defined OT Hours, providing values for OT and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P30
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |

  @OTCOFFAuth4P31
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P32
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT, Define Hours for OT= 50%(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 05:00      |

  @OTCOFFAuth4P33
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, Define Hours for OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     200000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 20:00    | 12:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 20:00    | 12:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |    0 | 04:00      |

  @OTCOFFAuth4P34
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P35
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF, Define Hours for C-OFF= 50%(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTCOFFAuth4P36
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and C-OFF, Define Hours for C-OFF= 08:00 (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 02:00               |

  @OTCOFFAuth4P37
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage and OT (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P38
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and OT, Authorize Hours for each record OT= 50%(4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth4P39
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
      |    0 | 02:00      |

  @OTCOFFAuth4P40
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Hours and OT, Authorize Hours for each record OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P41
  Scenario: Overtime/C-OFF Auth from RIC -> OT/C-OFF Eligibility= Both, Auth For= Multiple Records, Authorize= Available OT, Auth Mode= Record-Wise, Authorize in Terms of= Percentage and C-OFF, Authorize Hours for each record C-OFF= 50%(4 punch)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |

  @OTCOFFAuth4P42
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= Record-Wise, Authorize in Terms of= Hours and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 02:00               |

  @OTCOFFAuth4P43
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth4P44
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 02:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 02:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 08:00      |
      |    0 | 08:00      |

  @OTCOFFAuth4P45
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Percentage (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 06:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 05:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 05:00      |

  @OTCOFFAuth4P46
  Scenario: Overtime/C-OFF Authorization from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Defined OT Hours, Authorization Mode= Record-Wise, Authorize in Terms of= Hours (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 04:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 04:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 06:00      |
      |    0 | 06:00      |

  ##############
  ####Edit Multiple Records Scenarios####
  @OTCOFFAuth4P47
  Scenario: Edit Authorized Overtime from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and OT (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      | Available OT | OT Type-Wise      | Percentage         | OT      | 50,,,,           | ,,,,               |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 05:00    |            | Authorized |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Percentage         | OT      | 100,,,,          | ,,,,               |                          |                            | Check Process Error List for some records not processed |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P48
  Scenario: Edit Authorized Overtime from RIC -> OT/C-OFF Eligibility= Only Overtime, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, 	Define Hours for OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only Overtime     | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      | Available OT | OT Type-Wise      | Hours              | OT      | 00800,,,,        |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 08:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 08:00    |            | Authorized |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation                                              |
      | Available OT | OT Type-Wise      | Hours              | OT      | 01000,,,,        |                    |                          |                            | Check Process Error List for some records not processed |
    And Verify Error List from RIC
      | UserID     | Date | OTType | OTHours | ErrorDescription                            |
      | OTCOff_Ur1 |   -1 | OT1    | 12:00   | C-OFF Eligibility is disabled for this User |
      | OTCOff_Ur2 |    0 | OT1    | 10:00   | C-OFF Eligibility is disabled for this User |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 10:00    |            | Authorized |
      | Authorized | OTCOff_Ur2 |    0 | OT1    | 10:00   | 10:00    |            | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur1 | admin    | Welcome OTCOff_Ur1 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              | 10:00               |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |

  @OTCOFFAuth4P49
  Scenario: Edit Authorized C-OFF from RIC -> OT/C-OFF Eligibility= Only C-OFF, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Percentage and C-OFF (4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      |                        4 | Only C-OFF        | OTDaily1_1  | COffPlc1 | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |          0 |     070000 |
      | OTCOff_Ur2 |          0 |     130000 |
      | OTCOff_Ur2 |          0 |     140000 |
      | OTCOff_Ur2 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | OTCOff_Ur2 | admin    | Welcome OTCOff_Ur2 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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

  @OTCOFFAuth4P50
  Scenario: Edit Authorized Overtime/C-OFF from RIC -> OT/C-OFF Eligibility= Both, Authorization For= Multiple Records, Authorize= Available OT, Authorization Mode= OT Type-Wise, Authorize in Terms of= Hours and OT, 	Define Hours for OT= 08:00(4 punch user)
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
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      |                        4 | Both              | OTDaily1_1  | AH            | True      | True      | True      | True               | Saved Successfully |  |
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
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur1 |          0 |     070000 |
      | OTCOff_Ur1 |          0 |     130000 |
      | OTCOff_Ur1 |          0 |     140000 |
      | OTCOff_Ur1 |          0 |     180000 |
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
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
      |    0 | 07:00    | 18:00    | 10:00              |                     |
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
      | Available OT | OT Type-Wise      | Hours              | OT      | 00600,,,,        | ,,,,               |                          |                            | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   | 06:00    | 06:00      | Authorized |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   | 06:00    | 04:00      | Authorized |
    When "Overtime/C-OFF" Authorization for "Multiple Records" and Period "Daily" from RIC on "-1" and "0"
      | PanelName  | UserID     | Date | OTType | OTHours |
      | Authorized | OTCOff_Ur1 |   -1 | OT1    | 12:00   |
      | Authorized | OTCOff_Ur1 |    0 | OT1    | 10:00   |
    And Configure Authorization Parameters for Overtime/C-OFF Authorization from RIC
      | Authorize    | AuthorizationMode | AuthorizeInTermsOf | OT/COff | DefineHoursforOT | DefineHoursforCOFF | AuthHrsforEachRecordAsOT | AuthHrsforEachRecordAsCOff | Validation         |
      | Available OT | OT Type-Wise      | Hours              | OT      | 00800,,,,        | ,,,,               |                          |                            | Saved Successfully |
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
      |   -1 | 07:00    | 20:00    | 12:00              | 08:00               |
      |    0 | 07:00    | 18:00    | 10:00              | 08:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized |
      |   -1 | 04:00      |
      |    0 | 02:00      |

  
  @OTCOFFAuth4P51
  Scenario: Authorized Overtime/C-OFF from RIC for Single Records-> Extra Hours checked with Auth OT/C-OFF= true/false in Attendance policy, OT/C-OFF Eligibility= Only Overtime in User Configuration (4 Punch User)
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
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | OTCOffAtdPlc1 |                4 | false                     | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
      | OTCOffAtdPlc2 |                4 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
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
      | userid     | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | OTCOffAtdPlc1 | OTDaily1_1  | Only Overtime     | AH            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | OTCOffAtdPlc2 | OTDaily1_1  | Only Overtime     | AH            | True      | True      | True      | True               |                        4 | Saved Successfully |
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
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     080000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |         -1 |     070000 |
      | OTCOff_Ur2 |         -1 |     130000 |
      | OTCOff_Ur2 |         -1 |     140000 |
      | OTCOff_Ur2 |         -1 |     200000 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation                                        |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 08:00   | 009:00   |            | Saved Successfully                                |
      | Pending   | OTCOff_Ur1 |   -1 | OT2    | 01:00   | 002:00   |            | Saved Successfully                                |
      | Pending   | OTCOff_Ur1 |   -1 | OT3    | 02:00   | 003:00   |            | Saved Successfully                                |
      | Pending   | OTCOff_Ur2 |   -1 | OT1    | 08:00   | 009:00   |            | Auth OT Hours should not be greater than OT Hours |
      | Pending   | OTCOff_Ur2 |   -1 | OT2    | 02:00   | 004:00   |            | Auth OT Hours should not be greater than OT Hours |
      | Pending   | OTCOff_Ur2 |   -1 | OT3    | 02:00   | 003:00   |            | Auth OT Hours should not be greater than OT Hours |

  @OTCOFFAuth4P52
  Scenario: Authorized Overtime/C-OFF from RIC for Single Records-> Extra Hours checked with Auth OT/C-OFF= true/false in Attendance policy, OT/C-OFF Eligibility= Only C-OFF in User Configuration (4 Punch User)
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
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AH"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | OTCOffAtdPlc1 |                4 | false                     | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
      | OTCOffAtdPlc2 |                4 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OTCOff_Ric1 | OTCOff_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OTCOff_RGrp1     | AnyOne     | OTCOff_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | OTCOff_Ur1 | True   | OTCOff_RGrp1   | True      | OTCOffAtdPlc1 | OTDaily1_1  | Only C-OFF        | AH            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | OTCOff_Ur2 | True   | OTCOff_RGrp1   | True      | OTCOffAtdPlc2 | OTDaily1_1  | Only C-OFF        | AH            | True      | True      | True      | True               |                        4 | Saved Successfully |
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
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTCOff_Ric1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | OTCOff_Ur1 |         -1 |     080000 |
      | OTCOff_Ur1 |         -1 |     130000 |
      | OTCOff_Ur1 |         -1 |     140000 |
      | OTCOff_Ur1 |         -1 |     200000 |
      | OTCOff_Ur2 |         -1 |     070000 |
      | OTCOff_Ur2 |         -1 |     130000 |
      | OTCOff_Ur2 |         -1 |     140000 |
      | OTCOff_Ur2 |         -1 |     200000 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTCOff_Ric1 | admin    | Welcome OTCOff_Ric1 |
    And "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID     | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation                                           |
      | Pending   | OTCOff_Ur1 |   -1 | OT1    | 08:00   |          | 009:00     | Saved Successfully                                   |
      | Pending   | OTCOff_Ur1 |   -1 | OT2    | 01:00   |          | 002:00     | Saved Successfully                                   |
      | Pending   | OTCOff_Ur1 |   -1 | OT3    | 02:00   |          | 003:00     | Saved Successfully                                   |
      | Pending   | OTCOff_Ur2 |   -1 | OT1    | 08:00   |          | 009:00     | Auth C-OFF Hours should not be greater than OT Hours |
      | Pending   | OTCOff_Ur2 |   -1 | OT2    | 02:00   |          | 004:00     | Auth C-OFF Hours should not be greater than OT Hours |
      | Pending   | OTCOff_Ur2 |   -1 | OT3    | 02:00   |          | 003:00     | Auth C-OFF Hours should not be greater than OT Hours |
