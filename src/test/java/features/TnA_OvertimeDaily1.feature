@OTDaily1_
Feature: Overtime Feature
  I want to use this template for my feature file

  @OTDaily1_1
  Scenario: user punches equal to Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     070000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     200000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 02:00              | 02:00               |
      |   -1 | 07:00    | 20:00    | 04:00              | 04:00               |
      |   -2 | 09:00    | 20:00    | 02:00              | 02:00               |

  @OTDaily1_2
  Scenario: user punches out of range Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     050000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     050000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     210000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     210000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 05:00    | 18:00    | 02:00              | 02:00               |
      |   -1 | 05:00    | 21:00    | 04:00              | 04:00               |
      |   -2 | 09:00    | 21:00    | 02:00              | 02:00               |

  @OTDaily1_3
  Scenario: user punches between of range Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     073000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     073000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     183000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     191000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 18:00    | 01:30              | 01:30               |
      |   -1 | 07:30    | 18:30    | 02:00              | 02:00               |
      |   -2 | 09:00    | 19:10    | 01:10              | 01:10               |

  @OTDaily1_4
  Scenario: check Minimum Duration Required of Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0030 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0030 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     083000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     083100 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     082900 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     183000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     182900 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     183100 |
      | TandADaily11 |         -6 |     082900 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     183100 |
      | TandADaily11 |         -7 |     083100 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     183100 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     130000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     182900 |
      | TandADaily11 |         -9 |     083100 |
      | TandADaily11 |         -9 |     130000 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     182900 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-9" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:30    | 18:00    | 00:30              | 00:30               |
      |   -1 | 08:31    | 18:00    |                    |                     |
      |   -2 | 08:29    | 18:00    | 00:31              | 00:31               |
      |   -3 | 09:00    | 18:30    | 00:30              | 00:30               |
      |   -4 | 09:00    | 18:29    |                    |                     |
      |   -5 | 09:00    | 18:31    | 00:31              | 00:31               |
      |   -6 | 08:29    | 18:31    | 01:02              | 01:02               |
      |   -7 | 08:31    | 18:31    | 00:31              | 00:31               |
      |   -8 | 08:29    | 18:29    | 00:31              | 00:31               |
      |   -9 | 08:31    | 18:29    |                    |                     |

  @OTDaily1_5
  Scenario: check Factor Minimum Duration Required of Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0030 | OT1        |   1.50 | Check All      |
      | Overstay      |      0000 |    0200 |      0030 | OT1        |   2.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     083000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     082900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     183000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     183100 |
      | TandADaily11 |         -4 |     082900 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     183100 |
      | TandADaily11 |         -5 |     083100 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     183100 |
      | TandADaily11 |         -6 |     082900 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     182900 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-6" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:30    | 18:00    | 00:45              | 00:45               |
      |   -1 | 08:29    | 18:00    | 00:47              | 00:47               |
      |   -2 | 09:00    | 18:30    | 01:00              | 01:00               |
      |   -3 | 09:00    | 18:31    | 01:02              | 01:02               |
      |   -4 | 08:29    | 18:31    | 01:49              | 01:49               |
      |   -5 | 08:31    | 18:31    | 01:02              | 01:02               |
      |   -6 | 08:29    | 18:29    | 00:47              | 00:47               |

  @OTDaily1_6
  Scenario: check Work Hours Within Shift Normal Configuration in Overtime(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     085900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180100 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     175900 |
      | TandADaily11 |         -4 |     083000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     183000 |
      | TandADaily11 |         -5 |     093000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     173000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     125900 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     125900 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     180000 |
      | TandADaily11 |        -10 |     140100 |
      | TandADaily11 |        -10 |     180000 |
      | TandADaily11 |        -11 |     140100 |
      | TandADaily11 |        -11 |     183000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 08:59    | 18:00    | 08:00              | 08:00               |
      |   -2 | 09:00    | 18:01    | 08:00              | 08:00               |
      |   -3 | 09:00    | 17:59    | 07:59              | 07:59               |
      |   -4 | 08:30    | 18:30    | 08:00              | 08:00               |
      |   -5 | 09:30    | 17:30    | 07:00              | 07:00               |
      |   -6 | 09:00    | 13:00    | 04:00              | 04:00               |
      |   -7 | 09:00    | 12:59    |                    |                     |
      |   -8 | 08:29    | 12:59    |                    |                     |
      |   -9 | 14:00    | 18:00    | 04:00              | 04:00               |
      |  -10 | 14:01    | 18:00    |                    |                     |
      |  -11 | 14:01    | 18:30    |                    |                     |

  @OTDaily1_7
  Scenario: check Work Hours Within Shift factor multiplication Configuration in Overtime(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   2.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     085900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180100 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     175900 |
      | TandADaily11 |         -4 |     083000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     183000 |
      | TandADaily11 |         -5 |     093000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     173000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     125900 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     125900 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     180000 |
      | TandADaily11 |        -10 |     140100 |
      | TandADaily11 |        -10 |     180000 |
      | TandADaily11 |        -11 |     140100 |
      | TandADaily11 |        -11 |     183000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-11" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 16:00              | 16:00               |
      |   -1 | 08:59    | 18:00    | 16:00              | 16:00               |
      |   -2 | 09:00    | 18:01    | 16:00              | 16:00               |
      |   -3 | 09:00    | 17:59    | 15:58              | 15:58               |
      |   -4 | 08:30    | 18:30    | 16:00              | 16:00               |
      |   -5 | 09:30    | 17:30    | 14:00              | 14:00               |
      |   -6 | 09:00    | 13:00    | 08:00              | 08:00               |
      |   -7 | 09:00    | 12:59    |                    |                     |
      |   -8 | 08:29    | 12:59    |                    |                     |
      |   -9 | 14:00    | 18:00    | 08:00              | 08:00               |
      |  -10 | 14:01    | 18:00    |                    |                     |
      |  -11 | 14:01    | 18:30    |                    |                     |

  @OTDaily1_8
  Scenario: check Daily 1 combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox checked in Overtime(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     085900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180100 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     175900 |
      | TandADaily11 |         -4 |     083000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     183000 |
      | TandADaily11 |         -5 |     093000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     173000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     125900 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     125900 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     180000 |
      | TandADaily11 |        -10 |     140100 |
      | TandADaily11 |        -10 |     180000 |
      | TandADaily11 |        -11 |     140100 |
      | TandADaily11 |        -11 |     183000 |
      | TandADaily11 |        -12 |     080000 |
      | TandADaily11 |        -12 |     130000 |
      | TandADaily11 |        -12 |     140000 |
      | TandADaily11 |        -12 |     190000 |
      | TandADaily11 |        -13 |     060000 |
      | TandADaily11 |        -13 |     130000 |
      | TandADaily11 |        -13 |     140000 |
      | TandADaily11 |        -13 |     220000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-13" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 08:59    | 18:00    | 08:00              | 08:00               |
      |   -2 | 09:00    | 18:01    | 08:00              | 08:00               |
      |   -3 | 09:00    | 17:59    | 07:59              | 07:59               |
      |   -4 | 08:30    | 18:30    | 09:00              | 09:00               |
      |   -5 | 09:30    | 17:30    | 07:00              | 07:00               |
      |   -6 | 09:00    | 13:00    | 04:00              | 04:00               |
      |   -7 | 09:00    | 12:59    |                    |                     |
      |   -8 | 08:29    | 12:59    | 00:31              | 00:31               |
      |   -9 | 14:00    | 18:00    | 04:00              | 04:00               |
      |  -10 | 14:01    | 18:00    |                    |                     |
      |  -11 | 14:01    | 18:30    | 00:30              | 00:30               |
      |  -12 | 08:00    | 19:00    | 10:00              | 10:00               |
      |  -13 | 06:00    | 22:00    | 12:00              | 12:00               |

  @OTDaily1_9
  Scenario: check Daily 1 combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox un-checked in Overtime and authorized overtime application one by one(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    |                 |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     073000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     194500 |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-1" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT1    | 08:00   | 08:00    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:45    | 11:15              | 08:00               |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-1" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT2    | 01:30   | 01:15    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:45    | 11:15              | 09:15               |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-1" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT3    | 01:45   | 01:45    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:45    | 11:15              | 11:00               |

  @OTDaily1_10
  Scenario: check Daily 1 combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox un-checked in Overtime and authorized overtime all application approved same time(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    |                 |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     073000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     194500 |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT1    | 08:00   | 08:00    |            | Saved Successfully |
      | TandADaily11 |    0 | OT2    | 01:30   | 01:15    |            | Saved Successfully |
      | TandADaily11 |    0 | OT3    | 01:45   | 01:45    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:45    | 11:15              | 11:00               |

  @OTDaily1_32
  Scenario: check Authorization Required For Late-IN checkbox checked and Authorized OT(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create Late-In Policy
      | Name | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | CK   | true             |        30 |                          | Saved Successfully |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | true            | true                  | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 | CK        |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     091500 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     173000 |
      | TandADaily11 |         -3 |     093100 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -4 |     093000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     180000 |
    And Daily Attendance View for userid "TandADaily11" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 09:15    | 18:00    | 07:45              |                     |
      |   -2 | 09:00    | 17:30    | 07:30              | 07:30               |
      |   -3 | 09:31    | 18:00    | 07:29              |                     |
      |   -4 | 09:30    | 18:00    | 07:30              |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-4" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |   -1 | OT1    | 07:45   | 07:45    |            | Saved Successfully |
      | TandADaily11 |   -3 | OT1    | 07:29   | 07:29    |            | Saved Successfully |
      | TandADaily11 |   -4 | OT1    | 07:30   | 07:30    |            | Saved Successfully |
    And Daily Attendance View for userid "TandADaily11" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 09:15    | 18:00    | 07:45              | 07:45               |
      |   -2 | 09:00    | 17:30    | 07:30              | 07:30               |
      |   -3 | 09:31    | 18:00    | 07:29              | 07:29               |
      |   -4 | 09:30    | 18:00    | 07:30              | 07:30               |

  @OTDaily1_11
  Scenario: check Special function punch like official in and out while overtime configure combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox checked (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time | Spfid |
      | TandADaily11 |          0 |     093000 |     1 |
      | TandADaily11 |          0 |     130000 |       |
      | TandADaily11 |          0 |     140000 |       |
      | TandADaily11 |          0 |     174500 |     2 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:30    | 17:45    | 07:15              | 07:15               |

  @OTDaily1_12
  Scenario: check actual and fixed config of Overtime Rounding For Fraction Of An Hour configuration while daily 1 - Early in,overstay & work hours within shift configuration (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "TandADaily11"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     071500 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     181500 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:15    | 18:15    | 10:15              | 10:15               |

  @OTDaily1_13
  Scenario: check only fixed config of Overtime Rounding For Fraction Of An Hour configuration while daily 1 - Early in,overstay & work hours within shift configuration (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "TandADaily11"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Fixed           |           21 |
      |        31 |      59 | Fixed           |           45 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     085900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180100 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     175900 |
      | TandADaily11 |         -4 |     083000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     183000 |
      | TandADaily11 |         -5 |     093000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     173000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     125900 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     125900 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     180000 |
      | TandADaily11 |        -10 |     140100 |
      | TandADaily11 |        -10 |     180000 |
      | TandADaily11 |        -11 |     140100 |
      | TandADaily11 |        -11 |     183000 |
      | TandADaily11 |        -12 |     080000 |
      | TandADaily11 |        -12 |     130000 |
      | TandADaily11 |        -12 |     140000 |
      | TandADaily11 |        -12 |     190000 |
      | TandADaily11 |        -13 |     060000 |
      | TandADaily11 |        -13 |     130000 |
      | TandADaily11 |        -13 |     140000 |
      | TandADaily11 |        -13 |     220000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-13" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 08:59    | 18:00    | 08:21              | 08:21               |
      |   -2 | 09:00    | 18:01    | 08:21              | 08:21               |
      |   -3 | 09:00    | 17:59    | 07:45              | 07:45               |
      |   -4 | 08:30    | 18:30    | 08:42              | 08:42               |
      |   -5 | 09:30    | 17:30    | 07:00              | 07:00               |
      |   -6 | 09:00    | 13:00    | 04:00              | 04:00               |
      |   -7 | 09:00    | 12:59    | 03:45              | 03:45               |
      |   -8 | 08:29    | 12:59    | 04:30              | 04:30               |
      |   -9 | 14:00    | 18:00    | 04:00              | 04:00               |
      |  -10 | 14:01    | 18:00    | 03:45              | 03:45               |
      |  -11 | 14:01    | 18:30    | 04:06              | 04:06               |
      |  -12 | 08:00    | 19:00    | 10:00              | 10:00               |
      |  -13 | 06:00    | 22:00    | 12:00              | 12:00               |

  @OTDaily1_14
  Scenario: check OT generated only Sat,Mon & WO only (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT            | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | Mon,Tue,WO,Sat,Sun | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | WO,Sa,Su       |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Mo,Tu,WO       |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Mo,Tu,WO       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | W1,W5          |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   01012024 |     070000 |
      | TandADaily11 |   01012024 |     130000 |
      | TandADaily11 |   01012024 |     140000 |
      | TandADaily11 |   01012024 |     200000 |
      | TandADaily11 |   02012024 |     070000 |
      | TandADaily11 |   02012024 |     130000 |
      | TandADaily11 |   02012024 |     140000 |
      | TandADaily11 |   02012024 |     200000 |
      | TandADaily11 |   03012024 |     070000 |
      | TandADaily11 |   03012024 |     130000 |
      | TandADaily11 |   03012024 |     140000 |
      | TandADaily11 |   03012024 |     200000 |
      | TandADaily11 |   04012024 |     070000 |
      | TandADaily11 |   04012024 |     130000 |
      | TandADaily11 |   04012024 |     140000 |
      | TandADaily11 |   04012024 |     200000 |
      | TandADaily11 |   05012024 |     070000 |
      | TandADaily11 |   05012024 |     130000 |
      | TandADaily11 |   05012024 |     140000 |
      | TandADaily11 |   05012024 |     200000 |
      | TandADaily11 |   06012024 |     070000 |
      | TandADaily11 |   06012024 |     130000 |
      | TandADaily11 |   06012024 |     140000 |
      | TandADaily11 |   06012024 |     200000 |
      | TandADaily11 |   07012024 |     070000 |
      | TandADaily11 |   07012024 |     130000 |
      | TandADaily11 |   07012024 |     140000 |
      | TandADaily11 |   07012024 |     200000 |
      | TandADaily11 |   08012024 |     070000 |
      | TandADaily11 |   08012024 |     130000 |
      | TandADaily11 |   08012024 |     140000 |
      | TandADaily11 |   08012024 |     200000 |
      | TandADaily11 |   09012024 |     070000 |
      | TandADaily11 |   09012024 |     130000 |
      | TandADaily11 |   09012024 |     140000 |
      | TandADaily11 |   09012024 |     200000 |
      | TandADaily11 |   10012024 |     070000 |
      | TandADaily11 |   10012024 |     130000 |
      | TandADaily11 |   10012024 |     140000 |
      | TandADaily11 |   10012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "01/01/2024" and "10/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 07/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily1_15
  Scenario: check OT generated only PH,WO/PH,WO,FB,RD only (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | PH,WO,WO/PH | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | PH,WO,WO/PH    |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | WO             |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | WO             |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Utrayan     | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | W1,W5          |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   13012024 |     070000 |
      | TandADaily11 |   13012024 |     130000 |
      | TandADaily11 |   13012024 |     140000 |
      | TandADaily11 |   13012024 |     200000 |
      | TandADaily11 |   14012024 |     070000 |
      | TandADaily11 |   14012024 |     130000 |
      | TandADaily11 |   14012024 |     140000 |
      | TandADaily11 |   14012024 |     200000 |
      | TandADaily11 |   15012024 |     070000 |
      | TandADaily11 |   15012024 |     130000 |
      | TandADaily11 |   15012024 |     140000 |
      | TandADaily11 |   15012024 |     200000 |
      | TandADaily11 |   16012024 |     070000 |
      | TandADaily11 |   16012024 |     130000 |
      | TandADaily11 |   16012024 |     140000 |
      | TandADaily11 |   16012024 |     200000 |
      | TandADaily11 |   17012024 |     070000 |
      | TandADaily11 |   17012024 |     130000 |
      | TandADaily11 |   17012024 |     140000 |
      | TandADaily11 |   17012024 |     200000 |
      | TandADaily11 |   17012024 |     070000 |
      | TandADaily11 |   17012024 |     130000 |
      | TandADaily11 |   17012024 |     140000 |
      | TandADaily11 |   17012024 |     200000 |
      | TandADaily11 |   18012024 |     070000 |
      | TandADaily11 |   18012024 |     130000 |
      | TandADaily11 |   18012024 |     140000 |
      | TandADaily11 |   18012024 |     200000 |
      | TandADaily11 |   19012024 |     070000 |
      | TandADaily11 |   19012024 |     130000 |
      | TandADaily11 |   19012024 |     140000 |
      | TandADaily11 |   19012024 |     200000 |
      | TandADaily11 |   20012024 |     070000 |
      | TandADaily11 |   20012024 |     130000 |
      | TandADaily11 |   20012024 |     140000 |
      | TandADaily11 |   20012024 |     200000 |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "13/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 15/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 22/01/2024 | 07:00    | 20:00    |                    |                     |
      | 23/01/2024 | 07:00    | 20:00    |                    |                     |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily1_33
  Scenario: check OT generated on WO,PH,WOPH Or shift FB,RD while Cal On WOPHFBRD As Per Week checked,(Mon,Tue,Wed,Thu,Fri,Sat,Sun)checked in Days To Consider For Cal in OT Config and (Mon,Tue,Wed,Thu,Fri,Sat,Sun) selected in Work Hrs Within Shift(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT                     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays       |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/01/2024 | 24/01/2024 | Utrayan     | False        |
      | 20/01/2024 | 20/01/2024 | RamMandir   | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   20012024 |     070000 |
      | TandADaily11 |   20012024 |     130000 |
      | TandADaily11 |   20012024 |     140000 |
      | TandADaily11 |   20012024 |     200000 |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "20/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 20/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 21/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 22/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 23/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 24/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |

  @OTDaily1_34
  Scenario: check OT generated on WO,PH Or shift FB,RD while Calculation On WO/PH/FB/RD As Per Weekday checkbox unchecked, All checked in Days To Consider For Calculation in Overtime Configuration and all selected in Work Hours Within Shift drop down(4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | false             | false              | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/01/2024 | 24/01/2024 | Utrayan     | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "21/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 22/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 23/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 24/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |

  @OTDaily1_35
  Scenario: check OT generated on WO,PH Or shift FB,RD while Calculation On WO/PH/FB/RD As Per Weekday checkbox checked, only WO/PH checked in Days To Consider For Calculation in Overtime Configuration and WO/PH selected in Work Hours Within Shift drop down(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | WO/PH   | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | WO/PH          |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | WO/PH          |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | WO/PH          |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/01/2024 | 24/01/2024 | Utrayan     | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      |                        4 | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "21/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/01/2024 | 07:00    | 20:00    |                    |                     |
      | 22/01/2024 | 07:00    | 20:00    |                    |                     |
      | 23/01/2024 | 07:00    | 20:00    |                    |                     |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily1_16
  Scenario: user punches equal to Early-IN & Overstay range and OT Auto Authorization checkbox checked(N Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     070000 |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     093000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     150000 |
      | TandADaily11 |          0 |     170000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     090000 |
      | TandADaily11 |         -1 |     093000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     173000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -1 |     200000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     093000 |
      | TandADaily11 |         -2 |     113000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     173000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -2 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 02:00              | 02:00               |
      |   -1 | 07:00    | 20:00    | 04:00              | 04:00               |
      |   -2 | 09:00    | 20:00    | 02:00              | 02:00               |

  @OTDaily1_17
  Scenario: user punches out of range Early-IN AND Overstay range and OT Auto Authorization checkbox checked(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     050000 |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     093000 |
      | TandADaily11 |          0 |     110000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     173000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     050000 |
      | TandADaily11 |         -1 |     090000 |
      | TandADaily11 |         -1 |     093000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     173000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -1 |     210000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     093000 |
      | TandADaily11 |         -2 |     110000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     173000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -2 |     210000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 05:00    | 18:00    | 02:00              | 02:00               |
      |   -1 | 05:00    | 21:00    | 04:00              | 04:00               |
      |   -2 | 09:00    | 21:00    | 02:00              | 02:00               |

  @OTDaily1_18
  Scenario: user punches between of range Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     070000 |
      | TandADaily11 |          0 |     083000 |
      | TandADaily11 |          0 |     093000 |
      | TandADaily11 |          0 |     110000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     173000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     083000 |
      | TandADaily11 |         -1 |     093000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     173000 |
      | TandADaily11 |         -1 |     193000 |
      | TandADaily11 |         -1 |     200000 |
      | TandADaily11 |         -2 |     080000 |
      | TandADaily11 |         -2 |     083000 |
      | TandADaily11 |         -2 |     093000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     173000 |
      | TandADaily11 |         -2 |     183000 |
      | TandADaily11 |         -2 |     191000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 01:30              | 01:30               |
      |   -1 | 07:00    | 20:00    | 02:00              | 02:00               |
      |   -2 | 08:00    | 19:10    | 01:10              | 01:10               |

  @OTDaily1_19
  Scenario: check Minimum Duration Required of Early-IN & Overstay range and OT Auto Authorization checkbox checked(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0030 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0030 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     070000 |
      | TandADaily11 |          0 |     073000 |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     110000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     173000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     072900 |
      | TandADaily11 |         -1 |     090000 |
      | TandADaily11 |         -1 |     110000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     173000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     082900 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     093000 |
      | TandADaily11 |         -2 |     110000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     173000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     093000 |
      | TandADaily11 |         -3 |     102900 |
      | TandADaily11 |         -3 |     110000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -3 |     183000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     093000 |
      | TandADaily11 |         -4 |     102900 |
      | TandADaily11 |         -4 |     110000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -4 |     182900 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     093000 |
      | TandADaily11 |         -5 |     102900 |
      | TandADaily11 |         -5 |     110000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     183000 |
      | TandADaily11 |         -5 |     190100 |
      | TandADaily11 |         -6 |     082900 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     102900 |
      | TandADaily11 |         -6 |     110000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     183000 |
      | TandADaily11 |         -6 |     190100 |
      | TandADaily11 |         -7 |     083100 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     102900 |
      | TandADaily11 |         -7 |     110000 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     183000 |
      | TandADaily11 |         -7 |     190100 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     090000 |
      | TandADaily11 |         -8 |     102900 |
      | TandADaily11 |         -8 |     110000 |
      | TandADaily11 |         -8 |     130000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     183000 |
      | TandADaily11 |         -8 |     185900 |
      | TandADaily11 |         -9 |     083100 |
      | TandADaily11 |         -9 |     090000 |
      | TandADaily11 |         -9 |     102900 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |         -9 |     130000 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     183000 |
      | TandADaily11 |         -9 |     185900 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-9" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 00:30              | 00:30               |
      |   -1 | 07:00    | 18:00    |                    |                     |
      |   -2 | 08:29    | 18:00    | 00:31              | 00:31               |
      |   -3 | 09:00    | 18:30    | 00:30              | 00:30               |
      |   -4 | 09:00    | 18:29    |                    |                     |
      |   -5 | 09:00    | 19:01    | 00:31              | 00:31               |
      |   -6 | 08:29    | 19:01    | 01:02              | 01:02               |
      |   -7 | 08:31    | 19:01    | 00:31              | 00:31               |
      |   -8 | 08:29    | 18:59    | 00:31              | 00:31               |
      |   -9 | 08:31    | 18:59    |                    |                     |

  @OTDaily1_20
  Scenario: check Factor Minimum Duration Required of Early-IN & Overstay range and OT Auto Authorization checkbox checked(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0030 | OT1        |   1.50 | Check All      |
      | Overstay      |      0000 |    0200 |      0030 | OT1        |   2.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     083000 |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     103000 |
      | TandADaily11 |          0 |     110000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     173000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     073100 |
      | TandADaily11 |         -1 |     090000 |
      | TandADaily11 |         -1 |     110000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     173000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     093000 |
      | TandADaily11 |         -2 |     103000 |
      | TandADaily11 |         -2 |     110000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     183000 |
      | TandADaily11 |         -2 |     190000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     093000 |
      | TandADaily11 |         -3 |     102900 |
      | TandADaily11 |         -3 |     110000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -3 |     183100 |
      | TandADaily11 |         -4 |     080000 |
      | TandADaily11 |         -4 |     083100 |
      | TandADaily11 |         -4 |     102900 |
      | TandADaily11 |         -4 |     110000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -4 |     183100 |
      | TandADaily11 |         -5 |     080000 |
      | TandADaily11 |         -5 |     082900 |
      | TandADaily11 |         -5 |     102900 |
      | TandADaily11 |         -5 |     110000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     183000 |
      | TandADaily11 |         -5 |     190100 |
      | TandADaily11 |         -6 |     082900 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     102900 |
      | TandADaily11 |         -6 |     110000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     183000 |
      | TandADaily11 |         -6 |     185900 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-6" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 08:30    | 18:00    | 00:45              | 00:45               |
      |   -1 | 07:00    | 18:00    | 00:47              | 00:47               |
      |   -2 | 09:00    | 19:00    | 01:00              | 01:00               |
      |   -3 | 09:00    | 18:31    | 01:02              | 01:02               |
      |   -4 | 08:00    | 18:31    | 01:49              | 01:49               |
      |   -5 | 08:00    | 19:01    | 01:02              | 01:02               |
      |   -6 | 08:29    | 18:59    | 00:47              | 00:47               |

  @OTDaily1_21
  Scenario: check Work Hours Within Shift Normal Configuration Only(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     080000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     080000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     190000 |
      | TandADaily11 |         -3 |     080000 |
      | TandADaily11 |         -3 |     190000 |
      | TandADaily11 |         -4 |     070000 |
      | TandADaily11 |         -4 |     073100 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     110000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     173000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     110000 |
      | TandADaily11 |         -5 |     120000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     150000 |
      | TandADaily11 |         -5 |     160000 |
      | TandADaily11 |         -5 |     170000 |
      | TandADaily11 |         -5 |     180000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     093000 |
      | TandADaily11 |         -6 |     103000 |
      | TandADaily11 |         -6 |     110000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     150000 |
      | TandADaily11 |         -6 |     160000 |
      | TandADaily11 |         -6 |     180000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     093000 |
      | TandADaily11 |         -7 |     103000 |
      | TandADaily11 |         -7 |     110000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     150000 |
      | TandADaily11 |         -7 |     160100 |
      | TandADaily11 |         -7 |     180000 |
      | TandADaily11 |         -8 |     070000 |
      | TandADaily11 |         -8 |     093000 |
      | TandADaily11 |         -8 |     103000 |
      | TandADaily11 |         -8 |     110000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     150000 |
      | TandADaily11 |         -8 |     160100 |
      | TandADaily11 |         -8 |     200000 |
      | TandADaily11 |         -9 |     070000 |
      | TandADaily11 |         -9 |     093000 |
      | TandADaily11 |         -9 |     103000 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     150000 |
      | TandADaily11 |         -9 |     155900 |
      | TandADaily11 |         -9 |     200000 |
      | TandADaily11 |        -10 |     070000 |
      | TandADaily11 |        -10 |     103000 |
      | TandADaily11 |        -10 |     104500 |
      | TandADaily11 |        -10 |     124500 |
      | TandADaily11 |        -10 |     130000 |
      | TandADaily11 |        -10 |     144500 |
      | TandADaily11 |        -10 |     151600 |
      | TandADaily11 |        -10 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-10" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 08:00    | 18:00    | 08:00              | 08:00               |
      |   -2 | 08:00    | 19:00    | 08:00              | 08:00               |
      |   -3 | 08:00    | 19:00    | 08:00              | 08:00               |
      |   -4 | 07:00    | 18:00    |                    |                     |
      |   -5 | 09:00    | 18:00    | 06:00              | 06:00               |
      |   -6 | 09:00    | 18:00    | 05:00              | 05:00               |
      |   -7 | 09:00    | 18:00    |                    |                     |
      |   -8 | 07:00    | 20:00    |                    |                     |
      |   -9 | 07:00    | 20:00    | 04:01              | 04:01               |
      |  -10 | 07:00    | 20:00    | 07:59              | 07:59               |

  @OTDaily1_22
  Scenario: check Factor in Work Hours Within Shift Configuration only(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   2.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     080000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     080000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     190000 |
      | TandADaily11 |         -3 |     080000 |
      | TandADaily11 |         -3 |     190000 |
      | TandADaily11 |         -4 |     070000 |
      | TandADaily11 |         -4 |     073100 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     110000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     173000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     110000 |
      | TandADaily11 |         -5 |     120000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     150000 |
      | TandADaily11 |         -5 |     160000 |
      | TandADaily11 |         -5 |     170000 |
      | TandADaily11 |         -5 |     180000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     093000 |
      | TandADaily11 |         -6 |     103000 |
      | TandADaily11 |         -6 |     110000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     150000 |
      | TandADaily11 |         -6 |     160000 |
      | TandADaily11 |         -6 |     180000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     093000 |
      | TandADaily11 |         -7 |     103000 |
      | TandADaily11 |         -7 |     110000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     150000 |
      | TandADaily11 |         -7 |     160100 |
      | TandADaily11 |         -7 |     180000 |
      | TandADaily11 |         -8 |     070000 |
      | TandADaily11 |         -8 |     093000 |
      | TandADaily11 |         -8 |     103000 |
      | TandADaily11 |         -8 |     110000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     150000 |
      | TandADaily11 |         -8 |     160100 |
      | TandADaily11 |         -8 |     200000 |
      | TandADaily11 |         -9 |     070000 |
      | TandADaily11 |         -9 |     093000 |
      | TandADaily11 |         -9 |     103000 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     150000 |
      | TandADaily11 |         -9 |     155900 |
      | TandADaily11 |         -9 |     200000 |
      | TandADaily11 |        -10 |     070000 |
      | TandADaily11 |        -10 |     103000 |
      | TandADaily11 |        -10 |     104500 |
      | TandADaily11 |        -10 |     124500 |
      | TandADaily11 |        -10 |     130000 |
      | TandADaily11 |        -10 |     144500 |
      | TandADaily11 |        -10 |     151600 |
      | TandADaily11 |        -10 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-10" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 16:00              | 16:00               |
      |   -1 | 08:00    | 18:00    | 16:00              | 16:00               |
      |   -2 | 08:00    | 19:00    | 16:00              | 16:00               |
      |   -3 | 08:00    | 19:00    | 16:00              | 16:00               |
      |   -4 | 07:00    | 18:00    |                    |                     |
      |   -5 | 09:00    | 18:00    | 12:00              | 12:00               |
      |   -6 | 09:00    | 18:00    | 10:00              | 10:00               |
      |   -7 | 09:00    | 18:00    |                    |                     |
      |   -8 | 07:00    | 20:00    |                    |                     |
      |   -9 | 07:00    | 20:00    | 08:02              | 08:02               |
      |  -10 | 07:00    | 20:00    | 15:58              | 15:58               |

  @OTDaily1_23
  Scenario: check Daily 1 combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox checked in Overtime(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     085900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180100 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     175900 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     110000 |
      | TandADaily11 |         -5 |     160000 |
      | TandADaily11 |         -5 |     180000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     100000 |
      | TandADaily11 |         -6 |     110000 |
      | TandADaily11 |         -6 |     120000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     170000 |
      | TandADaily11 |         -6 |     175900 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     100000 |
      | TandADaily11 |         -7 |     110000 |
      | TandADaily11 |         -7 |     120000 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     150100 |
      | TandADaily11 |         -7 |     160000 |
      | TandADaily11 |         -7 |     170000 |
      | TandADaily11 |         -7 |     180000 |
      | TandADaily11 |         -7 |     190000 |
      | TandADaily11 |         -7 |     200000 |
      | TandADaily11 |         -8 |     090000 |
      | TandADaily11 |         -8 |     100000 |
      | TandADaily11 |         -8 |     110000 |
      | TandADaily11 |         -8 |     120000 |
      | TandADaily11 |         -8 |     130000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     150100 |
      | TandADaily11 |         -8 |     160000 |
      | TandADaily11 |         -8 |     170000 |
      | TandADaily11 |         -8 |     180000 |
      | TandADaily11 |         -8 |     190000 |
      | TandADaily11 |         -8 |     192900 |
      | TandADaily11 |         -9 |     090000 |
      | TandADaily11 |         -9 |     100000 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |         -9 |     120000 |
      | TandADaily11 |         -9 |     130000 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     150100 |
      | TandADaily11 |         -9 |     160000 |
      | TandADaily11 |         -9 |     170000 |
      | TandADaily11 |         -9 |     180000 |
      | TandADaily11 |         -9 |     190000 |
      | TandADaily11 |         -9 |     193000 |
      | TandADaily11 |        -10 |     070000 |
      | TandADaily11 |        -10 |     072900 |
      | TandADaily11 |        -10 |     090000 |
      | TandADaily11 |        -10 |     100000 |
      | TandADaily11 |        -10 |     110000 |
      | TandADaily11 |        -10 |     120000 |
      | TandADaily11 |        -10 |     130000 |
      | TandADaily11 |        -10 |     140000 |
      | TandADaily11 |        -10 |     150100 |
      | TandADaily11 |        -10 |     160000 |
      | TandADaily11 |        -10 |     170000 |
      | TandADaily11 |        -10 |     180000 |
      | TandADaily11 |        -10 |     190000 |
      | TandADaily11 |        -10 |     193100 |
      | TandADaily11 |        -11 |     070000 |
      | TandADaily11 |        -11 |     073000 |
      | TandADaily11 |        -11 |     090000 |
      | TandADaily11 |        -11 |     100000 |
      | TandADaily11 |        -11 |     110000 |
      | TandADaily11 |        -11 |     120000 |
      | TandADaily11 |        -11 |     130000 |
      | TandADaily11 |        -11 |     140000 |
      | TandADaily11 |        -11 |     150100 |
      | TandADaily11 |        -11 |     160000 |
      | TandADaily11 |        -11 |     170000 |
      | TandADaily11 |        -11 |     180000 |
      | TandADaily11 |        -11 |     190000 |
      | TandADaily11 |        -11 |     210000 |
      | TandADaily11 |        -12 |     050000 |
      | TandADaily11 |        -12 |     083000 |
      | TandADaily11 |        -12 |     090000 |
      | TandADaily11 |        -12 |     100000 |
      | TandADaily11 |        -12 |     110000 |
      | TandADaily11 |        -12 |     120000 |
      | TandADaily11 |        -12 |     130000 |
      | TandADaily11 |        -12 |     140000 |
      | TandADaily11 |        -12 |     150100 |
      | TandADaily11 |        -12 |     160000 |
      | TandADaily11 |        -12 |     170000 |
      | TandADaily11 |        -12 |     180000 |
      | TandADaily11 |        -12 |     190000 |
      | TandADaily11 |        -12 |     210000 |
      | TandADaily11 |        -13 |     050000 |
      | TandADaily11 |        -13 |     083000 |
      | TandADaily11 |        -13 |     090000 |
      | TandADaily11 |        -13 |     180000 |
      | TandADaily11 |        -13 |     190000 |
      | TandADaily11 |        -13 |     220000 |
      | TandADaily11 |        -14 |     070000 |
      | TandADaily11 |        -14 |     072900 |
      | TandADaily11 |        -14 |     090000 |
      | TandADaily11 |        -14 |     093000 |
      | TandADaily11 |        -14 |     110000 |
      | TandADaily11 |        -14 |     113000 |
      | TandADaily11 |        -14 |     130000 |
      | TandADaily11 |        -14 |     133000 |
      | TandADaily11 |        -14 |     150000 |
      | TandADaily11 |        -14 |     153000 |
      | TandADaily11 |        -14 |     170000 |
      | TandADaily11 |        -14 |     173000 |
      | TandADaily11 |        -14 |     190000 |
      | TandADaily11 |        -14 |     192900 |
      | TandADaily11 |        -15 |     050000 |
      | TandADaily11 |        -15 |     220000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-13" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 08:59    | 18:00    | 08:00              | 08:00               |
      |   -2 | 09:00    | 18:01    | 08:00              | 08:00               |
      |   -3 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -4 | 09:00    | 17:59    | 07:59              | 07:59               |
      |   -5 | 09:00    | 18:00    | 04:00              | 04:00               |
      |   -6 | 09:00    | 17:59    |                    |                     |
      |   -7 | 09:00    | 20:00    | 05:59              | 05:59               |
      |   -8 | 09:00    | 19:29    | 04:59              | 04:59               |
      |   -9 | 09:00    | 19:30    | 05:29              | 05:29               |
      |  -10 | 07:00    | 19:31    | 05:30              | 05:30               |
      |  -11 | 07:00    | 21:00    | 07:29              | 07:29               |
      |  -12 | 05:00    | 21:00    | 08:59              | 08:59               |
      |  -13 | 05:00    | 22:00    | 12:00              | 12:00               |
      |  -14 | 07:00    | 19:29    |                    |                     |
      |  -15 | 05:00    | 22:00    | 12:00              | 12:00               |

  @OTDaily1_24
  Scenario: check Daily 1 combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox un-checked in Overtime and authorized overtime application one by one(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    |                 |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     073000 |
      | TandADaily11 |          0 |     083000 |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |          0 |     183000 |
      | TandADaily11 |          0 |     191500 |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT1    | 08:00   | 08:00    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:15    | 09:45              | 08:00               |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT2    | 01:00   | 01:00    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:15    | 09:45              | 09:00               |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT3    | 00:45   | 00:30    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:15    | 09:45              | 09:30               |

  @OTDaily1_25
  Scenario: check Daily 1 combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox un-checked in Overtime and authorized overtime all application approved same time(N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    |                 |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     073000 |
      | TandADaily11 |          0 |     083000 |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |          0 |     183000 |
      | TandADaily11 |          0 |     191500 |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "0" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT1    | 08:00   | 08:00    |            | Saved Successfully |
      | TandADaily11 |    0 | OT2    | 01:00   | 01:00    |            | Saved Successfully |
      | TandADaily11 |    0 | OT3    | 00:45   | 00:45    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 19:15    | 09:45              | 09:45               |

  @OTDaily1_26
  Scenario: check Special function punch like official in and out while overtime configure combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox checked (N punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time | Spfid |
      | TandADaily11 |          0 |     093000 |     1 |
      | TandADaily11 |          0 |     130000 |       |
      | TandADaily11 |          0 |     140000 |       |
      | TandADaily11 |          0 |     174500 |     2 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:30    | 17:45    | 07:15              | 07:15               |

  @OTDaily1_27
  Scenario: check Special function punch like official in and out while overtime configure combination of Early-in,Overstay and Work Hours Within Shift and auto authorized checkbox checked (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0400 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0030 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0030 | OT3        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time | Spfid |
      | TandADaily11 |          0 |     093000 |     1 |
      | TandADaily11 |          0 |     130000 |       |
      | TandADaily11 |          0 |     140000 |       |
      | TandADaily11 |          0 |     174500 |     2 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:30    | 17:45    | 07:15              | 07:15               |

  @OTDaily1_28
  Scenario: check actual and fixed config of Overtime Rounding For Fraction Of An Hour configuration while daily 1 - Early in,overstay & work hours within shift configuration (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "TandADaily11"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     071500 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     181500 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:15    | 18:15    | 10:15              | 10:15               |

  @OTDaily1_29
  Scenario: check only fixed config of Overtime Rounding For Fraction Of An Hour configuration while daily 1 - Early in,overstay & work hours within shift configuration (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift  |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                 |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "TandADaily11"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Fixed           |           21 |
      |        31 |      59 | Fixed           |           45 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | TandADaily11 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     085900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180100 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     175900 |
      | TandADaily11 |         -4 |     083000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     183000 |
      | TandADaily11 |         -5 |     093000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     173000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     125900 |
      | TandADaily11 |         -8 |     082900 |
      | TandADaily11 |         -8 |     125900 |
      | TandADaily11 |         -9 |     140000 |
      | TandADaily11 |         -9 |     180000 |
      | TandADaily11 |        -10 |     140100 |
      | TandADaily11 |        -10 |     180000 |
      | TandADaily11 |        -11 |     140100 |
      | TandADaily11 |        -11 |     183000 |
      | TandADaily11 |        -12 |     080000 |
      | TandADaily11 |        -12 |     130000 |
      | TandADaily11 |        -12 |     140000 |
      | TandADaily11 |        -12 |     190000 |
      | TandADaily11 |        -13 |     060000 |
      | TandADaily11 |        -13 |     130000 |
      | TandADaily11 |        -13 |     140000 |
      | TandADaily11 |        -13 |     220000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-13" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 08:59    | 18:00    | 08:21              | 08:21               |
      |   -2 | 09:00    | 18:01    | 08:21              | 08:21               |
      |   -3 | 09:00    | 17:59    | 07:45              | 07:45               |
      |   -4 | 08:30    | 18:30    | 08:42              | 08:42               |
      |   -5 | 09:30    | 17:30    | 07:00              | 07:00               |
      |   -6 | 09:00    | 13:00    | 04:00              | 04:00               |
      |   -7 | 09:00    | 12:59    | 03:45              | 03:45               |
      |   -8 | 08:29    | 12:59    | 04:30              | 04:30               |
      |   -9 | 14:00    | 18:00    | 04:00              | 04:00               |
      |  -10 | 14:01    | 18:00    | 03:45              | 03:45               |
      |  -11 | 14:01    | 18:30    | 04:06              | 04:06               |
      |  -12 | 08:00    | 19:00    | 10:00              | 10:00               |
      |  -13 | 06:00    | 22:00    | 12:00              | 12:00               |

  @OTDaily1_30
  Scenario: check OT generated only Sat,Mon & WO only (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT            | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | Mon,Tue,WO,Sat,Sun | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | WO,Sa,Su       |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Mo,Tu,WO       |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Mo,Tu,WO       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | W1,W5          |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   01012024 |     070000 |
      | TandADaily11 |   01012024 |     130000 |
      | TandADaily11 |   01012024 |     140000 |
      | TandADaily11 |   01012024 |     200000 |
      | TandADaily11 |   02012024 |     070000 |
      | TandADaily11 |   02012024 |     130000 |
      | TandADaily11 |   02012024 |     140000 |
      | TandADaily11 |   02012024 |     200000 |
      | TandADaily11 |   03012024 |     070000 |
      | TandADaily11 |   03012024 |     130000 |
      | TandADaily11 |   03012024 |     140000 |
      | TandADaily11 |   03012024 |     200000 |
      | TandADaily11 |   04012024 |     070000 |
      | TandADaily11 |   04012024 |     130000 |
      | TandADaily11 |   04012024 |     140000 |
      | TandADaily11 |   04012024 |     200000 |
      | TandADaily11 |   05012024 |     070000 |
      | TandADaily11 |   05012024 |     130000 |
      | TandADaily11 |   05012024 |     140000 |
      | TandADaily11 |   05012024 |     200000 |
      | TandADaily11 |   06012024 |     070000 |
      | TandADaily11 |   06012024 |     130000 |
      | TandADaily11 |   06012024 |     140000 |
      | TandADaily11 |   06012024 |     200000 |
      | TandADaily11 |   07012024 |     070000 |
      | TandADaily11 |   07012024 |     130000 |
      | TandADaily11 |   07012024 |     140000 |
      | TandADaily11 |   07012024 |     200000 |
      | TandADaily11 |   08012024 |     070000 |
      | TandADaily11 |   08012024 |     130000 |
      | TandADaily11 |   08012024 |     140000 |
      | TandADaily11 |   08012024 |     200000 |
      | TandADaily11 |   09012024 |     070000 |
      | TandADaily11 |   09012024 |     130000 |
      | TandADaily11 |   09012024 |     140000 |
      | TandADaily11 |   09012024 |     200000 |
      | TandADaily11 |   10012024 |     070000 |
      | TandADaily11 |   10012024 |     130000 |
      | TandADaily11 |   10012024 |     140000 |
      | TandADaily11 |   10012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "01/01/2024" and "10/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 07/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily1_31
  Scenario: check OT generated only PH,WO/PH,WO only (4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | PH,WO,WO/PH | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | PH,WO,WO/PH,FB,RD |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | WO                |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | WO                |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Utrayan     | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | W1,W5          |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   13012024 |     070000 |
      | TandADaily11 |   13012024 |     130000 |
      | TandADaily11 |   13012024 |     140000 |
      | TandADaily11 |   13012024 |     200000 |
      | TandADaily11 |   14012024 |     070000 |
      | TandADaily11 |   14012024 |     130000 |
      | TandADaily11 |   14012024 |     140000 |
      | TandADaily11 |   14012024 |     200000 |
      | TandADaily11 |   15012024 |     070000 |
      | TandADaily11 |   15012024 |     130000 |
      | TandADaily11 |   15012024 |     140000 |
      | TandADaily11 |   15012024 |     200000 |
      | TandADaily11 |   16012024 |     070000 |
      | TandADaily11 |   16012024 |     130000 |
      | TandADaily11 |   16012024 |     140000 |
      | TandADaily11 |   16012024 |     200000 |
      | TandADaily11 |   17012024 |     070000 |
      | TandADaily11 |   17012024 |     130000 |
      | TandADaily11 |   17012024 |     140000 |
      | TandADaily11 |   17012024 |     200000 |
      | TandADaily11 |   17012024 |     070000 |
      | TandADaily11 |   17012024 |     130000 |
      | TandADaily11 |   17012024 |     140000 |
      | TandADaily11 |   17012024 |     200000 |
      | TandADaily11 |   18012024 |     070000 |
      | TandADaily11 |   18012024 |     130000 |
      | TandADaily11 |   18012024 |     140000 |
      | TandADaily11 |   18012024 |     200000 |
      | TandADaily11 |   19012024 |     070000 |
      | TandADaily11 |   19012024 |     130000 |
      | TandADaily11 |   19012024 |     140000 |
      | TandADaily11 |   19012024 |     200000 |
      | TandADaily11 |   20012024 |     070000 |
      | TandADaily11 |   20012024 |     130000 |
      | TandADaily11 |   20012024 |     140000 |
      | TandADaily11 |   20012024 |     200000 |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "13/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 15/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 22/01/2024 | 07:00    | 20:00    |                    |                     |
      | 23/01/2024 | 07:00    | 20:00    |                    |                     |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily1_36
  Scenario: check OT generated on WO,PH Or shiftFBRD while Cal On WOPHFBRD As Per Week checked,(Mon,Tue,Wed,Thu,Fri,Sat,Sun)checked in Days For Cal in OT Config and (Mon,Tue,Wed,Thu,Fri,Sat,Sun)selected in Work Hrs Within Shift(N Punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT                     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays       |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/01/2024 | 24/01/2024 | Utrayan     | False        |
      | 20/01/2024 | 20/01/2024 | RamMandir   | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   20012024 |     070000 |
      | TandADaily11 |   20012024 |     100000 |
      | TandADaily11 |   20012024 |     110000 |
      | TandADaily11 |   20012024 |     120000 |
      | TandADaily11 |   20012024 |     130000 |
      | TandADaily11 |   20012024 |     140000 |
      | TandADaily11 |   20012024 |     150000 |
      | TandADaily11 |   20012024 |     160000 |
      | TandADaily11 |   20012024 |     170000 |
      | TandADaily11 |   20012024 |     180000 |
      | TandADaily11 |   20012024 |     190000 |
      | TandADaily11 |   20012024 |     200000 |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     100000 |
      | TandADaily11 |   21012024 |     110000 |
      | TandADaily11 |   21012024 |     120000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     150000 |
      | TandADaily11 |   21012024 |     160000 |
      | TandADaily11 |   21012024 |     170000 |
      | TandADaily11 |   21012024 |     180000 |
      | TandADaily11 |   21012024 |     190000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     110000 |
      | TandADaily11 |   22012024 |     120000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     150000 |
      | TandADaily11 |   22012024 |     160000 |
      | TandADaily11 |   22012024 |     170000 |
      | TandADaily11 |   22012024 |     180000 |
      | TandADaily11 |   22012024 |     190000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     110000 |
      | TandADaily11 |   23012024 |     120000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     150000 |
      | TandADaily11 |   23012024 |     160000 |
      | TandADaily11 |   23012024 |     170000 |
      | TandADaily11 |   23012024 |     180000 |
      | TandADaily11 |   23012024 |     190000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     100000 |
      | TandADaily11 |   24012024 |     110000 |
      | TandADaily11 |   24012024 |     120000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     150000 |
      | TandADaily11 |   24012024 |     160000 |
      | TandADaily11 |   24012024 |     170000 |
      | TandADaily11 |   24012024 |     180000 |
      | TandADaily11 |   24012024 |     190000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "20/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 20/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 21/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 22/01/2024 | 11:00    | 20:00    | 08:00              | 08:00               |
      | 23/01/2024 | 11:00    | 20:00    | 08:00              | 08:00               |
      | 24/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |

  @OTDaily1_37
  Scenario: check OT generated on WO,PH Or shift FBRD while Cal On WOPHFBRD As Per Weekday unchecked, All checked in Days To Consider For Calculation in Overtime Configuration and all selected in Work Hours Within Shift drop down(4 Punch)
      Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | false             | false              | True      | All     | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/01/2024 | 24/01/2024 | Utrayan     | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     100000 |
      | TandADaily11 |   21012024 |     110000 |
      | TandADaily11 |   21012024 |     120000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     150000 |
      | TandADaily11 |   21012024 |     160000 |
      | TandADaily11 |   21012024 |     170000 |
      | TandADaily11 |   21012024 |     180000 |
      | TandADaily11 |   21012024 |     190000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     100000 |
      | TandADaily11 |   22012024 |     110000 |
      | TandADaily11 |   22012024 |     120000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     150000 |
      | TandADaily11 |   22012024 |     160000 |
      | TandADaily11 |   22012024 |     170000 |
      | TandADaily11 |   22012024 |     180000 |
      | TandADaily11 |   22012024 |     190000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     100000 |
      | TandADaily11 |   23012024 |     110000 |
      | TandADaily11 |   23012024 |     120000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     150000 |
      | TandADaily11 |   23012024 |     160000 |
      | TandADaily11 |   23012024 |     170000 |
      | TandADaily11 |   23012024 |     180000 |
      | TandADaily11 |   23012024 |     190000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     100000 |
      | TandADaily11 |   24012024 |     110000 |
      | TandADaily11 |   24012024 |     120000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     150000 |
      | TandADaily11 |   24012024 |     160000 |
      | TandADaily11 |   24012024 |     170000 |
      | TandADaily11 |   24012024 |     180000 |
      | TandADaily11 |   24012024 |     190000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "21/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 22/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 23/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 24/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |

  @OTDaily1_38
  Scenario: check OT generated on WOPH Or shift FBRD while Cal On WOPHFBRD As Per Weekday checked, only WOPH checked in Days To Consider For Cal in OT Configuration and WO/PH selected in Work Hours Within Shift drop down(4 punch)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete Holiday Schedule
      | HSName    |
      | CKHoliday |
    And Delete "CK" shift schedule
    And Delete "CK" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | WO/PH   | true           | Daily 1    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | WO/PH          |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | WO/PH          |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | WO/PH          |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/01/2024 | 24/01/2024 | Utrayan     | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |              22 |
      | FB      |               1 |
      | RD      |               1 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | HolidaySchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandADaily11 | True   | True      | N-Punch                  | Both              |               |             | TandADaily11 |           |             |         | True      | CK            | CKHoliday       | CK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | TandADaily11 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |   21012024 |     070000 |
      | TandADaily11 |   21012024 |     100000 |
      | TandADaily11 |   21012024 |     110000 |
      | TandADaily11 |   21012024 |     120000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     150000 |
      | TandADaily11 |   21012024 |     160000 |
      | TandADaily11 |   21012024 |     170000 |
      | TandADaily11 |   21012024 |     180000 |
      | TandADaily11 |   21012024 |     190000 |
      | TandADaily11 |   21012024 |     200000 |
      | TandADaily11 |   22012024 |     070000 |
      | TandADaily11 |   22012024 |     100000 |
      | TandADaily11 |   22012024 |     110000 |
      | TandADaily11 |   22012024 |     120000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     150000 |
      | TandADaily11 |   22012024 |     160000 |
      | TandADaily11 |   22012024 |     170000 |
      | TandADaily11 |   22012024 |     180000 |
      | TandADaily11 |   22012024 |     190000 |
      | TandADaily11 |   22012024 |     200000 |
      | TandADaily11 |   23012024 |     070000 |
      | TandADaily11 |   23012024 |     100000 |
      | TandADaily11 |   23012024 |     110000 |
      | TandADaily11 |   23012024 |     120000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     150000 |
      | TandADaily11 |   23012024 |     160000 |
      | TandADaily11 |   23012024 |     170000 |
      | TandADaily11 |   23012024 |     180000 |
      | TandADaily11 |   23012024 |     190000 |
      | TandADaily11 |   23012024 |     200000 |
      | TandADaily11 |   24012024 |     070000 |
      | TandADaily11 |   24012024 |     100000 |
      | TandADaily11 |   24012024 |     110000 |
      | TandADaily11 |   24012024 |     120000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     150000 |
      | TandADaily11 |   24012024 |     160000 |
      | TandADaily11 |   24012024 |     170000 |
      | TandADaily11 |   24012024 |     180000 |
      | TandADaily11 |   24012024 |     190000 |
      | TandADaily11 |   24012024 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "21/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/01/2024 | 07:00    | 20:00    |                    |                     |
      | 22/01/2024 | 07:00    | 20:00    |                    |                     |
      | 23/01/2024 | 07:00    | 20:00    |                    |                     |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |
