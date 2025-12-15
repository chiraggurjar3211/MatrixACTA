@OTDaily2_
Feature: Overtime Feature
  I want to use this template for my feature file

  ########### Priority Work Component############################
  @OTDaily2_1
  Scenario: 4 punch user - Priority Work Component check for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
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
      |    0 | 07:00    | 18:00    | 10:00              | 10:00               |
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
      |   -2 | 09:00    | 20:00    | 10:00              | 10:00               |

  @OTDaily2_2
  Scenario: 4 punch user - Check network hours range From and to in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00801 |        01200 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
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
      | TandADaily11 |         -3 |     085800 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     180200 |
      | TandADaily11 |         -5 |     070000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     200000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-5" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    |                    |                     |
      |   -1 | 08:59    | 18:00    |                    |                     |
      |   -2 | 09:00    | 18:01    |                    |                     |
      |   -3 | 08:58    | 18:00    | 00:01              | 00:01               |
      |   -4 | 09:00    | 18:02    | 00:01              | 00:01               |
      |   -5 | 07:00    | 20:00    | 03:59              | 03:59               |

  @OTDaily2_3
  Scenario: 4 punch user - Check MinDurReq then generated OT in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00800 |        01200 |     00130 | OT1        |   1.00 | Priority Work Component | Check All      |
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
      | TandADaily11 |         -1 |     080000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     073000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -3 |     073100 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -4 |     072900 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     193000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     192900 |
      | TandADaily11 |         -7 |     080000 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     183000 |
      | TandADaily11 |         -8 |     050000 |
      | TandADaily11 |         -8 |     130000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     210000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-8" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    |                    |                     |
      |   -1 | 08:00    | 18:00    |                    |                     |
      |   -2 | 07:30    | 18:00    | 01:30              | 01:30               |
      |   -3 | 07:31    | 18:00    |                    |                     |
      |   -4 | 07:29    | 18:00    | 01:31              | 01:31               |
      |   -5 | 09:00    | 19:30    | 01:30              | 01:30               |
      |   -6 | 09:00    | 19:29    |                    |                     |
      |   -7 | 08:00    | 18:30    | 01:30              | 01:30               |
      |   -8 | 05:00    | 21:00    | 04:00              | 04:00               |

  @OTDaily2_4
  Scenario: 4 punch user - Check Factor in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00800 |        01200 |     00130 | OT1        |   1.50 | Priority Work Component | Check All      |
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
      | TandADaily11 |         -1 |     072900 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     193000 |
      | TandADaily11 |         -3 |     080000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     183000 |
      | TandADaily11 |         -4 |     050000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     210000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:30    | 18:00    | 02:15              | 02:15               |
      |   -1 | 07:29    | 18:00    | 02:16              | 02:16               |
      |   -2 | 09:00    | 19:30    | 02:15              | 02:15               |
      |   -3 | 08:00    | 18:30    | 02:15              | 02:15               |
      |   -4 | 05:00    | 21:00    | 06:00              | 06:00               |

  @OTDaily2_5
  Scenario: 4 punch user - Check multiple configuration in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00400 |     00200 | OT1        |   1.00 | Priority Work Component | Check All      |
      |          00800 |        01000 |     00100 | OT2        |   1.50 | Priority Work Component | Check All      |
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
      | TandADaily11 |          0 |     110000 |
      | TandADaily11 |         -1 |     090000 |
      | TandADaily11 |         -1 |     105900 |
      | TandADaily11 |         -2 |     090000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -5 |     080000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     190000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-5" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 11:00    | 02:00              | 02:00               |
      |   -1 | 09:00    | 10:59    |                    |                     |
      |   -2 | 09:00    | 13:00    | 04:00              | 04:00               |
      |   -3 | 09:00    | 18:00    | 04:00              | 04:00               |
      |   -4 | 09:00    | 18:00    | 04:00              | 04:00               |
      |   -5 | 08:00    | 19:00    | 07:00              | 07:00               |

  @OTDaily2_6
  Scenario: 4 punch user - Check Applicable Days like Mon,Thu,Sat and Sun in Priority Work Component
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00800 |        01200 |     00000 | OT2        |   1.00 | Priority Work Component | Mo,Th,Sa,Su    |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | Sa,Su          |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
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
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 07/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily2_7
  Scenario: 4 punch user - Check Applicable Days like PH,WO/PH,WO,FB & RD in Priority Work Component
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays    |
      |          00800 |        01200 |     00000 | OT2        |   1.00 | Priority Work Component | FB,RD             |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | PH,WO/PH,WO,FB,RD |
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
      | 13/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 14/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 15/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 21/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 22/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 23/01/2024 | 07:00    | 20:00    | 12:00              | 12:00               |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily2_8
  Scenario: 4 punch user -Auto authorized checkbox uncheck for configuration Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    |                 |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00400 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
      |          00800 |        01000 |     00000 | OT2        |   1.50 | Priority Work Component | Check All      |
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
      | TandADaily11 |          0 |     210000 |
      | TandADaily11 |         -1 |     083000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     181500 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 07:00              |                     |
      |   -1 | 08:30    | 18:15    | 05:08              |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-1" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT1    | 04:00   | 04:00    |            | Saved Successfully |
      | TandADaily11 |    0 | OT2    | 03:00   | 01:30    |            | Saved Successfully |
      | TandADaily11 |   -1 | OT1    | 04:00   | 01:00    |            | Saved Successfully |
      | TandADaily11 |   -1 | OT2    | 01:08   | 01:00    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 07:00              | 05:30               |
      |   -1 | 08:30    | 18:15    | 05:08              | 02:00               |

  @OTDaily2_9
  Scenario: 4 punch user -Auto authorized checkbox checked but Authorizatio required for late in checked for configuration Priority Work Component for all applicable days
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
    And Create Late-In Policy
      | Name | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | CK   | true             |        30 |                          | Saved Successfully |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | true            | true                  | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
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
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | TandADaily11 |          0 |     090000 |
      | TandADaily11 |          0 |     130000 |
      | TandADaily11 |          0 |     140000 |
      | TandADaily11 |          0 |     180000 |
      | TandADaily11 |         -1 |     091500 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     093000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -3 |     093100 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180000 |
    And Daily Attendance View for userid "TandADaily11" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 09:15    | 18:00    | 07:45              |                     |
      |   -2 | 09:30    | 18:00    | 07:30              |                     |
      |   -3 | 09:31    | 18:00    | 07:29              |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-3" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |   -1 | OT1    | 07:45   | 07:45    |            | Saved Successfully |
      | TandADaily11 |   -2 | OT1    | 07:30   | 07:30    |            | Saved Successfully |
      | TandADaily11 |   -3 | OT1    | 07:29   | 07:29    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 09:15    | 18:00    | 07:45              | 07:45               |
      |   -2 | 09:30    | 18:00    | 07:30              | 07:30               |
      |   -3 | 09:31    | 18:00    | 07:29              | 07:29               |

  @OTDaily2_10
  Scenario: check OT generated only Sat,Mon & WO for configuration Priority Work Component for all applicable days (4 punch)
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT            | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | Mon,Tue,WO,Sat,Sun | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | WO,Sa,Su       |
      |          00800 |        01200 |     00000 | OT2        |   1.00 | Priority Work Component | Mo,Tu          |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
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
      | 06/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 07/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily2_11
  Scenario: check OT generated only PH,WO/PH,WO for configuration Priority Work Component for all applicable days (4 punch)
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | PH,WO,WO/PH | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | WO,FB,RD       |
      |          00000 |        00800 |     00000 | OT2        |   2.00 | Priority Work Component | WO/PH,PH       |
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
      | 14/01/2024 | 07:00    | 20:00    | 16:00              | 16:00               |
      | 15/01/2024 | 07:00    | 20:00    | 16:00              | 16:00               |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 22/01/2024 | 07:00    | 20:00    |                    |                     |
      | 23/01/2024 | 07:00    | 20:00    |                    |                     |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily2_12
  Scenario: check OT generated on WO,PH,WOPH Or shiftFBRD while Cal On WOPHFBRD As Per Weekday checked,(Mon,Tue,Wed,Thu,Fri,Sat,Sun)checked in Days To Consider For Cal in OT Config and (Mon,Tue,Wed,Thu,Fri,Sat,Sun) in Priority Work Component drop down(4 punch)
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT                     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
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
      | TandADaily11 |   20012024 |     110000 |
      | TandADaily11 |   20012024 |     130000 |
      | TandADaily11 |   20012024 |     140000 |
      | TandADaily11 |   20012024 |     170000 |
      | TandADaily11 |   21012024 |     110000 |
      | TandADaily11 |   21012024 |     130000 |
      | TandADaily11 |   21012024 |     140000 |
      | TandADaily11 |   21012024 |     170000 |
      | TandADaily11 |   22012024 |     110000 |
      | TandADaily11 |   22012024 |     130000 |
      | TandADaily11 |   22012024 |     140000 |
      | TandADaily11 |   22012024 |     170000 |
      | TandADaily11 |   23012024 |     110000 |
      | TandADaily11 |   23012024 |     130000 |
      | TandADaily11 |   23012024 |     140000 |
      | TandADaily11 |   23012024 |     170000 |
      | TandADaily11 |   24012024 |     110000 |
      | TandADaily11 |   24012024 |     130000 |
      | TandADaily11 |   24012024 |     140000 |
      | TandADaily11 |   24012024 |     170000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "20/01/2024" and "24/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 20/01/2024 | 11:00    | 17:00    | 05:00              | 05:00               |
      | 21/01/2024 | 11:00    | 17:00    | 05:00              | 05:00               |
      | 22/01/2024 | 11:00    | 17:00    | 05:00              | 05:00               |
      | 23/01/2024 | 11:00    | 17:00    | 05:00              | 05:00               |
      | 24/01/2024 | 11:00    | 17:00    | 05:00              | 05:00               |

  @OTDaily2_13
  Scenario: check OT generated on WO,PH Or shift FB,RD while Cal On WOPHFBRD As Per Weekday unchecked,All checked in Days To Consider For Cal in OT Configuration and All selected in Priority Work Component drop down(4 punch user)
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | false             | false              | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
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

  @OTDaily2_14
  Scenario: check OT generated on WO,PH Or shift FB,RD while Cal On WOPHFBRD As Per Weekday checked,only WO/PH checked in Days To Consider For Cal in OT Configuration and WO/PH selected in Priority Work Component drop down(4 punch user)
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | true              | true               | True      | WO/PH   | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Priority Work Component | WO/PH          |
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

  ###########  Special Time Range############################
  @OTDaily2_15
  Scenario: 4 punch user - Special OT Time Range check for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | 18:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Special Time Range | Check All      |
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
      | TandADaily11 |         -2 |     220000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    |                    |                     |
      |   -1 | 07:00    | 20:00    | 02:00              | 02:00               |
      |   -2 | 09:00    | 22:00    | 03:00              | 03:00               |

  @OTDaily2_16
  Scenario: 4 punch user - Special OT Time Range check for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays |
      |          00400 |        00600 |     00000 | OT1        |   1.00 | Special Time Range | Check All      |
      |          00600 |        02300 |     00000 | OT2        |   1.30 | Special Time Range | Check All      |
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
      | TandADaily11 |         -2 |     220000 |
      | TandADaily11 |         -3 |     070000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     230000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 03:18              | 03:18               |
      |   -1 | 07:00    | 20:00    | 05:54              | 05:54               |
      |   -2 | 09:00    | 22:00    | 07:12              | 07:12               |
      |   -3 | 07:00    | 23:00    | 07:12              | 07:12               |

  @OTDaily2_17
  Scenario: 4 punch user - Special OT Time Range :check generate OT while all applicable days and Single NWHrsRangeFrom-To configure
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | 18:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Special Time Range | Check All      |
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
      | TandADaily11 |         -2 |     220000 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    |                    |                     |
      |   -1 | 07:00    | 20:00    | 02:00              | 02:00               |
      |   -2 | 09:00    | 22:00    | 03:00              | 03:00               |

  @OTDaily2_18
  Scenario: 4 punch user - Special OT Time Range :check generated OT while all applicable days in overtime configuration,factor, Multiple NWHrsRangeFrom-To and Networkhours falls in Multiple NWHrsRangeFrom-To
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays |
      |          00400 |        00600 |     00000 | OT1        |   1.00 | Special Time Range | Check All      |
      |          00600 |        02300 |     00000 | OT2        |   1.30 | Special Time Range | Check All      |
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
      | TandADaily11 |         -2 |     220000 |
      | TandADaily11 |         -3 |     070000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     230000 |
      | TandADaily11 |         -4 |     070000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     100000 |
      | TandADaily11 |         -4 |     120000 |
      | TandADaily11 |         -5 |     090000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     150000 |
      | TandADaily11 |         -6 |     090000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     160000 |
      | TandADaily11 |         -7 |     090000 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     170000 |
      | TandADaily11 |         -8 |     090000 |
      | TandADaily11 |         -8 |     130000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     180000 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |         -9 |     130000 |
      | TandADaily11 |         -9 |     200000 |
      | TandADaily11 |         -9 |     230000 |
      | TandADaily11 |        -10 |     130000 |
      | TandADaily11 |        -10 |     160000 |
      | TandADaily11 |        -10 |     170000 |
      | TandADaily11 |        -10 |     200000 |
      | TandADaily11 |        -11 |     130000 |
      | TandADaily11 |        -11 |     150000 |
      | TandADaily11 |        -11 |     170000 |
      | TandADaily11 |        -11 |     180000 |
      | TandADaily11 |        -12 |     130000 |
      | TandADaily11 |        -12 |     150000 |
      | TandADaily11 |        -12 |     170000 |
      | TandADaily11 |        -12 |     190000 |
      | TandADaily11 |        -13 |     130000 |
      | TandADaily11 |        -13 |     150000 |
      | TandADaily11 |        -13 |     170000 |
      | TandADaily11 |        -13 |     200000 |
      | TandADaily11 |        -14 |     130000 |
      | TandADaily11 |        -14 |     150000 |
      | TandADaily11 |        -14 |     170000 |
      | TandADaily11 |        -14 |     190100 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-14" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 18:00    | 03:18              | 03:18               |
      |   -1 | 07:00    | 20:00    | 05:54              | 05:54               |
      |   -2 | 09:00    | 22:00    | 07:12              | 07:12               |
      |   -3 | 07:00    | 23:00    | 07:12              | 07:12               |
      |   -4 | 07:00    | 12:00    |                    |                     |
      |   -5 | 09:00    | 15:00    |                    |                     |
      |   -6 | 09:00    | 16:00    | 01:00              | 01:00               |
      |   -7 | 09:00    | 17:00    | 02:00              | 02:00               |
      |   -8 | 09:00    | 18:00    | 03:18              | 03:18               |
      |   -9 | 11:00    | 23:00    | 01:00              | 01:00               |
      |  -10 | 13:00    | 20:00    | 02:00              | 02:00               |
      |  -11 | 13:00    | 18:00    |                    |                     |
      |  -12 | 13:00    | 19:00    |                    |                     |
      |  -13 | 13:00    | 20:00    | 01:00              | 01:00               |
      |  -14 | 13:00    | 19:01    | 00:01              | 00:01               |

  @OTDaily2_19
  Scenario: 4 punch user - Special OT Time Range :Check Applicable Days like Mon,Thu,Sat and Sun in Special Time Range Configuration
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays |
      |          00800 |        02300 |     00000 | OT1        |   1.00 | Special Time Range | Mo,Th,Sa,Su    |
      |          00000 |        00800 |     00000 | OT2        |   1.50 | Special Time Range | Sa,Su          |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | CK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "CK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
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
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 07/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily2_20
  Scenario: 4 punch user- Special OT Time Range :- Check Applicable Days like PH,WO/PH,WO,FB & RD in Priority Work Component
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays    |
      |          00000 |        00800 |     00000 | OT2        |   1.50 | Special Time Range | PH,WO/PH,WO,FB,RD |
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
      | 13/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 14/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 15/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 21/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 22/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 23/01/2024 | 07:00    | 20:00    | 07:30              | 07:30               |
      | 24/01/2024 | 07:00    | 20:00    |                    |                     |

  @OTDaily2_21
  Scenario: 4 punch user -Special OT Time Range : check Auto authorized checkbox uncheck
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    |                 |                       | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer      | ApplicableDays |
      |          00800 |        01200 |     00000 | OT1        |   1.00 | Special Time Range | Check All      |
      |          00000 |        00800 |     00000 | OT2        |   1.50 | Special Time Range | Check All      |
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
      | TandADaily11 |          0 |     210000 |
      | TandADaily11 |         -1 |     083000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     181500 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 09:00              |                     |
      |   -1 | 08:30    | 18:15    | 04:52              |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-1" and "0"
      | UserID       | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandADaily11 |    0 | OT2    | 09:00   | 09:00    |            | Saved Successfully |
      | TandADaily11 |   -1 | OT2    | 04:52   | 04:52    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 07:00    | 21:00    | 09:00              | 09:00               |
      |   -1 | 08:30    | 18:15    | 04:52              | 04:52               |

  ########## Priority Work Component and Special Time Range Configuration##################
  @OTDaily2_22
  Scenario: 4 punch user - Allow Overlapping Work Components checkbox checked  and Priority Work Component and Special Time Range Configuration and normal case
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | true            |                       | true                  | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
      |          00000 |        00800 |     00000 | OT2        |   1.00 | Special Time Range      | Check All      |
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
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     070000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     200000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     200000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     220000 |
      | TandADaily11 |         -5 |     040000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     230000 |
      | TandADaily11 |         -6 |     040000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     180000 |
      | TandADaily11 |         -8 |     110000 |
      | TandADaily11 |         -8 |     120000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     160000 |
      | TandADaily11 |         -9 |     070000 |
      | TandADaily11 |         -9 |     090000 |
      | TandADaily11 |         -9 |     100000 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |        -10 |     130000 |
      | TandADaily11 |        -10 |     140000 |
      | TandADaily11 |        -10 |     150000 |
      | TandADaily11 |        -10 |     180000 |
    And Daily Attendance View for userid "TandADaily11" and period "Date" on "-10" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 07:00    | 18:00    | 08:00              | 08:00               |
      |   -2 | 07:00    | 20:00    | 08:00              | 08:00               |
      |   -3 | 09:00    | 20:00    | 08:00              | 08:00               |
      |   -4 | 09:00    | 22:00    | 08:00              | 08:00               |
      |   -5 | 04:00    | 23:00    | 08:00              | 08:00               |
      |   -6 | 04:00    | 13:00    | 08:00              | 08:00               |
      |   -7 | 14:00    | 18:00    | 04:00              | 04:00               |
      |   -8 | 11:00    | 16:00    | 03:00              | 03:00               |
      |   -9 | 07:00    | 11:00    | 03:00              | 03:00               |
      |  -10 | 13:00    | 18:00    | 04:00              | 04:00               |

  @OTDaily2_48
  Scenario: 4 punch user - Allow Overlapping Work Components checkbox unchecked  and Priority Work Component and Special Time Range Configuration
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | true            |                       | true                  | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00800 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
      |          00800 |        01300 |     00000 | OT2        |   1.00 | Special Time Range      | Check All      |
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
      | TandADaily11 |         -1 |     070000 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     070000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     200000 |
      | TandADaily11 |         -3 |     090000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     200000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     130000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     220000 |
      | TandADaily11 |         -5 |     040000 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     230000 |
      | TandADaily11 |         -6 |     040000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     180000 |
      | TandADaily11 |         -8 |     110000 |
      | TandADaily11 |         -8 |     120000 |
      | TandADaily11 |         -8 |     140000 |
      | TandADaily11 |         -8 |     160000 |
      | TandADaily11 |         -9 |     070000 |
      | TandADaily11 |         -9 |     090000 |
      | TandADaily11 |         -9 |     100000 |
      | TandADaily11 |         -9 |     110000 |
      | TandADaily11 |        -10 |     130000 |
      | TandADaily11 |        -10 |     140000 |
      | TandADaily11 |        -10 |     150000 |
      | TandADaily11 |        -10 |     180000 |
    And Daily Attendance View for userid "TandADaily11" and period "Date" on "-10" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |    0 | 09:00    | 18:00    | 08:00              | 08:00               |
      |   -1 | 07:00    | 18:00    | 02:00              | 02:00               |
      |   -2 | 07:00    | 20:00    | 04:00              | 04:00               |
      |   -3 | 09:00    | 20:00    | 02:00              | 02:00               |
      |   -4 | 09:00    | 22:00    | 04:00              | 04:00               |
      |   -5 | 04:00    | 23:00    | 09:00              | 09:00               |
      |   -6 | 04:00    | 13:00    | 08:00              | 08:00               |
      |   -7 | 14:00    | 18:00    | 04:00              | 04:00               |
      |   -8 | 11:00    | 16:00    | 03:00              | 03:00               |
      |   -9 | 07:00    | 11:00    | 03:00              | 03:00               |
      |  -10 | 13:00    | 18:00    | 04:00              | 04:00               |

  @OTDaily2_47
  Scenario: 4 punch user - Allow Overlapping Work Components checkbox checked  and Priority Work Component and Special Time Range Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | TandADaily11 |
    And Delete "CK" shift schedule
    And Delete "Ck" shift
    And Delete "FB" shift
    And Delete "RD" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | TandADaily11 |
    And Create Holiday Schedule "CKHoliday"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Utrayan     | False        |
    And Create NetWork Hours Policy "TandADaily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | true            |                       | true                  | 15:00                | 21:00              | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays    |
      |          00800 |        01600 |     00000 | OT1        |   1.00 | Priority Work Component | Mo,Tu,We,Th,Fr    |
      |          00000 |        00600 |     00000 | OT2        |   1.00 | Special Time Range      | PH,WO/PH,WO,FB,RD |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | CK      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "CK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | CK      |               7 |
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
      | 13/01/2024 | 07:00    | 20:00    | 05:00              | 05:00               |
      | 14/01/2024 | 07:00    | 20:00    | 05:00              | 05:00               |
      | 15/01/2024 | 07:00    | 20:00    | 05:00              | 05:00               |
      | 16/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 17/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 18/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 19/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 20/01/2024 | 07:00    | 20:00    | 05:00              | 05:00               |
      | 21/01/2024 | 07:00    | 20:00    | 05:00              | 05:00               |
      | 22/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 23/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 24/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |

  ########################################################
  ###################### N-Punch User ######################
  ##########################################################
  ######### Priority Work Component#######################
  @OTDaily2_23
  Scenario: N punch user - Priority Work Component check for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
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
      |    0 | 07:00    | 18:00    | 07:30              | 07:30               |
      |   -1 | 07:00    | 20:00    | 11:00              | 11:00               |
      |   -2 | 09:00    | 20:00    | 07:30              | 07:30               |

  @OTDaily2_24
  Scenario: N punch user - Check network hours range From and to in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00801 |        01200 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
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
      |    0 | 09:00    | 18:00    |                    |                     |
      |   -1 | 08:00    | 18:00    | 00:59              | 00:59               |
      |   -2 | 08:00    | 19:00    | 01:59              | 01:59               |
      |   -3 | 08:00    | 19:00    | 02:59              | 02:59               |
      |   -4 | 07:00    | 18:00    |                    |                     |
      |   -5 | 09:00    | 18:00    |                    |                     |
      |   -6 | 09:00    | 18:00    |                    |                     |
      |   -7 | 09:00    | 18:00    |                    |                     |
      |   -8 | 07:00    | 20:00    |                    |                     |
      |   -9 | 07:00    | 20:00    |                    |                     |
      |  -10 | 07:00    | 20:00    | 03:58              | 03:58               |

  @OTDaily2_25
  Scenario: N punch user - Check MinDurReq then generated OT in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00800 |        01200 |     00100 | OT1        |   1.00 | Priority Work Component | Check All      |
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
      | TandADaily11 |         -1 |     080100 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     080000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -3 |     080000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180100 |
      | TandADaily11 |         -4 |     070000 |
      | TandADaily11 |         -4 |     084000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     113000 |
      | TandADaily11 |         -4 |     120000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     142000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -4 |     181715 |
      | TandADaily11 |         -4 |     200000 |
      | TandADaily11 |         -5 |     083100 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     183000 |
      | TandADaily11 |         -6 |     083000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     183000 |
      | TandADaily11 |         -7 |     083000 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     183100 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-7" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:01    | 18:00    |                    |                     |
      |   -2 | 08:00    | 18:00    | 01:00              | 01:00               |
      |   -3 | 08:00    | 18:01    | 01:01              | 01:01               |
      |   -4 | 07:00    | 20:00    | 03:33              | 03:33               |
      |   -5 | 08:31    | 18:30    |                    |                     |
      |   -6 | 08:30    | 18:30    | 01:00              | 01:00               |
      |   -7 | 08:30    | 18:31    | 01:01              | 01:01               |

  @OTDaily2_26
  Scenario: N punch user - Check Factor in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00800 |        01200 |     00100 | OT1        |   1.50 | Priority Work Component | Check All      |
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
      | TandADaily11 |         -1 |     080100 |
      | TandADaily11 |         -1 |     130000 |
      | TandADaily11 |         -1 |     140000 |
      | TandADaily11 |         -1 |     180000 |
      | TandADaily11 |         -2 |     080000 |
      | TandADaily11 |         -2 |     130000 |
      | TandADaily11 |         -2 |     140000 |
      | TandADaily11 |         -2 |     180000 |
      | TandADaily11 |         -3 |     080000 |
      | TandADaily11 |         -3 |     130000 |
      | TandADaily11 |         -3 |     140000 |
      | TandADaily11 |         -3 |     180100 |
      | TandADaily11 |         -4 |     070000 |
      | TandADaily11 |         -4 |     084000 |
      | TandADaily11 |         -4 |     090000 |
      | TandADaily11 |         -4 |     113000 |
      | TandADaily11 |         -4 |     120000 |
      | TandADaily11 |         -4 |     140000 |
      | TandADaily11 |         -4 |     142000 |
      | TandADaily11 |         -4 |     180000 |
      | TandADaily11 |         -4 |     181715 |
      | TandADaily11 |         -4 |     200000 |
      | TandADaily11 |         -5 |     083100 |
      | TandADaily11 |         -5 |     130000 |
      | TandADaily11 |         -5 |     140000 |
      | TandADaily11 |         -5 |     183000 |
      | TandADaily11 |         -6 |     083000 |
      | TandADaily11 |         -6 |     130000 |
      | TandADaily11 |         -6 |     140000 |
      | TandADaily11 |         -6 |     183000 |
      | TandADaily11 |         -7 |     083000 |
      | TandADaily11 |         -7 |     130000 |
      | TandADaily11 |         -7 |     140000 |
      | TandADaily11 |         -7 |     183100 |
    Then Daily Attendance View for userid "TandADaily11" and period "Date" on "-7" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:01    | 18:00    |                    |                     |
      |   -2 | 08:00    | 18:00    | 01:30              | 01:30               |
      |   -3 | 08:00    | 18:01    | 01:32              | 01:32               |
      |   -4 | 07:00    | 20:00    | 05:20              | 05:20               |
      |   -5 | 08:31    | 18:30    |                    |                     |
      |   -6 | 08:30    | 18:30    | 01:30              | 01:30               |
      |   -7 | 08:30    | 18:31    | 01:32              | 01:32               |

  @OTDaily2_27
  Scenario: N punch user - Check multiple configuration in Priority Work Component for all applicable days
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 |Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | TandADaily11 | TandADaily11   | True              | True               | True      | All     | true           | Daily 2    | True            |                       | Saved Successfully |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "TandADaily11"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        00400 |     00200 | OT1        |   1.00 | Priority Work Component | Check All      |
      |          00800 |        01000 |     00100 | OT2        |   1.50 | Priority Work Component | Check All      |
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
      |    0 | 09:00    | 18:00    | 04:00              | 04:00               |
      |   -1 | 08:00    | 18:00    | 05:30              | 05:30               |
      |   -2 | 08:00    | 19:00    | 07:00              | 07:00               |
      |   -3 | 08:00    | 19:00    | 07:00              | 07:00               |
      |   -4 | 07:00    | 18:00    | 04:00              | 04:00               |
      |   -5 | 09:00    | 18:00    | 04:00              | 04:00               |
      |   -6 | 09:00    | 18:00    | 04:00              | 04:00               |
      |   -7 | 09:00    | 18:00    | 03:59              | 03:59               |
      |   -8 | 07:00    | 20:00    | 04:00              | 04:00               |
      |   -9 | 07:00    | 20:00    | 04:00              | 04:00               |
      |  -10 | 07:00    | 20:00    | 07:00              | 07:00               |

      