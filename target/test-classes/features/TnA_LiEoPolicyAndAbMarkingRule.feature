@tag
Feature: Time & Attendance cases by Mayank
  I want to use this template for my feature file

  @TnA_1
  Scenario: LateIn - 4 punch - Grace time 0 and LateIn applicable Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | False            |           |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     091000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     181000 |
      | LiEoCheck |         -2 |     093500 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     183500 |
      | LiEoCheck |         -1 |     101000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     191000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -3 | 09:10    | 18:10    | PR       | PR       |         |        |
      |   -2 | 09:35    | 18:35    | PR       | PR       |         |        |
      |   -1 | 10:10    | 19:10    | PR       | PR       |         |        |

  @TnA_2
  Scenario: LateIn - 4 punch - Grace time 0 and LateIn applicable Enable with 0 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |         0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     090100 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     180100 |
      | LiEoCheck |         -2 |     093500 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     183500 |
      | LiEoCheck |         -1 |     101000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     191000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -3 | 09:01    | 18:01    | AB       | PR       |         | AB:Late-IN |
      |   -2 | 09:35    | 18:35    | AB       | PR       |         | AB:Late-IN |
      |   -1 | 10:10    | 19:10    | AB       | PR       |         | AB:Late-IN |

  @TnA_3
  Scenario: LateIn - 4 punch - Grace time 0 and LateIn applicable Enable with 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     091100 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     181100 |
      | LiEoCheck |         -2 |     091000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     181000 |
      | LiEoCheck |         -1 |     090900 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     180900 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -3 | 09:11    | 18:11    | AB       | PR       |         | AB:Late-IN |
      |   -2 | 09:10    | 18:10    | PR       | PR       | 00:10   |            |
      |   -1 | 09:09    | 18:09    | PR       | PR       | 00:09   |            |

  @TnA_4
  Scenario: LateIn - 4 punch - Grace time 10, Overlap Disable, Include In Work Hours Disable and LateIn applicable Enable with 0 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | False              |                    10 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |         0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     091100 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     181100 |
      | LiEoCheck |         -2 |     090900 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     180900 |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     181000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -3 | 09:11    | 18:11    | AB       | PR       |         | AB:Late-IN |
      |   -2 | 09:09    | 18:09    | PR       | PR       |         |            |
      |   -1 | 09:10    | 18:10    | PR       | PR       |         |            |

  @TnA_5
  Scenario: LateIn - 4 punch - Grace time 10, Overlap Disable, Include In Work Hours Enable and LateIn applicable Enable with 0 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | True               |                    10 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |         0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     091100 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     181100 |
      | LiEoCheck |         -2 |     090900 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     180900 |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     181000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -3 | 09:11    | 18:11    | AB       | PR       |         | AB:Late-IN |
      |   -2 | 09:09    | 18:09    | PR       | PR       |         |            |
      |   -1 | 09:10    | 18:10    | PR       | PR       |         |            |

  @TnA_6
  Scenario: LateIn - 4 punch - Grace time 10, Overlap Disable, Include In Work Hours Disable and LateIn applicable Enable with 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | False              |                    10 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -5 |     092100 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     182100 |
      | LiEoCheck |         -4 |     092000 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     182000 |
      | LiEoCheck |         -3 |     091100 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     181100 |
      | LiEoCheck |         -2 |     090900 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     180900 |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     181000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -5 | 09:21    | 18:21    | AB       | PR       |         | AB:Late-IN |
      |   -4 | 09:20    | 18:20    | PR       | PR       | 00:10   |            |
      |   -3 | 09:11    | 18:11    | PR       | PR       | 00:01   |            |
      |   -2 | 09:09    | 18:09    | PR       | PR       |         |            |
      |   -1 | 09:10    | 18:10    | PR       | PR       |         |            |

  @TnA_7
  Scenario: LateIn - 4 punch - Grace time 10, Overlap Enable, Include In Work Hours Disable and LateIn applicable Enable with 30 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                     |                   |                   | False              |                    10 | True               |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -4 |     093500 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     183500 |
      | LiEoCheck |         -3 |     093000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -2 |     091500 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     181500 |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     181000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-4" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -4 | 09:35    | 18:35    | AB       | PR       |         | AB:Late-IN |
      |   -3 | 09:30    | 18:30    | PR       | PR       | 00:30   |            |
      |   -2 | 09:15    | 18:15    | PR       | PR       | 00:15   |            |
      |   -1 | 09:10    | 18:10    | PR       | PR       |         |            |

  @TnA_8
  Scenario: LateIn - 4 punch - LI Grace time 0 and LI Enable 10 min - BreakLI Grace 0 - Add BreakLI in total LI Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141000 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091100 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141000 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141100 |
      | LiEoCheck |         -3 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark           |
      |   -1 | 09:10    | 18:30    | PR       | PR       | 00:10   |                  |
      |   -2 | 09:11    | 18:30    | AB       | PR       |         | AB:Late-IN       |
      |   -3 | 09:10    | 18:30    | PR       | AB       | 00:10   | AB:Break Late-IN |

  @TnA_9
  Scenario: LateIn - 4 punch - LI Grace time 0 and LI Enable 10 min - BreakLI Grace 0 - Add BreakLI in total LI Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141000 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     090600 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140500 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     090400 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140400 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     090500 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     140500 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     090000 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     141100 |
      | LiEoCheck |         -5 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -1 | 09:10    | 18:30    | AB       | PR       |         | AB:Late-IN |
      |   -2 | 09:06    | 18:30    | AB       | PR       |         | AB:Late-IN |
      |   -3 | 09:04    | 18:30    | PR       | PR       | 00:08   |            |
      |   -4 | 09:05    | 18:30    | PR       | PR       | 00:10   |            |
      |   -5 | 09:00    | 18:30    | AB       | PR       |         | AB:Late-IN |

  @TnA_10
  Scenario: LateIn - 4 punch - LI Grace time 5, Overlap Disable and LI Enable 10 min - BreakLI Grace 0 - Add BreakLI in total LI Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090400 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141100 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141100 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091600 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141100 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     091600 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141000 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     091000 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     141000 |
      | LiEoCheck |         -5 |     183000 |
      | LiEoCheck |         -6 |     091500 |
      | LiEoCheck |         -6 |     130000 |
      | LiEoCheck |         -6 |     141000 |
      | LiEoCheck |         -6 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-6" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark           |
      |   -1 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -2 | 09:10    | 18:30    | PR       | AB       | 00:05   | AB:Break Late-IN |
      |   -3 | 09:16    | 18:30    | AB       | AB       |         | AB:Break Late-IN |
      |   -4 | 09:16    | 18:30    | AB       | PR       |         | AB:Late-IN       |
      |   -5 | 09:10    | 18:30    | PR       | PR       | 00:05   |                  |
      |   -6 | 09:15    | 18:30    | PR       | PR       | 00:10   |                  |

  @TnA_11
  Scenario: LateIn - 4 punch - LI Grace time 5, Overlap Enable and LI Enable 10 min - BreakLI Grace 0 - Add BreakLI in total LI Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | True               |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090400 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141100 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141100 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091600 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141000 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     090400 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141000 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     091000 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     141000 |
      | LiEoCheck |         -5 |     183000 |
      | LiEoCheck |         -6 |     091500 |
      | LiEoCheck |         -6 |     130000 |
      | LiEoCheck |         -6 |     141000 |
      | LiEoCheck |         -6 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-6" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark           |
      |   -1 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -2 | 09:10    | 18:30    | PR       | AB       | 00:10   | AB:Break Late-IN |
      |   -3 | 09:16    | 18:30    | AB       | PR       |         | AB:Late-IN       |
      |   -4 | 09:04    | 18:30    | PR       | PR       |         |                  |
      |   -5 | 09:10    | 18:30    | PR       | PR       | 00:10   |                  |
      |   -6 | 09:15    | 18:30    | AB       | PR       |         | AB:Late-IN       |

  @TnA_12
  Scenario: LateIn - 4 punch - LI Grace time 5, Overlap Disable and LI Enable 10 min - BreakLI Grace 5, Overlap Disable - Add BreakLI in total LI Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | False              |                       0 | False                |                   5 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090400 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141100 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141600 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091600 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141000 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     090400 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141600 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     091000 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     141000 |
      | LiEoCheck |         -5 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark           |
      |   -1 | 09:04    | 18:30    | PR       | PR       |         |                  |
      |   -2 | 09:10    | 18:30    | PR       | AB       | 00:05   | AB:Break Late-IN |
      |   -3 | 09:16    | 18:30    | AB       | PR       |         | AB:Late-IN       |
      |   -4 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -5 | 09:10    | 18:30    | PR       | PR       | 00:05   |                  |

  @TnA_13
  Scenario: LateIn - 4 punch - LI Grace time 5, Overlap Disable and LI Enable 10 min - BreakLI Grace 5, Overlap Enable - Add BreakLI in total LI Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | False              |                       0 | False                |                   5 | True             |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090400 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141100 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141600 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091600 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141000 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     090400 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141600 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     091000 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     141000 |
      | LiEoCheck |         -5 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark           |
      |   -1 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -2 | 09:10    | 18:30    | PR       | AB       | 00:05   | AB:Break Late-IN |
      |   -3 | 09:16    | 18:30    | AB       | PR       |         | AB:Late-IN       |
      |   -4 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -5 | 09:10    | 18:30    | PR       | PR       | 00:05   |                  |

  @TnA_14
  Scenario: LateIn - 4 punch - LI Grace time 5, Overlap Enable and LI Enable 10 min - BreakLI Grace 5, Overlap Enable - Add BreakLI in total LI Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | True               |                       0 | False                |                   5 | True             |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090400 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141100 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141600 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091600 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141000 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     090400 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141600 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     091000 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     141000 |
      | LiEoCheck |         -5 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark           |
      |   -1 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -2 | 09:10    | 18:30    | PR       | AB       | 00:10   | AB:Break Late-IN |
      |   -3 | 09:16    | 18:30    | AB       | PR       |         | AB:Late-IN       |
      |   -4 | 09:04    | 18:30    | PR       | AB       |         | AB:Break Late-IN |
      |   -5 | 09:10    | 18:30    | PR       | PR       | 00:10   |                  |

  @TnA_15
  Scenario: LateIn - 4 punch - LI Grace time 5, Overlap Disable and LI Enable 10 min - BreakLI Grace 5, Overlap Disable - Add BreakLI in total LI Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              |                   | False              |                     5 | False              |                       0 | False                |                   5 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     091100 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141000 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     090400 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141600 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140900 |
      | LiEoCheck |         -3 |     183000 |
      | LiEoCheck |         -4 |     090400 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141400 |
      | LiEoCheck |         -4 |     183000 |
      | LiEoCheck |         -5 |     091600 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     140200 |
      | LiEoCheck |         -5 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -1 | 09:11    | 18:30    | AB       | PR       |         | AB:Late-IN |
      |   -2 | 09:04    | 18:30    | AB       | PR       |         | AB:Late-IN |
      |   -3 | 09:10    | 18:30    | PR       | PR       | 00:09   |            |
      |   -4 | 09:04    | 18:30    | PR       | PR       | 00:09   |            |
      |   -5 | 09:16    | 18:30    | AB       | PR       |         | AB:Late-IN |

  @TnA_16
  Scenario: LateIn - N punch - LI Grace time 0 and LI Enable 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141500 |
      | LiEoCheck |         -1 |     150000 |
      | LiEoCheck |         -1 |     153000 |
      | LiEoCheck |         -1 |     190000 |
      | LiEoCheck |         -2 |     090100 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141500 |
      | LiEoCheck |         -2 |     150000 |
      | LiEoCheck |         -2 |     153000 |
      | LiEoCheck |         -2 |     190000 |
      | LiEoCheck |         -3 |     091000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141500 |
      | LiEoCheck |         -3 |     150000 |
      | LiEoCheck |         -3 |     153000 |
      | LiEoCheck |         -3 |     190000 |
      | LiEoCheck |         -4 |     091100 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141500 |
      | LiEoCheck |         -4 |     150000 |
      | LiEoCheck |         -4 |     153000 |
      | LiEoCheck |         -4 |     190000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -1 | 09:00    | 19:00    | PR       | PR       |         |            |
      |   -2 | 09:01    | 19:00    | PR       | PR       | 00:01   |            |
      |   -3 | 09:10    | 19:00    | PR       | PR       | 00:10   |            |
      |   -4 | 09:11    | 19:00    | AB       | PR       |         | AB:Late-IN |

  @TnA_17
  Scenario: LateIn - N punch - LI Grace time 5, Overlap Disable and LI Enable 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090000 |
      | LiEoCheck |         -1 |     110000 |
      | LiEoCheck |         -1 |     121500 |
      | LiEoCheck |         -1 |     160000 |
      | LiEoCheck |         -1 |     163000 |
      | LiEoCheck |         -1 |     190000 |
      | LiEoCheck |         -2 |     090500 |
      | LiEoCheck |         -2 |     110000 |
      | LiEoCheck |         -2 |     121500 |
      | LiEoCheck |         -2 |     160000 |
      | LiEoCheck |         -2 |     163000 |
      | LiEoCheck |         -2 |     190000 |
      | LiEoCheck |         -3 |     090600 |
      | LiEoCheck |         -3 |     110000 |
      | LiEoCheck |         -3 |     121500 |
      | LiEoCheck |         -3 |     160000 |
      | LiEoCheck |         -3 |     163000 |
      | LiEoCheck |         -3 |     190000 |
      | LiEoCheck |         -4 |     091500 |
      | LiEoCheck |         -4 |     110000 |
      | LiEoCheck |         -4 |     121500 |
      | LiEoCheck |         -4 |     160000 |
      | LiEoCheck |         -4 |     163000 |
      | LiEoCheck |         -4 |     190000 |
      | LiEoCheck |         -5 |     091600 |
      | LiEoCheck |         -5 |     110000 |
      | LiEoCheck |         -5 |     121500 |
      | LiEoCheck |         -5 |     160000 |
      | LiEoCheck |         -5 |     163000 |
      | LiEoCheck |         -5 |     190000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -1 | 09:00    | 19:00    | PR       | PR       |         |            |
      |   -2 | 09:05    | 19:00    | PR       | PR       |         |            |
      |   -3 | 09:06    | 19:00    | PR       | PR       | 00:01   |            |
      |   -4 | 09:15    | 19:00    | PR       | PR       | 00:10   |            |
      |   -5 | 09:16    | 19:00    | AB       | PR       |         | AB:Late-IN |

  @TnA_18
  Scenario: LateIn - N punch - LI Grace time 5, Overlap Enable and LI Enable 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     5 | True               |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090000 |
      | LiEoCheck |         -1 |     110000 |
      | LiEoCheck |         -1 |     121500 |
      | LiEoCheck |         -1 |     160000 |
      | LiEoCheck |         -1 |     163000 |
      | LiEoCheck |         -1 |     190000 |
      | LiEoCheck |         -2 |     090500 |
      | LiEoCheck |         -2 |     110000 |
      | LiEoCheck |         -2 |     121500 |
      | LiEoCheck |         -2 |     160000 |
      | LiEoCheck |         -2 |     163000 |
      | LiEoCheck |         -2 |     190000 |
      | LiEoCheck |         -3 |     090600 |
      | LiEoCheck |         -3 |     110000 |
      | LiEoCheck |         -3 |     121500 |
      | LiEoCheck |         -3 |     160000 |
      | LiEoCheck |         -3 |     163000 |
      | LiEoCheck |         -3 |     190000 |
      | LiEoCheck |         -4 |     091500 |
      | LiEoCheck |         -4 |     110000 |
      | LiEoCheck |         -4 |     121500 |
      | LiEoCheck |         -4 |     160000 |
      | LiEoCheck |         -4 |     163000 |
      | LiEoCheck |         -4 |     190000 |
      | LiEoCheck |         -5 |     091600 |
      | LiEoCheck |         -5 |     110000 |
      | LiEoCheck |         -5 |     121500 |
      | LiEoCheck |         -5 |     160000 |
      | LiEoCheck |         -5 |     163000 |
      | LiEoCheck |         -5 |     190000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -1 | 09:00    | 19:00    | PR       | PR       |         |            |
      |   -2 | 09:05    | 19:00    | PR       | PR       |         |            |
      |   -3 | 09:06    | 19:00    | PR       | PR       | 00:06   |            |
      |   -4 | 09:15    | 19:00    | AB       | PR       |         | AB:Late-IN |
      |   -5 | 09:16    | 19:00    | AB       | PR       |         | AB:Late-IN |

  @TnA_19
  Scenario: LateIn - 4 punch - LI Grace time 0, Overlap Disable and LI Enable 30 min with Enable Rounding For Fraction Of An Hour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of LateIn Policy "LiEoCheck"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      15 | Actual          |              |
      |        16 |      30 | Fixed           |           30 |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     090500 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     183000 |
      | LiEoCheck |         -2 |     091400 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     183000 |
      | LiEoCheck |         -3 |     091600 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     183000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -1 | 09:05    | 18:30    | PR       | PR       | 00:05   |        |
      |   -2 | 09:14    | 18:30    | PR       | PR       | 00:14   |        |
      |   -3 | 09:16    | 18:30    | PR       | PR       | 00:30   |        |

  @TnA_20
  Scenario: LateIn - 4 punch - LI Grace time 0, Overlap Disable, BLI Grace 0, Overlap Disable, Add BreakLI in total LI Disable and LI Enable 30 min with Enable Rounding For Fraction Of An Hour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of LateIn Policy "LiEoCheck"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      15 | Actual          |              |
      |        16 |      30 | Fixed           |           30 |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141000 |
      | LiEoCheck |         -1 |     190000 |
      | LiEoCheck |         -2 |     091600 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141500 |
      | LiEoCheck |         -2 |     190000 |
      | LiEoCheck |         -3 |     091000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141600 |
      | LiEoCheck |         -3 |     190000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -1 | 09:10    | 19:00    | PR       | PR       | 00:10   |        |
      |   -2 | 09:16    | 19:00    | PR       | PR       | 00:30   |        |
      |   -3 | 09:10    | 19:00    | PR       | PR       | 00:10   |        |

  @TnA_21
  Scenario: LateIn - 4 punch - LI Grace time 0, Overlap Disable, BLI Grace 0, Overlap Disable, Add BreakLI in total LI Enable and LI Enable 30 min with Enable Rounding For Fraction Of An Hour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of LateIn Policy "LiEoCheck"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      15 | Actual          |              |
      |        16 |      30 | Fixed           |           30 |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     091000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141000 |
      | LiEoCheck |         -1 |     190000 |
      | LiEoCheck |         -2 |     092000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140600 |
      | LiEoCheck |         -2 |     190000 |
      | LiEoCheck |         -3 |     091000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140600 |
      | LiEoCheck |         -3 |     190000 |
      | LiEoCheck |         -4 |     090000 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     142000 |
      | LiEoCheck |         -4 |     190000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-4" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      |   -1 | 09:10    | 19:00    | PR       | PR       | 00:20   |            |
      |   -2 | 09:20    | 19:00    | AB       | PR       |         | AB:Late-IN |
      |   -3 | 09:10    | 19:00    | PR       | PR       | 00:16   |            |
      |   -4 | 09:00    | 19:00    | PR       | PR       | 00:30   |            |

  @TnA_22
  Scenario: EarlyOut - 4 punch - Grace time 0 and EarlyOut applicable Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | False              |             |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     085000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175000 |
      | LiEoCheck |         -2 |     082500 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     172500 |
      | LiEoCheck |         -1 |     075000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     165000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -3 | 08:50    | 17:50    | PR       | PR       |           |        |
      |   -2 | 08:25    | 17:25    | PR       | PR       |           |        |
      |   -1 | 07:50    | 16:50    | PR       | PR       |           |        |

  @TnA_23
  Scenario: EarlyOut - 4 punch - Grace time 0 and EarlyOut applicable Enable with 0 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     085900 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175900 |
      | LiEoCheck |         -2 |     082500 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     172500 |
      | LiEoCheck |         -1 |     075000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     165000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -3 | 08:59    | 17:59    | PR       | AB       |           | AB:Early-OUT |
      |   -2 | 08:25    | 17:25    | PR       | AB       |           | AB:Early-OUT |
      |   -1 | 07:50    | 16:50    | PR       | AB       |           | AB:Early-OUT |

  @TnA_24
  Scenario: EarlyOut - 4 punch - Grace time 0 and EarlyOut applicable Enable with 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     084900 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174900 |
      | LiEoCheck |         -2 |     085000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175000 |
      | LiEoCheck |         -1 |     085100 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175100 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -3 | 08:49    | 17:49    | PR       | AB       |           | AB:Early-OUT |
      |   -2 | 08:50    | 17:50    | PR       | PR       | 00:10     |              |
      |   -1 | 08:51    | 17:51    | PR       | PR       | 00:09     |              |

  @TnA_25
  Scenario: EarlyOut - 4 punch - Grace time 10, Overlap Disable, Include In Work Hours Disable and EarlyOut applicable Enable with 0 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                      10 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     084900 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174900 |
      | LiEoCheck |         -2 |     085100 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175100 |
      | LiEoCheck |         -1 |     085000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -3 | 08:49    | 17:49    | PR       | AB       |           | AB:Early-OUT |
      |   -2 | 08:51    | 17:51    | PR       | PR       |           |              |
      |   -1 | 08:50    | 17:50    | PR       | PR       |           |              |

  @TnA_26
  Scenario: EarlyOut - 4 punch - Grace time 10, Overlap Disable, Include In Work Hours Enable and EarlyOut applicable Enable with 0 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | True               |                     0 | False              |                      10 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -3 |     084900 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174900 |
      | LiEoCheck |         -2 |     085100 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175100 |
      | LiEoCheck |         -1 |     085000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -3 | 08:49    | 17:49    | PR       | AB       |           | AB:Early-OUT |
      |   -2 | 08:51    | 17:51    | PR       | PR       |           |              |
      |   -1 | 08:50    | 17:50    | PR       | PR       |           |              |

  @TnA_27
  Scenario: EarlyOut - 4 punch - Grace time 10, Overlap Disable, Include In Work Hours Disable and EarlyOut applicable Enable with 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                      10 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -5 |     083900 |
      | LiEoCheck |         -5 |     130000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     173900 |
      | LiEoCheck |         -4 |     084000 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     174000 |
      | LiEoCheck |         -3 |     084900 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174900 |
      | LiEoCheck |         -2 |     085100 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175100 |
      | LiEoCheck |         -1 |     085000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -5 | 08:39    | 17:39    | PR       | AB       |           | AB:Early-OUT |
      |   -4 | 08:40    | 17:40    | PR       | PR       | 00:10     |              |
      |   -3 | 08:49    | 17:49    | PR       | PR       | 00:01     |              |
      |   -2 | 08:51    | 17:51    | PR       | PR       |           |              |
      |   -1 | 08:50    | 17:50    | PR       | PR       |           |              |

  @TnA_28
  Scenario: EarlyOut - 4 punch - Grace time 10, Overlap Enable, Include In Work Hours Disable and EarlyOut applicable Enable with 30 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | True               |                     0 | False              |                      10 | True                 |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -4 |     082500 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     172500 |
      | LiEoCheck |         -3 |     083000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     173000 |
      | LiEoCheck |         -2 |     084500 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     174500 |
      | LiEoCheck |         -1 |     085000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-4" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -4 | 08:25    | 17:25    | PR       | AB       |           | AB:Early-OUT |
      |   -3 | 08:30    | 17:30    | PR       | PR       | 00:30     |              |
      |   -2 | 08:45    | 17:45    | PR       | PR       | 00:15     |              |
      |   -1 | 08:50    | 17:50    | PR       | PR       |           |              |

  @TnA_29
  Scenario: EarlyOut - 4 punch - EO Grace time 0 and EO Enable 10 min - BreakEO Grace 0 - Add BreakEO in total EO Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     125000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     125000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     174900 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     124900 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark             |
      |   -1 | 08:00    | 17:50    | PR       | PR       | 00:10     |                    |
      |   -2 | 08:00    | 17:49    | PR       | AB       |           | AB:Early-OUT       |
      |   -3 | 08:00    | 17:50    | AB       | PR       | 00:10     | AB:Break Early-OUT |

  @TnA_30
  Scenario: EarlyOut - 4 punch - EO Grace time 0 and EO Enable 10 min - BreakEO Grace 0 - Add BreakEO in total EO Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     125000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     125500 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175400 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125600 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175600 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     125500 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     175500 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     124900 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     180000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -1 | 08:00    | 17:50    | PR       | AB       |           | AB:Early-OUT |
      |   -2 | 08:00    | 17:54    | PR       | AB       |           | AB:Early-OUT |
      |   -3 | 08:00    | 17:56    | PR       | PR       | 00:08     |              |
      |   -4 | 08:00    | 17:55    | PR       | PR       | 00:10     |              |
      |   -5 | 08:00    | 18:00    | PR       | AB       |           | AB:Early-OUT |

  @TnA_31
  Scenario: EarlyOut - 4 punch - EO Grace time 5, Overlap Disable and EO Enable 10 min - BreakEO Grace 0 - Add BreakEO in total EO Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     124900 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175600 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124900 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175000 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     124900 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     125000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     174400 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     125000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     175000 |
      | LiEoCheck |         -6 |     080000 |
      | LiEoCheck |         -6 |     125000 |
      | LiEoCheck |         -6 |     140000 |
      | LiEoCheck |         -6 |     174500 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-6" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark             |
      |   -1 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -2 | 08:00    | 17:50    | AB       | PR       | 00:05     | AB:Break Early-OUT |
      |   -3 | 08:00    | 17:44    | AB       | AB       |           | AB:Break Early-OUT |
      |   -4 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT       |
      |   -5 | 08:00    | 17:50    | PR       | PR       | 00:05     |                    |
      |   -6 | 08:00    | 17:45    | PR       | PR       | 00:10     |                    |

  @TnA_32
  Scenario: EarlyOut - 4 punch - EO Grace time 5, Overlap Enable and EO Enable 10 min - BreakEO Grace 0 - Add BreakEO in total EO Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | True                 |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     124900 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175600 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124900 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175000 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     125000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     175600 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     125000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     175000 |
      | LiEoCheck |         -6 |     080000 |
      | LiEoCheck |         -6 |     125000 |
      | LiEoCheck |         -6 |     140000 |
      | LiEoCheck |         -6 |     174500 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-6" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark             |
      |   -1 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -2 | 08:00    | 17:50    | AB       | PR       | 00:10     | AB:Break Early-OUT |
      |   -3 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT       |
      |   -4 | 08:00    | 17:56    | PR       | PR       |           |                    |
      |   -5 | 08:00    | 17:50    | PR       | PR       | 00:10     |                    |
      |   -6 | 08:00    | 17:45    | PR       | AB       |           | AB:Early-OUT       |

  @TnA_33
  Scenario: EarlyOut - 4 punch - EO Grace time 5, Overlap Disable and EO Enable 10 min - BreakEO Grace 5, Overlap Disable - Add BreakEO in total EO Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | False                |                   0 | False            |                     5 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     124900 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175600 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124400 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175000 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     124400 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     175600 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     125000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark             |
      |   -1 | 08:00    | 17:56    | PR       | PR       |           |                    |
      |   -2 | 08:00    | 17:50    | AB       | PR       | 00:05     | AB:Break Early-OUT |
      |   -3 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT       |
      |   -4 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -5 | 08:00    | 17:50    | PR       | PR       | 00:05     |                    |

  @TnA_34
  Scenario: EarlyOut - 4 punch - EO Grace time 5, Overlap Disable and EO Enable 10 min - BreakEO Grace 5, Overlap Enable - Add BreakEO in total EO Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | False                |                   0 | False            |                     5 | True               | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     124900 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175600 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124400 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175000 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     124400 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     175600 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     125000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark             |
      |   -1 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -2 | 08:00    | 17:50    | AB       | PR       | 00:05     | AB:Break Early-OUT |
      |   -3 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT       |
      |   -4 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -5 | 08:00    | 17:50    | PR       | PR       | 00:05     |                    |

  @TnA_35
  Scenario: EarlyOut - 4 punch - EO Grace time 5, Overlap Enable and EO Enable 10 min - BreakEO Grace 5, Overlap Enable - Add BreakEO in total EO Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | True                 |                   0 | False            |                     5 | True               | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     124900 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175600 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124400 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175000 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     124400 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     175600 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     125000 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark             |
      |   -1 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -2 | 08:00    | 17:50    | AB       | PR       | 00:10     | AB:Break Early-OUT |
      |   -3 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT       |
      |   -4 | 08:00    | 17:56    | AB       | PR       |           | AB:Break Early-OUT |
      |   -5 | 08:00    | 17:50    | PR       | PR       | 00:10     |                    |

  @TnA_36
  Scenario: EarlyOut - 4 punch - EO Grace time 5, Overlap Disable and EO Enable 10 min - BreakEO Grace 5, Overlap Disable - Add BreakEO in total EO Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | True              | False              |                     0 | False              |                       5 | False                |                   0 | False            |                     5 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     125000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     174900 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124400 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     175600 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125100 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175000 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     124600 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     175600 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     125800 |
      | LiEoCheck |         -5 |     140000 |
      | LiEoCheck |         -5 |     174400 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -1 | 08:00    | 17:49    | PR       | AB       |           | AB:Early-OUT |
      |   -2 | 08:00    | 17:56    | PR       | AB       |           | AB:Early-OUT |
      |   -3 | 08:00    | 17:50    | PR       | PR       | 00:09     |              |
      |   -4 | 08:00    | 17:56    | PR       | PR       | 00:09     |              |
      |   -5 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT |

  @TnA_37
  Scenario: EarlyOut - N punch - EO Grace time 0 and EO Enable 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     141500 |
      | LiEoCheck |         -1 |     150000 |
      | LiEoCheck |         -1 |     153000 |
      | LiEoCheck |         -1 |     180000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     141500 |
      | LiEoCheck |         -2 |     150000 |
      | LiEoCheck |         -2 |     153000 |
      | LiEoCheck |         -2 |     175900 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     141500 |
      | LiEoCheck |         -3 |     150000 |
      | LiEoCheck |         -3 |     153000 |
      | LiEoCheck |         -3 |     175000 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     130000 |
      | LiEoCheck |         -4 |     141500 |
      | LiEoCheck |         -4 |     150000 |
      | LiEoCheck |         -4 |     153000 |
      | LiEoCheck |         -4 |     174900 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -1 | 08:00    | 18:00    | PR       | PR       |           |              |
      |   -2 | 08:00    | 17:59    | PR       | PR       | 00:01     |              |
      |   -3 | 08:00    | 17:50    | PR       | PR       | 00:10     |              |
      |   -4 | 08:00    | 17:49    | PR       | AB       |           | AB:Early-OUT |

  @TnA_38
  Scenario: EarlyOut - N punch - EO Grace time 5, Overlap Disable and EO Enable 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     110000 |
      | LiEoCheck |         -1 |     121500 |
      | LiEoCheck |         -1 |     160000 |
      | LiEoCheck |         -1 |     163000 |
      | LiEoCheck |         -1 |     180000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     110000 |
      | LiEoCheck |         -2 |     121500 |
      | LiEoCheck |         -2 |     160000 |
      | LiEoCheck |         -2 |     163000 |
      | LiEoCheck |         -2 |     175500 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     110000 |
      | LiEoCheck |         -3 |     121500 |
      | LiEoCheck |         -3 |     160000 |
      | LiEoCheck |         -3 |     163000 |
      | LiEoCheck |         -3 |     175400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     110000 |
      | LiEoCheck |         -4 |     121500 |
      | LiEoCheck |         -4 |     160000 |
      | LiEoCheck |         -4 |     163000 |
      | LiEoCheck |         -4 |     174500 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     110000 |
      | LiEoCheck |         -5 |     121500 |
      | LiEoCheck |         -5 |     160000 |
      | LiEoCheck |         -5 |     163000 |
      | LiEoCheck |         -5 |     174400 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -1 | 08:00    | 18:00    | PR       | PR       |           |              |
      |   -2 | 08:00    | 17:55    | PR       | PR       |           |              |
      |   -3 | 08:00    | 17:54    | PR       | PR       | 00:01     |              |
      |   -4 | 08:00    | 17:45    | PR       | PR       | 00:10     |              |
      |   -5 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT |

  @TnA_39
  Scenario: EarlyOut - N punch - EO Grace time 5, Overlap Enable and EO Enable 10 min
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       5 | True                 |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          10 |                          | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     110000 |
      | LiEoCheck |         -1 |     121500 |
      | LiEoCheck |         -1 |     160000 |
      | LiEoCheck |         -1 |     163000 |
      | LiEoCheck |         -1 |     180000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     110000 |
      | LiEoCheck |         -2 |     121500 |
      | LiEoCheck |         -2 |     160000 |
      | LiEoCheck |         -2 |     163000 |
      | LiEoCheck |         -2 |     175500 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     110000 |
      | LiEoCheck |         -3 |     121500 |
      | LiEoCheck |         -3 |     160000 |
      | LiEoCheck |         -3 |     163000 |
      | LiEoCheck |         -3 |     175400 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     110000 |
      | LiEoCheck |         -4 |     121500 |
      | LiEoCheck |         -4 |     160000 |
      | LiEoCheck |         -4 |     163000 |
      | LiEoCheck |         -4 |     174500 |
      | LiEoCheck |         -5 |     080000 |
      | LiEoCheck |         -5 |     110000 |
      | LiEoCheck |         -5 |     121500 |
      | LiEoCheck |         -5 |     160000 |
      | LiEoCheck |         -5 |     163000 |
      | LiEoCheck |         -5 |     174400 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-5" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -1 | 08:00    | 18:00    | PR       | PR       |           |              |
      |   -2 | 08:00    | 17:55    | PR       | PR       |           |              |
      |   -3 | 08:00    | 17:54    | PR       | PR       | 00:06     |              |
      |   -4 | 08:00    | 17:45    | PR       | AB       |           | AB:Early-OUT |
      |   -5 | 08:00    | 17:44    | PR       | AB       |           | AB:Early-OUT |

  @TnA_40
  Scenario: EarlyOut - 4 punch - EO Grace time 0, Overlap Disable and EO Enable 30 min with Enable Rounding For Fraction Of An Hour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "LiEoCheck"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      15 | Actual          |              |
      |        16 |      30 | Fixed           |           30 |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     130000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175500 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     130000 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     174600 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     130000 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     174400 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -1 | 08:00    | 17:55    | PR       | PR       | 00:05     |        |
      |   -2 | 08:00    | 17:46    | PR       | PR       | 00:14     |        |
      |   -3 | 08:00    | 17:44    | PR       | PR       | 00:30     |        |

  @TnA_41
  Scenario: EarlyOut - 4 punch - EO Grace time 0, Overlap Disable, BEO Grace 0, Overlap Disable, Add BreakEO in total EO Disable and EO Enable 30 min with Enable Rounding For Fraction Of An Hour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "LiEoCheck"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      15 | Actual          |              |
      |        16 |      30 | Fixed           |           30 |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     125000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     124500 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     174400 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     124400 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-3" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -1 | 08:00    | 17:50    | PR       | PR       | 00:10     |        |
      |   -2 | 08:00    | 17:44    | PR       | PR       | 00:30     |        |
      |   -3 | 08:00    | 17:50    | PR       | PR       | 00:10     |        |

  @TnA_42
  Scenario: EarlyOut - 4 punch - EO Grace time 0, Overlap Disable, BEO Grace 0, Overlap Disable, Add BreakEO in total EO Enable and EO Enable 30 min with Enable Rounding For Fraction Of An Hour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               |                   | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "LiEoCheck"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      15 | Actual          |              |
      |        16 |      30 | Fixed           |           30 |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |         -1 |     080000 |
      | LiEoCheck |         -1 |     125000 |
      | LiEoCheck |         -1 |     140000 |
      | LiEoCheck |         -1 |     175000 |
      | LiEoCheck |         -2 |     080000 |
      | LiEoCheck |         -2 |     125400 |
      | LiEoCheck |         -2 |     140000 |
      | LiEoCheck |         -2 |     174000 |
      | LiEoCheck |         -3 |     080000 |
      | LiEoCheck |         -3 |     125400 |
      | LiEoCheck |         -3 |     140000 |
      | LiEoCheck |         -3 |     175000 |
      | LiEoCheck |         -4 |     080000 |
      | LiEoCheck |         -4 |     124000 |
      | LiEoCheck |         -4 |     140000 |
      | LiEoCheck |         -4 |     180000 |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "-4" and "-1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      |   -1 | 08:00    | 17:50    | PR       | PR       | 00:20     |              |
      |   -2 | 08:00    | 17:40    | PR       | AB       |           | AB:Early-OUT |
      |   -3 | 08:00    | 17:50    | PR       | PR       | 00:16     |              |
      |   -4 | 08:00    | 18:00    | PR       | PR       | 00:30     |              |

  @TnA_43
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 19:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   | 1st Half AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 19:00    | AB       | PR       | 00:05   | 1st Half AB:Late-IN Limit |

  @TnA_44
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 19:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   | Full Day AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 19:00    | AB       | AB       | 00:05   | Full Day AB:Late-IN Limit |

  @TnA_45
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     092500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 19:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   | 1st Half AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 19:00    | PR       | PR       | 00:05   |                           |
      | 06/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 07/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |                           |
      | 08/01/2024 | 09:05    | 19:00    | AB       | PR       | 00:05   | 1st Half AB:Late-IN Limit |

  @TnA_46
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     092500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 19:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   | Full Day AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 19:00    | PR       | PR       | 00:05   |                           |
      | 06/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 07/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |                           |
      | 08/01/2024 | 09:05    | 19:00    | AB       | AB       | 00:05   | Full Day AB:Late-IN Limit |

  @TnA_47
  Scenario: LateIn - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     093000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 04/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 06/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 07/01/2024 | 09:27    | 19:00    | PR       | PR       | 00:27   |                           |
      | 08/01/2024 | 09:01    | 19:00    | AB       | PR       | 00:01   | 1st Half AB:Late-IN Limit |

  @TnA_48
  Scenario: LateIn - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     093000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 04/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 06/01/2024 | 09:30    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 07/01/2024 | 09:27    | 19:00    | PR       | PR       | 00:27   |                           |
      | 08/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   | Full Day AB:Late-IN Limit |

  @TnA_49
  Scenario: LateIn - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     090100 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 04/01/2024 | 09:14    | 19:00    | PR       | PR       | 00:14   |                           |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 07/01/2024 | 09:01    | 19:00    | AB       | PR       | 00:01   | 1st Half AB:Late-IN Limit |

  @TnA_50
  Scenario: LateIn - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     090100 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 04/01/2024 | 09:14    | 19:00    | PR       | PR       | 00:14   |                           |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 07/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   | Full Day AB:Late-IN Limit |

  @TnA_51
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day - with BreakLI - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:15   |                           |
      | 03/01/2024 | 09:15    | 19:00    | PR       | AB       | 00:30   | 2nd Half AB:Late-IN Limit |
      | 04/01/2024 | 09:15    | 19:00    | AB       | PR       | 00:15   | 1st Half AB:Late-IN Limit |

  @TnA_52
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day - with BreakLI - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:15   |                           |
      | 03/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 04/01/2024 | 09:15    | 19:00    | AB       | PR       | 00:15   | 1st Half AB:Late-IN Limit |

  @TnA_53
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day - with BreakLI - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     091500 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     141500 |
      | LiEoCheck |   04012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:15    | 19:00    | AB       | AB       | 00:30   | 2nd Half AB:Late-IN Limit |
      | 04/01/2024 | 09:00    | 19:00    | AB       | PR       | 00:15   | 1st Half AB:Late-IN Limit |

  @TnA_54
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Full Day - with BreakLI - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:15   |                           |
      | 03/01/2024 | 09:15    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 04/01/2024 | 09:15    | 19:00    | AB       | AB       | 00:15   | Full Day AB:Late-IN Limit |

  @TnA_55
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Half Day - with BreakLI - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     091500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     141500 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     141500 |
      | LiEoCheck |   06012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:15   |                           |
      | 03/01/2024 | 09:15    | 19:00    | PR       | AB       | 00:30   | 2nd Half AB:Late-IN Limit |
      | 04/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 05/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:30   |                           |
      | 06/01/2024 | 09:15    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |

  @TnA_56
  Scenario: LateIn - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Full Day - with BreakLI - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     091500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     141500 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     141500 |
      | LiEoCheck |   06012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:15   |                           |
      | 03/01/2024 | 09:15    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 04/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 05/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:30   |                           |
      | 06/01/2024 | 09:15    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |

  @TnA_110
  Scenario: LateIn - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day - with BreakLI - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     091500 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140100 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     141500 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:01   |                           |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 06/01/2024 | 09:15    | 19:00    | PR       | AB       | 00:30   | 2nd Half AB:Late-IN Limit |
      | 07/01/2024 | 09:27    | 19:00    | PR       | PR       | 00:27   |                           |
      | 08/01/2024 | 09:01    | 19:00    | AB       | PR       | 00:01   | 1st Half AB:Late-IN Limit |

  @TnA_111
  Scenario: LateIn - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day - with BreakLI - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     091500 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     141500 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     143000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     091500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     141500 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     093000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     090000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     142900 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140100 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:30   |                           |
      | 05/01/2024 | 09:15    | 19:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 06/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 07/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:29   |                           |
      | 08/01/2024 | 09:00    | 19:00    | AB       | PR       | 00:01   | 1st Half AB:Late-IN Limit |

  @TnA_57
  Scenario: LateIn - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     110000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     120000 |
      | LiEoCheck |   01012024 |     120600 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     120500 |
      | LiEoCheck |   03012024 |     121500 |
      | LiEoCheck |   03012024 |     150000 |
      | LiEoCheck |   03012024 |     152000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 20:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 20:00    | AB       | PR       | 00:10   | 1st Half AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   | 1st Half AB:Late-IN Limit |

  @TnA_58
  Scenario: LateIn - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     101500 |
      | LiEoCheck |   02012024 |     102500 |
      | LiEoCheck |   02012024 |     150000 |
      | LiEoCheck |   02012024 |     153000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 20:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 20:00    | AB       | AB       | 00:10   | Full Day AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | AB       | 00:05   | Full Day AB:Late-IN Limit |

  @TnA_59
  Scenario: LateIn - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     092500 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     200000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 20:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 20:00    | AB       | PR       | 00:10   | 1st Half AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |                           |
      | 06/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |                           |
      | 07/01/2024 | 09:10    | 20:00    | PR       | PR       | 00:10   |                           |
      | 08/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   | 1st Half AB:Late-IN Limit |

  @TnA_60
  Scenario: LateIn - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     092000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     092500 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     200000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |                           |
      | 02/01/2024 | 09:20    | 20:00    | PR       | PR       | 00:20   |                           |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |                           |
      | 04/01/2024 | 09:10    | 20:00    | AB       | AB       | 00:10   | Full Day AB:Late-IN Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |                           |
      | 06/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |                           |
      | 07/01/2024 | 09:10    | 20:00    | PR       | PR       | 00:10   |                           |
      | 08/01/2024 | 09:05    | 20:00    | AB       | AB       | 00:05   | Full Day AB:Late-IN Limit |

  @TnA_61
  Scenario: LateIn - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     093000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     200000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 04/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 06/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |                           |
      | 08/01/2024 | 09:01    | 20:00    | AB       | PR       | 00:01   | 1st Half AB:Late-IN Limit |

  @TnA_62
  Scenario: LateIn - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     093000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     200000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 04/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 06/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |                           |
      | 08/01/2024 | 09:01    | 20:00    | AB       | AB       | 00:01   | Full Day AB:Late-IN Limit |

  @TnA_63
  Scenario: LateIn - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     200000 |
      | LiEoCheck |   07012024 |     090100 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   | 1st Half AB:Late-IN Limit |
      | 04/01/2024 | 09:14    | 20:00    | PR       | PR       | 00:14   |                           |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |                           |
      | 06/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |                           |
      | 07/01/2024 | 09:01    | 20:00    | AB       | PR       | 00:01   | 1st Half AB:Late-IN Limit |

  @TnA_64
  Scenario: LateIn - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     200000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     200000 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     200000 |
      | LiEoCheck |   07012024 |     090100 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |                           |
      | 03/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 04/01/2024 | 09:14    | 20:00    | PR       | PR       | 00:14   |                           |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |                           |
      | 06/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |                           |
      | 07/01/2024 | 09:01    | 20:00    | AB       | AB       | 00:01   | Full Day AB:Late-IN Limit |

  @TnA_65
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 08:00    | 17:50    | PR       | AB       | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 08:00    | 17:55    | PR       | AB       | 00:05     | 2nd Half AB:Early-OUT Limit |

  @TnA_66
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 08:00    | 17:55    | AB       | AB       | 00:05     | Full Day AB:Early-OUT Limit |

  @TnA_67
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175500 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     080000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 08:00    | 17:50    | PR       | AB       | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 08:00    | 17:55    | PR       | PR       | 00:05     |                             |
      | 06/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 07/01/2024 | 08:00    | 17:50    | PR       | PR       | 00:10     |                             |
      | 08/01/2024 | 08:00    | 17:55    | PR       | AB       | 00:05     | 2nd Half AB:Early-OUT Limit |

  @TnA_68
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175500 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     080000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 08:00    | 17:55    | PR       | PR       | 00:05     |                             |
      | 06/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 07/01/2024 | 08:00    | 17:50    | PR       | PR       | 00:10     |                             |
      | 08/01/2024 | 08:00    | 17:55    | AB       | AB       | 00:05     | Full Day AB:Early-OUT Limit |

  @TnA_69
  Scenario: EarlyOut - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175900 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     080000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 05/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 06/01/2024 | 08:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       | 00:27     |                             |
      | 08/01/2024 | 08:00    | 17:59    | PR       | AB       | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_70
  Scenario: EarlyOut - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175900 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     080000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 05/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 06/01/2024 | 08:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       | 00:27     |                             |
      | 08/01/2024 | 08:00    | 17:59    | AB       | AB       | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_71
  Scenario: EarlyOut - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:46    | PR       | PR       | 00:14     |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 06/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 07/01/2024 | 08:00    | 17:59    | PR       | AB       | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_72
  Scenario: EarlyOut - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:46    | PR       | PR       | 00:14     |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 06/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 07/01/2024 | 08:00    | 17:59    | AB       | AB       | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_73
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day - with BreakEO - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     180000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:45    | PR       | AB       | 00:15     | 2nd Half AB:Early-OUT Limit |

  @TnA_74
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day - with BreakEO - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     180000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 04/01/2024 | 08:00    | 17:45    | PR       | AB       | 00:15     | 2nd Half AB:Early-OUT Limit |

  @TnA_75
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day - with BreakEO - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174500 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     124500 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 18:00    | AB       | PR       | 00:15     | 1st Half AB:Early-OUT Limit |

  @TnA_76
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Full Day - with BreakEO - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     180000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:15     | Full Day AB:Early-OUT Limit |

  @TnA_77
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Half Day - with BreakEO - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     180000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     124500 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     174500 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     124500 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 05/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:30     |                             |
      | 06/01/2024 | 08:00    | 17:45    | AB       | PR       | 00:30     | 1st Half AB:Early-OUT Limit |

  @TnA_78
  Scenario: EarlyOut - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Full Day - with BreakEO - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     180000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     124500 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     174500 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     124500 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 05/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:30     |                             |
      | 06/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |

  @TnA_112
  Scenario: EarlyOut - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day - with BreakEO - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174500 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     125900 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175900 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     124500 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     080000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 00:01     |                             |
      | 05/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 06/01/2024 | 08:00    | 17:45    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       | 00:27     |                             |
      | 08/01/2024 | 08:00    | 17:59    | PR       | AB       | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_113
  Scenario: EarlyOut - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day - with BreakEO - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174500 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     090000 |
      | LiEoCheck |   04012024 |     123000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     124500 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     174500 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     090000 |
      | LiEoCheck |   07012024 |     123100 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     090000 |
      | LiEoCheck |   08012024 |     125900 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 08:00    | 17:45    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 08:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:30     |                             |
      | 05/01/2024 | 08:00    | 17:45    | AB       | PR       | 00:30     | 1st Half AB:Early-OUT Limit |
      | 06/01/2024 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 07/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:29     |                             |
      | 08/01/2024 | 09:00    | 19:00    | AB       | PR       | 00:01     | 1st Half AB:Early-OUT Limit |

  @TnA_79
  Scenario: EarlyOut - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     110000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     120000 |
      | LiEoCheck |   01012024 |     120600 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     120500 |
      | LiEoCheck |   03012024 |     121500 |
      | LiEoCheck |   03012024 |     150000 |
      | LiEoCheck |   03012024 |     152000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 07:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 07:00    | 17:50    | PR       | AB       | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 07:00    | 17:55    | PR       | AB       | 00:05     | 2nd Half AB:Early-OUT Limit |

  @TnA_80
  Scenario: EarlyOut - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     101500 |
      | LiEoCheck |   02012024 |     102500 |
      | LiEoCheck |   02012024 |     150000 |
      | LiEoCheck |   02012024 |     153000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 07:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 07:00    | 17:55    | AB       | AB       | 00:05     | Full Day AB:Early-OUT Limit |

  @TnA_81
  Scenario: EarlyOut - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     175500 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 07:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 07:00    | 17:50    | PR       | AB       | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 07:00    | 17:55    | PR       | PR       | 00:05     |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       | 00:10     |                             |
      | 08/01/2024 | 07:00    | 17:55    | PR       | AB       | 00:05     | 2nd Half AB:Early-OUT Limit |

  @TnA_82
  Scenario: EarlyOut - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Count       | Independent | True          |          3 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     174500 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173500 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     175500 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 07:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 07:00    | 17:55    | PR       | PR       | 00:05     |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       | 00:10     |                             |
      | 08/01/2024 | 07:00    | 17:55    | AB       | AB       | 00:05     | Full Day AB:Early-OUT Limit |

  @TnA_83
  Scenario: EarlyOut - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     175900 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 07:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 05/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 06/01/2024 | 07:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 07:00    | 17:33    | PR       | PR       | 00:27     |                             |
      | 08/01/2024 | 07:00    | 17:59    | PR       | AB       | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_84
  Scenario: EarlyOut - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     175900 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 07:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 05/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 06/01/2024 | 07:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 07:00    | 17:33    | PR       | PR       | 00:27     |                             |
      | 08/01/2024 | 07:00    | 17:59    | AB       | AB       | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_85
  Scenario: EarlyOut - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Half Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 07:00    | 17:30    | PR       | AB       | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 07:00    | 17:46    | PR       | PR       | 00:14     |                             |
      | 05/01/2024 | 07:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | PR       | AB       | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_86
  Scenario: EarlyOut - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Independent | True          |            60 | Slab Wise        | Full Day Absent | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     070000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     070000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     070000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 01/01/2024 | 07:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 03/01/2024 | 07:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 07:00    | 17:46    | PR       | PR       | 00:14     |                             |
      | 05/01/2024 | 07:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | AB       | AB       | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_87
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   |           | 1st Half AB:Late-IN Limit   |
      | 05/01/2024 | 08:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |

  @TnA_88
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   |           | 1st Half AB:Late-IN Limit   |

  @TnA_89
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   |           | Full Day AB:Late-IN Limit   |

  @TnA_90
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   |           | Full Day AB:Late-IN Limit   |

  @TnA_91
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     175000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     091000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 06/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 07/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 08/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   |           | 1st Half AB:Late-IN Limit   |
      | 09/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |

  @TnA_92
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     175000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     091000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 06/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 07/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 08/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   |           | 1st Half AB:Late-IN Limit   |
      | 09/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |

  @TnA_93
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     175000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     091000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 06/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 07/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 08/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   |           | Full Day AB:Late-IN Limit   |
      | 09/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |

  @TnA_94
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     175000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     175000 |
      | LiEoCheck |   07012024 |     091000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     091000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 06/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 07/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 08/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   |           | Full Day AB:Late-IN Limit   |
      | 09/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |

  @TnA_95
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       |         | 00:27     |                             |
      | 08/01/2024 | 09:01    | 19:00    | AB       | PR       | 00:01   |           | 1st Half AB:Late-IN Limit   |

  @TnA_96
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       |         | 00:27     |                             |
      | 08/01/2024 | 09:01    | 19:00    | AB       | PR       | 00:01   |           | 1st Half AB:Late-IN Limit   |

  @TnA_97
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 19:00    | AB       | AB       | 00:30   |           | Full Day AB:Late-IN Limit   |
      | 04/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       |         | 00:27     |                             |
      | 08/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   |           | Full Day AB:Late-IN Limit   |

  @TnA_98
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090100 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     173300 |
      | LiEoCheck |   08012024 |     090100 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 19:00    | AB       | AB       | 00:30   |           | Full Day AB:Late-IN Limit   |
      | 04/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       |         | 00:27     |                             |
      | 08/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   |           | Full Day AB:Late-IN Limit   |

  @TnA_99
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     175900 |
      | LiEoCheck |   08012024 |     093000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 03/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 09:14    | 19:00    | PR       | PR       | 00:14   |           |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 07/01/2024 | 08:00    | 17:59    | PR       | AB       |         | 00:01     | 2nd Half AB:Early-OUT Limit |
      | 08/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 09/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |

  @TnA_100
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     080000 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     175900 |
      | LiEoCheck |   08012024 |     093000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 03/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 09:14    | 19:00    | PR       | PR       | 00:14   |           |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 07/01/2024 | 08:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |
      | 08/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 09/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |

  @TnA_101
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     090100 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     093000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 03/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 09:14    | 19:00    | PR       | PR       | 00:14   |           |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 07/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   |           | Full Day AB:Late-IN Limit   |
      | 08/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 09/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |

  @TnA_102
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     080000 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     175900 |
      | LiEoCheck |   02012024 |     093000 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     173000 |
      | LiEoCheck |   04012024 |     091400 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     173000 |
      | LiEoCheck |   06012024 |     091500 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     190000 |
      | LiEoCheck |   07012024 |     090100 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     093000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     190000 |
      | LiEoCheck |   09012024 |     080000 |
      | LiEoCheck |   09012024 |     130000 |
      | LiEoCheck |   09012024 |     140000 |
      | LiEoCheck |   09012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 08:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 02/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 03/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 09:14    | 19:00    | PR       | PR       | 00:14   |           |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 07/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   |           | Full Day AB:Late-IN Limit   |
      | 08/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 09/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |

  @TnA_103
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Half Day, EO Half Day - with Break - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       |         | 00:15     |                             |
      | 03/01/2024 | 09:15    | 19:00    | PR       | AB       | 00:30   |           | 2nd Half AB:Late-IN Limit   |
      | 04/01/2024 | 08:00    | 17:45    | PR       | AB       |         | 00:15     | 2nd Half AB:Early-OUT Limit |

  @TnA_104
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Half Day, EO Full Day - with Break - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     091500 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
      | LiEoCheck |   05012024 |     090000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     141500 |
      | LiEoCheck |   05012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       |         | 00:15     |                             |
      | 03/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 04/01/2024 | 08:00    | 17:45    | AB       | AB       |         | 00:15     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:00    | 19:00    | AB       | PR       | 00:15   |           | 1st Half AB:Late-IN Limit   |

  @TnA_105
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Full Day, EO Half Day - with Break - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     091500 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     090000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     141500 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | AB       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 09:00    | 19:00    | AB       | AB       | 00:15   |           | Full Day AB:Late-IN Limit   |
      | 05/01/2024 | 08:00    | 17:45    | PR       | AB       |         | 00:15     | 2nd Half AB:Early-OUT Limit |

  @TnA_106
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Full Day, EO Full Day - with Break - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     124500 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       |         | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 09:15    | 19:00    | AB       | AB       | 00:15   |           | Full Day AB:Late-IN Limit   |

  @TnA_107
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Full Day - with Break - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     080000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     174500 |
      | LiEoCheck |   05012024 |     091500 |
      | LiEoCheck |   05012024 |     124500 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     141500 |
      | LiEoCheck |   06012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       |         | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:15   | 00:15     | Full Day AB:Early-OUT Limit |
      | 04/01/2024 | 08:00    | 17:45    | PR       | PR       |         | 00:15     |                             |
      | 05/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   | 00:15     |                             |
      | 06/01/2024 | 08:00    | 17:45    | AB       | PR       | 00:15   | 00:15     | 1st Half AB:Late-IN Limit   |

  @TnA_108
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Half Day - with Break - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     090000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     141500 |
      | LiEoCheck |   03012024 |     174500 |
      | LiEoCheck |   04012024 |     091500 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     091500 |
      | LiEoCheck |   05012024 |     124500 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     141500 |
      | LiEoCheck |   06012024 |     174500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       |         | 00:15     |                             |
      | 03/01/2024 | 08:00    | 17:45    | PR       | AB       | 00:15   | 00:15     | 2nd Half AB:Early-OUT Limit |
      | 04/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 05/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   | 00:15     |                             |
      | 06/01/2024 | 08:00    | 17:45    | AB       | AB       | 00:15   | 00:15     | Full Day AB:Late-IN Limit   |

  @TnA_109
  Scenario: LateIn EarlyOut - Mode Combined - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Half Day, EO Half Day - with Break - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | True              | True              | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               |                        4 | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     130000 |
      | LiEoCheck |   01012024 |     140000 |
      | LiEoCheck |   01012024 |     190000 |
      | LiEoCheck |   02012024 |     080000 |
      | LiEoCheck |   02012024 |     124500 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     174500 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     190000 |
      | LiEoCheck |   04012024 |     090000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140100 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     080000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     175900 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     124500 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     130000 |
      | LiEoCheck |   07012024 |     140000 |
      | LiEoCheck |   07012024 |     190000 |
      | LiEoCheck |   08012024 |     080000 |
      | LiEoCheck |   08012024 |     130000 |
      | LiEoCheck |   08012024 |     140000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 08:00    | 17:45    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 19:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 05/01/2024 | 08:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 06/01/2024 | 08:00    | 17:45    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 09:27    | 19:00    | PR       | PR       | 00:27   |           |                             |
      | 08/01/2024 | 08:00    | 17:59    | PR       | AB       |         | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_114
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     110000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     120000 |
      | LiEoCheck |   01012024 |     120600 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     120500 |
      | LiEoCheck |   03012024 |     121500 |
      | LiEoCheck |   03012024 |     150000 |
      | LiEoCheck |   03012024 |     152000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   |           | 1st Half AB:Late-IN Limit   |

  @TnA_115
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     110000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     120000 |
      | LiEoCheck |   01012024 |     120600 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     120500 |
      | LiEoCheck |   03012024 |     121500 |
      | LiEoCheck |   03012024 |     150000 |
      | LiEoCheck |   03012024 |     152000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   |           | 1st Half AB:Late-IN Limit   |

  @TnA_116
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     110000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     120000 |
      | LiEoCheck |   01012024 |     120600 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     120500 |
      | LiEoCheck |   03012024 |     121500 |
      | LiEoCheck |   03012024 |     150000 |
      | LiEoCheck |   03012024 |     152000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | AB       | 00:05   |           | Full Day AB:Late-IN Limit   |

  @TnA_117
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Continuous - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Continuous         | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     110000 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     120000 |
      | LiEoCheck |   01012024 |     120600 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     120500 |
      | LiEoCheck |   03012024 |     121500 |
      | LiEoCheck |   03012024 |     150000 |
      | LiEoCheck |   03012024 |     152000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | AB       | 00:05   |           | Full Day AB:Late-IN Limit   |

  @TnA_118
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |           |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       |         | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 08/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   |           | 1st Half AB:Late-IN Limit   |

  @TnA_119
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |           |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       |         | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 08/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   |           | 1st Half AB:Late-IN Limit   |

  @TnA_120
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |           |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       |         | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 08/01/2024 | 09:05    | 20:00    | AB       | AB       | 00:05   |           | Full Day AB:Late-IN Limit   |

  @TnA_121
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Count - Max Count 3 - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     091500 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     174000 |
      | LiEoCheck |   03012024 |     092500 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175000 |
      | LiEoCheck |   05012024 |     090500 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175000 |
      | LiEoCheck |   08012024 |     090500 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     200000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 02/01/2024 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |           |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       |         | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 08/01/2024 | 09:05    | 20:00    | AB       | AB       | 00:05   |           | Full Day AB:Late-IN Limit   |

  @TnA_122
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 07:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |           |                             |
      | 08/01/2024 | 07:00    | 17:59    | PR       | AB       |         | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_123
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 07:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |           |                             |
      | 08/01/2024 | 07:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_124
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   |           | Full Day AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 07:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |           |                             |
      | 08/01/2024 | 07:00    | 17:59    | PR       | AB       |         | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_125
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Continuous         | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     175900 |
      | LiEoCheck |   05012024 |     090100 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     173000 |
      | LiEoCheck |   07012024 |     092700 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     200000 |
      | LiEoCheck |   08012024 |     070000 |
      | LiEoCheck |   08012024 |     111500 |
      | LiEoCheck |   08012024 |     112500 |
      | LiEoCheck |   08012024 |     160000 |
      | LiEoCheck |   08012024 |     163000 |
      | LiEoCheck |   08012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   |           | Full Day AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 07:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |           |                             |
      | 08/01/2024 | 07:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_126
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Half Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:46    | PR       | PR       |         | 00:14     |                             |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |           |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       |         | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | PR       | AB       |         | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_127
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Half Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:46    | PR       | PR       |         | 00:14     |                             |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |           |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       |         | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |

  @TnA_128
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Half Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   |           | Full Day AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:46    | PR       | PR       |         | 00:14     |                             |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |           |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       |         | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | PR       | AB       |         | 00:01     | 2nd Half AB:Early-OUT Limit |

  @TnA_129
  Scenario: LateIn EarlyOut - Mode Combined - N Punch - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = LI Full Day, EO Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | LiEoCheck |
    And Delete "ZA" shift schedule
    And Delete "ZA" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZA"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LiEoCheck | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Full Day Absent     | Full Day Absent     | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc | EarlyOutPlc | ShiftSchedule | Validation         |
      | LiEoCheck | True   | True      | True      | True      | True      | True               | N-Punch                  | LiEoCheck     | LiEoCheck | LiEoCheck   | ZA            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | LiEoCheck |   01012024 |     090100 |
      | LiEoCheck |   01012024 |     111500 |
      | LiEoCheck |   01012024 |     112500 |
      | LiEoCheck |   01012024 |     160000 |
      | LiEoCheck |   01012024 |     163000 |
      | LiEoCheck |   01012024 |     200000 |
      | LiEoCheck |   02012024 |     070000 |
      | LiEoCheck |   02012024 |     111500 |
      | LiEoCheck |   02012024 |     112500 |
      | LiEoCheck |   02012024 |     160000 |
      | LiEoCheck |   02012024 |     163000 |
      | LiEoCheck |   02012024 |     173000 |
      | LiEoCheck |   03012024 |     093000 |
      | LiEoCheck |   03012024 |     111500 |
      | LiEoCheck |   03012024 |     112500 |
      | LiEoCheck |   03012024 |     160000 |
      | LiEoCheck |   03012024 |     163000 |
      | LiEoCheck |   03012024 |     200000 |
      | LiEoCheck |   04012024 |     070000 |
      | LiEoCheck |   04012024 |     111500 |
      | LiEoCheck |   04012024 |     112500 |
      | LiEoCheck |   04012024 |     160000 |
      | LiEoCheck |   04012024 |     163000 |
      | LiEoCheck |   04012024 |     174600 |
      | LiEoCheck |   05012024 |     093000 |
      | LiEoCheck |   05012024 |     111500 |
      | LiEoCheck |   05012024 |     112500 |
      | LiEoCheck |   05012024 |     160000 |
      | LiEoCheck |   05012024 |     163000 |
      | LiEoCheck |   05012024 |     200000 |
      | LiEoCheck |   06012024 |     070000 |
      | LiEoCheck |   06012024 |     111500 |
      | LiEoCheck |   06012024 |     112500 |
      | LiEoCheck |   06012024 |     160000 |
      | LiEoCheck |   06012024 |     163000 |
      | LiEoCheck |   06012024 |     174500 |
      | LiEoCheck |   07012024 |     070000 |
      | LiEoCheck |   07012024 |     111500 |
      | LiEoCheck |   07012024 |     112500 |
      | LiEoCheck |   07012024 |     160000 |
      | LiEoCheck |   07012024 |     163000 |
      | LiEoCheck |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 01/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 02/01/2024 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 03/01/2024 | 09:30    | 20:00    | AB       | AB       | 00:30   |           | Full Day AB:Late-IN Limit   |
      | 04/01/2024 | 07:00    | 17:46    | PR       | PR       |         | 00:14     |                             |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |           |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       |         | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |
