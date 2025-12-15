@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @MAP_1
  Scenario: Monthly Process - Custom month - Absent marking rule - LateIn count
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
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
      | LiEoCheck |   24122023 |     091500 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     190000 |
      | LiEoCheck |   28122023 |     092000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     190000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 24/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |                           |
      | 28/01/2024 | 09:20    | 19:00    | PR       | PR       | 00:20   |                           |
      | 03/02/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |                           |
      | 04/02/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   | Full Day AB:Late-IN Limit |
      | 05/02/2024 | 09:05    | 19:00    | AB       | AB       | 00:05   | Full Day AB:Late-IN Limit |

  @MAP_2
  Scenario: Monthly Process - Custom month - Absent marking rule - EarlyOut count
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxCount | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Count       | Independent | True          |          3 | Continuous       | Full Day Absent | Saved Successfully |
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
      | LiEoCheck |   24122023 |     080000 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     174500 |
      | LiEoCheck |   28122023 |     080000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     174000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 24/12/2023 | 08:00    | 17:45    | PR       | PR       | 00:15     |                             |
      | 28/12/2023 | 08:00    | 17:40    | PR       | PR       | 00:20     |                             |
      | 03/01/2024 | 08:00    | 17:35    | PR       | PR       | 00:25     |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 08:00    | 17:55    | AB       | AB       | 00:05     | Full Day AB:Early-OUT Limit |

  @MAP_3
  Scenario: Monthly Process - Custom month - Absent marking rule - LateIn EarlyOut count
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
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
      | LiEoCheck |   24122023 |     091500 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     190000 |
      | LiEoCheck |   28122023 |     080000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     175000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 24/12/2023 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 28/12/2023 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 03/01/2024 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 08:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:10    | 19:00    | AB       | PR       | 00:10   |           | 1st Half AB:Late-IN Limit   |

  @MAP_4
  Scenario: Monthly Process - Custom month - Absent marking rule - LateIn EarlyOut count Slabwise
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
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
      | LiEoCheck |   22122023 |     091500 |
      | LiEoCheck |   22122023 |     130000 |
      | LiEoCheck |   22122023 |     140000 |
      | LiEoCheck |   22122023 |     190000 |
      | LiEoCheck |   24122023 |     080000 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     175000 |
      | LiEoCheck |   26122023 |     092500 |
      | LiEoCheck |   26122023 |     130000 |
      | LiEoCheck |   26122023 |     140000 |
      | LiEoCheck |   26122023 |     190000 |
      | LiEoCheck |   28122023 |     080000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     175000 |
      | LiEoCheck |   31122023 |     091000 |
      | LiEoCheck |   31122023 |     130000 |
      | LiEoCheck |   31122023 |     140000 |
      | LiEoCheck |   31122023 |     190000 |
      | LiEoCheck |   03012024 |     080000 |
      | LiEoCheck |   03012024 |     130000 |
      | LiEoCheck |   03012024 |     140000 |
      | LiEoCheck |   03012024 |     175000 |
      | LiEoCheck |   04012024 |     091000 |
      | LiEoCheck |   04012024 |     130000 |
      | LiEoCheck |   04012024 |     140000 |
      | LiEoCheck |   04012024 |     190000 |
      | LiEoCheck |   05012024 |     091000 |
      | LiEoCheck |   05012024 |     130000 |
      | LiEoCheck |   05012024 |     140000 |
      | LiEoCheck |   05012024 |     190000 |
      | LiEoCheck |   06012024 |     080000 |
      | LiEoCheck |   06012024 |     130000 |
      | LiEoCheck |   06012024 |     140000 |
      | LiEoCheck |   06012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | LiEoCheck |
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 22/12/2023 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 24/12/2023 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 26/12/2023 | 09:25    | 19:00    | PR       | PR       | 00:25   |           |                             |
      | 28/12/2023 | 08:00    | 17:50    | PR       | AB       |         | 00:10     | 2nd Half AB:Early-OUT Limit |
      | 31/12/2023 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 03/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 04/01/2024 | 09:10    | 19:00    | PR       | PR       | 00:10   |           |                             |
      | 05/01/2024 | 09:10    | 19:00    | AB       | AB       | 00:10   |           | Full Day AB:Late-IN Limit   |
      | 06/01/2024 | 08:00    | 17:50    | PR       | PR       |         | 00:10     |                             |

  @MAP_5
  Scenario: Monthly Process - Custom month - Absent marking rule - LateIn Duration
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | LiCheckEnable | LiMaxDuration | LiAbsentMarkType | LiMarkAbsent    | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Full Day Absent | Saved Successfully |
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
      | LiEoCheck |   24122023 |     090100 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     190000 |
      | LiEoCheck |   26122023 |     093000 |
      | LiEoCheck |   26122023 |     130000 |
      | LiEoCheck |   26122023 |     140000 |
      | LiEoCheck |   26122023 |     190000 |
      | LiEoCheck |   28122023 |     093000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     190000 |
      | LiEoCheck |   31122023 |     090100 |
      | LiEoCheck |   31122023 |     130000 |
      | LiEoCheck |   31122023 |     140000 |
      | LiEoCheck |   31122023 |     190000 |
      | LiEoCheck |   02012024 |     090100 |
      | LiEoCheck |   02012024 |     130000 |
      | LiEoCheck |   02012024 |     140000 |
      | LiEoCheck |   02012024 |     190000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                    |
      | 24/12/2023 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 26/12/2023 | 09:30    | 19:00    | PR       | PR       | 00:30   |                           |
      | 28/12/2023 | 09:30    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 31/12/2023 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 02/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |                           |
      | 06/01/2024 | 09:30    | 19:00    | AB       | AB       | 00:30   | Full Day AB:Late-IN Limit |
      | 07/01/2024 | 09:27    | 19:00    | PR       | PR       | 00:27   |                           |
      | 08/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   | Full Day AB:Late-IN Limit |

  @MAP_6
  Scenario: Monthly Process - Custom month - Absent marking rule - EarlyOut Duration
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode    | EoCheckEnable | EoMaxDuration | EoAbsentMarkType | EoMarkAbsent    | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Duration    | Independent | True          |            60 | Continuous       | Full Day Absent | Saved Successfully |
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
      | LiEoCheck |   22122023 |     080000 |
      | LiEoCheck |   22122023 |     130000 |
      | LiEoCheck |   22122023 |     140000 |
      | LiEoCheck |   22122023 |     175900 |
      | LiEoCheck |   24122023 |     080000 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     173000 |
      | LiEoCheck |   26122023 |     080000 |
      | LiEoCheck |   26122023 |     130000 |
      | LiEoCheck |   26122023 |     140000 |
      | LiEoCheck |   26122023 |     173000 |
      | LiEoCheck |   28122023 |     080000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     175900 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark                      |
      | 22/12/2023 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 24/12/2023 | 08:00    | 17:30    | PR       | PR       | 00:30     |                             |
      | 26/12/2023 | 08:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 28/12/2023 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 05/01/2024 | 08:00    | 17:59    | PR       | PR       | 00:01     |                             |
      | 06/01/2024 | 08:00    | 17:30    | AB       | AB       | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       | 00:27     |                             |
      | 08/01/2024 | 08:00    | 17:59    | AB       | AB       | 00:01     | Full Day AB:Early-OUT Limit |

  @MAP_7
  Scenario: Monthly Process - Custom month - Absent marking rule - LateIn EarlyOut Duration
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
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
      | LiEoCheck |   24122023 |     090100 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     190000 |
      | LiEoCheck |   26122023 |     080000 |
      | LiEoCheck |   26122023 |     130000 |
      | LiEoCheck |   26122023 |     140000 |
      | LiEoCheck |   26122023 |     173000 |
      | LiEoCheck |   28122023 |     093000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     190000 |
      | LiEoCheck |   30122023 |     090100 |
      | LiEoCheck |   30122023 |     130000 |
      | LiEoCheck |   30122023 |     140000 |
      | LiEoCheck |   30122023 |     190000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 24/12/2023 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 26/12/2023 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 28/12/2023 | 09:30    | 19:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 30/12/2023 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 05/01/2024 | 09:01    | 19:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 08:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 08:00    | 17:33    | PR       | PR       |         | 00:27     |                             |
      | 08/01/2024 | 09:01    | 19:00    | AB       | PR       | 00:01   |           | 1st Half AB:Late-IN Limit   |

  @MAP_8
  Scenario: Monthly Process - Custom month - Absent marking rule - LateIn EarlyOut Duration Slabwise
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Full Day Absent     | Half Day Absent     | Saved Successfully |
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
      | LiEoCheck |   24122023 |     080000 |
      | LiEoCheck |   24122023 |     130000 |
      | LiEoCheck |   24122023 |     140000 |
      | LiEoCheck |   24122023 |     175900 |
      | LiEoCheck |   26122023 |     093000 |
      | LiEoCheck |   26122023 |     130000 |
      | LiEoCheck |   26122023 |     140000 |
      | LiEoCheck |   26122023 |     190000 |
      | LiEoCheck |   28122023 |     080000 |
      | LiEoCheck |   28122023 |     130000 |
      | LiEoCheck |   28122023 |     140000 |
      | LiEoCheck |   28122023 |     173000 |
      | LiEoCheck |   30122023 |     091400 |
      | LiEoCheck |   30122023 |     130000 |
      | LiEoCheck |   30122023 |     140000 |
      | LiEoCheck |   30122023 |     190000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 24/12/2023 | 08:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 26/12/2023 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 28/12/2023 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |
      | 30/12/2023 | 09:14    | 19:00    | PR       | PR       | 00:14   |           |                             |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 06/01/2024 | 09:15    | 19:00    | PR       | PR       | 00:15   |           |                             |
      | 07/01/2024 | 09:01    | 19:00    | AB       | AB       | 00:01   |           | Full Day AB:Late-IN Limit   |
      | 08/01/2024 | 09:30    | 19:00    | PR       | PR       | 00:30   |           |                             |
      | 09/01/2024 | 08:00    | 17:30    | PR       | AB       |         | 00:30     | 2nd Half AB:Early-OUT Limit |

  @MAP_9
  Scenario: Monthly Process - Custom month - Absent marking rule - N Punch -  LateIn EarlyOut count
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Count       | Combined |            3 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
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
      | LiEoCheck |   28122023 |     091500 |
      | LiEoCheck |   28122023 |     110000 |
      | LiEoCheck |   28122023 |     111500 |
      | LiEoCheck |   28122023 |     120000 |
      | LiEoCheck |   28122023 |     120600 |
      | LiEoCheck |   28122023 |     200000 |
      | LiEoCheck |   29122023 |     070000 |
      | LiEoCheck |   29122023 |     111500 |
      | LiEoCheck |   29122023 |     112500 |
      | LiEoCheck |   29122023 |     160000 |
      | LiEoCheck |   29122023 |     163000 |
      | LiEoCheck |   29122023 |     174000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 28/12/2023 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 29/12/2023 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 03/01/2024 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   |           | 1st Half AB:Late-IN Limit   |

  @MAP_10
  Scenario: Monthly Process - Custom month - Absent marking rule - N Punch - LateIn EarlyOut count Slabwise
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxCount | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Count       | Combined |            3 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
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
      | LiEoCheck |   26122023 |     091500 |
      | LiEoCheck |   26122023 |     111500 |
      | LiEoCheck |   26122023 |     112500 |
      | LiEoCheck |   26122023 |     160000 |
      | LiEoCheck |   26122023 |     163000 |
      | LiEoCheck |   26122023 |     200000 |
      | LiEoCheck |   28122023 |     070000 |
      | LiEoCheck |   28122023 |     111500 |
      | LiEoCheck |   28122023 |     112500 |
      | LiEoCheck |   28122023 |     160000 |
      | LiEoCheck |   28122023 |     163000 |
      | LiEoCheck |   28122023 |     174000 |
      | LiEoCheck |   30122023 |     092500 |
      | LiEoCheck |   30122023 |     111500 |
      | LiEoCheck |   30122023 |     112500 |
      | LiEoCheck |   30122023 |     160000 |
      | LiEoCheck |   30122023 |     163000 |
      | LiEoCheck |   30122023 |     200000 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 26/12/2023 | 09:15    | 20:00    | PR       | PR       | 00:15   |           |                             |
      | 28/12/2023 | 07:00    | 17:40    | PR       | PR       |         | 00:20     |                             |
      | 30/12/2023 | 09:25    | 20:00    | PR       | PR       | 00:25   |           |                             |
      | 04/01/2024 | 07:00    | 17:50    | AB       | AB       |         | 00:10     | Full Day AB:Early-OUT Limit |
      | 05/01/2024 | 09:05    | 20:00    | PR       | PR       | 00:05   |           |                             |
      | 06/01/2024 | 07:00    | 17:35    | PR       | PR       |         | 00:25     |                             |
      | 07/01/2024 | 07:00    | 17:50    | PR       | PR       |         | 00:10     |                             |
      | 08/01/2024 | 09:05    | 20:00    | AB       | PR       | 00:05   |           | 1st Half AB:Late-IN Limit   |

  @MAP_11
  Scenario: Monthly Process - Custom month - Absent marking rule - N Punch - LateIn EarlyOut Duration
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Duration    | Combined |              60 | Continuous         | Half Day Absent     | Full Day Absent     | Saved Successfully |
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
      | LiEoCheck |   26122023 |     090100 |
      | LiEoCheck |   26122023 |     111500 |
      | LiEoCheck |   26122023 |     112500 |
      | LiEoCheck |   26122023 |     160000 |
      | LiEoCheck |   26122023 |     163000 |
      | LiEoCheck |   26122023 |     200000 |
      | LiEoCheck |   28122023 |     070000 |
      | LiEoCheck |   28122023 |     111500 |
      | LiEoCheck |   28122023 |     112500 |
      | LiEoCheck |   28122023 |     160000 |
      | LiEoCheck |   28122023 |     163000 |
      | LiEoCheck |   28122023 |     173000 |
      | LiEoCheck |   30122023 |     093000 |
      | LiEoCheck |   30122023 |     111500 |
      | LiEoCheck |   30122023 |     112500 |
      | LiEoCheck |   30122023 |     160000 |
      | LiEoCheck |   30122023 |     163000 |
      | LiEoCheck |   30122023 |     200000 |
      | LiEoCheck |   31122023 |     070000 |
      | LiEoCheck |   31122023 |     111500 |
      | LiEoCheck |   31122023 |     112500 |
      | LiEoCheck |   31122023 |     160000 |
      | LiEoCheck |   31122023 |     163000 |
      | LiEoCheck |   31122023 |     175900 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 26/12/2023 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 28/12/2023 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 30/12/2023 | 09:30    | 20:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 31/12/2023 | 07:00    | 17:59    | PR       | PR       |         | 00:01     |                             |
      | 05/01/2024 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 06/01/2024 | 07:00    | 17:30    | AB       | AB       |         | 00:30     | Full Day AB:Early-OUT Limit |
      | 07/01/2024 | 09:27    | 20:00    | PR       | PR       | 00:27   |           |                             |
      | 08/01/2024 | 07:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |

  @MAP_12
  Scenario: Monthly Process - Custom month - Absent marking rule - N Punch - LateIn EarlyOut Duration Slabwise
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
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LiEoMarkAbsentAsPer | LiEoMode | LiEoMaxDuration | LiEoAbsentMarkType | LiEoMarkAbsentForLi | LiEoMarkAbsentForEo | validation         |
      | LiEoCheck | Customized |              21 |                4 | Monthly Duration    | Combined |              60 | Slab Wise          | Half Day Absent     | Full Day Absent     | Saved Successfully |
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
      | LiEoCheck |   26122023 |     090100 |
      | LiEoCheck |   26122023 |     111500 |
      | LiEoCheck |   26122023 |     112500 |
      | LiEoCheck |   26122023 |     160000 |
      | LiEoCheck |   26122023 |     163000 |
      | LiEoCheck |   26122023 |     200000 |
      | LiEoCheck |   28122023 |     070000 |
      | LiEoCheck |   28122023 |     111500 |
      | LiEoCheck |   28122023 |     112500 |
      | LiEoCheck |   28122023 |     160000 |
      | LiEoCheck |   28122023 |     163000 |
      | LiEoCheck |   28122023 |     173000 |
      | LiEoCheck |   30122023 |     093000 |
      | LiEoCheck |   30122023 |     111500 |
      | LiEoCheck |   30122023 |     112500 |
      | LiEoCheck |   30122023 |     160000 |
      | LiEoCheck |   30122023 |     163000 |
      | LiEoCheck |   30122023 |     200000 |
      | LiEoCheck |   31122023 |     070000 |
      | LiEoCheck |   31122023 |     111500 |
      | LiEoCheck |   31122023 |     112500 |
      | LiEoCheck |   31122023 |     160000 |
      | LiEoCheck |   31122023 |     163000 |
      | LiEoCheck |   31122023 |     174600 |
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
    Then Daily Attendance View for userid "LiEoCheck" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Remark                      |
      | 26/12/2023 | 09:01    | 20:00    | PR       | PR       | 00:01   |           |                             |
      | 28/12/2023 | 07:00    | 17:30    | PR       | PR       |         | 00:30     |                             |
      | 30/12/2023 | 09:30    | 20:00    | AB       | PR       | 00:30   |           | 1st Half AB:Late-IN Limit   |
      | 31/12/2023 | 07:00    | 17:46    | PR       | PR       |         | 00:14     |                             |
      | 05/01/2024 | 09:30    | 20:00    | PR       | PR       | 00:30   |           |                             |
      | 06/01/2024 | 07:00    | 17:45    | PR       | PR       |         | 00:15     |                             |
      | 07/01/2024 | 07:00    | 17:59    | AB       | AB       |         | 00:01     | Full Day AB:Early-OUT Limit |

  @MAP_13
  Scenario: Monthly Process - Custom month - Absent marking rule - Less Working Hours count
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Delete "ZD" shift schedule
    And Delete "ZD" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | True                     | Actual Break Duration     | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZD"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False            |           |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False              |             |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName     | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs | Customized |              21 |                4 | True             |                    60 | Monthly Count          |                     2 |                       | Continuous            | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   28122023 |     090000 |
      | LessWorkHrs |   28122023 |     130000 |
      | LessWorkHrs |   28122023 |     140000 |
      | LessWorkHrs |   28122023 |     173000 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     143000 |
      | LessWorkHrs |   03012024 |     180000 |
      | LessWorkHrs |   04012024 |     090000 |
      | LessWorkHrs |   04012024 |     123000 |
      | LessWorkHrs |   04012024 |     140000 |
      | LessWorkHrs |   04012024 |     180000 |
      | LessWorkHrs |   05012024 |     090000 |
      | LessWorkHrs |   05012024 |     130000 |
      | LessWorkHrs |   05012024 |     140000 |
      | LessWorkHrs |   05012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 28/12/2023 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |

  @MAP_14
  Scenario: Monthly Process - Custom month - Absent marking rule - Less Working Hours Duration Slabwise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Delete "ZD" shift schedule
    And Delete "ZD" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | True                     | Actual Break Duration     | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZD"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False            |           |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False              |             |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName     | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs | Customized |              21 |                4 | True             |                    45 | Monthly Duration       |                       |                    60 | Slab Wise             | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   28122023 |     090100 |
      | LessWorkHrs |   28122023 |     130000 |
      | LessWorkHrs |   28122023 |     140000 |
      | LessWorkHrs |   28122023 |     180000 |
      | LessWorkHrs |   29122023 |     093000 |
      | LessWorkHrs |   29122023 |     130000 |
      | LessWorkHrs |   29122023 |     140000 |
      | LessWorkHrs |   29122023 |     180000 |
      | LessWorkHrs |   30122023 |     090000 |
      | LessWorkHrs |   30122023 |     123000 |
      | LessWorkHrs |   30122023 |     140000 |
      | LessWorkHrs |   30122023 |     180000 |
      | LessWorkHrs |   31122023 |     091400 |
      | LessWorkHrs |   31122023 |     130000 |
      | LessWorkHrs |   31122023 |     140000 |
      | LessWorkHrs |   31122023 |     180000 |
      | LessWorkHrs |   05012024 |     090000 |
      | LessWorkHrs |   05012024 |     123000 |
      | LessWorkHrs |   05012024 |     140000 |
      | LessWorkHrs |   05012024 |     180000 |
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     130000 |
      | LessWorkHrs |   06012024 |     140000 |
      | LessWorkHrs |   06012024 |     174500 |
      | LessWorkHrs |   07012024 |     090000 |
      | LessWorkHrs |   07012024 |     130000 |
      | LessWorkHrs |   07012024 |     140000 |
      | LessWorkHrs |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 28/12/2023 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 29/12/2023 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 30/12/2023 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 31/12/2023 | 09:14    | 18:00    | PR       | PR       | 07:46      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 07/01/2024 | 09:00    | 17:59    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |

  @MAP_15
  Scenario: Monthly Process - Custom month - Absent marking rule - Less Working Hours Both
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Delete "ZD" shift schedule
    And Delete "ZD" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | True                     | Actual Break Duration     | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZD"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False            |           |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False              |             |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName     | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs | Customized |              21 |                4 | True             |                    60 | Both                   |                     2 |                    60 | Continuous            | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   30122023 |     090000 |
      | LessWorkHrs |   30122023 |     130000 |
      | LessWorkHrs |   30122023 |     140000 |
      | LessWorkHrs |   30122023 |     174500 |
      | LessWorkHrs |   02012024 |     091500 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     143000 |
      | LessWorkHrs |   03012024 |     180000 |
      | LessWorkHrs |   04012024 |     090000 |
      | LessWorkHrs |   04012024 |     123000 |
      | LessWorkHrs |   04012024 |     140000 |
      | LessWorkHrs |   04012024 |     180000 |
      | LessWorkHrs |   05012024 |     090000 |
      | LessWorkHrs |   05012024 |     130000 |
      | LessWorkHrs |   05012024 |     140000 |
      | LessWorkHrs |   05012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 30/12/2023 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 02/01/2024 | 09:15    | 18:00    | PR       | PR       | 07:45      |                              |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |

  @MAP_16
  Scenario: Monthly Process - Custom month - Absent marking rule - Less Working Hours Both Slabwise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Delete "ZD" shift schedule
    And Delete "ZD" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | True                     | Actual Break Duration     | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZD"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False            |           |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False              |             |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName     | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs | Customized |              21 |                4 | True             |                    60 | Both                   |                     2 |                    60 | Slab Wise             | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   28122023 |     090000 |
      | LessWorkHrs |   28122023 |     130000 |
      | LessWorkHrs |   28122023 |     140000 |
      | LessWorkHrs |   28122023 |     171500 |
      | LessWorkHrs |   29122023 |     093000 |
      | LessWorkHrs |   29122023 |     130000 |
      | LessWorkHrs |   29122023 |     140000 |
      | LessWorkHrs |   29122023 |     180000 |
      | LessWorkHrs |   30122023 |     090000 |
      | LessWorkHrs |   30122023 |     130000 |
      | LessWorkHrs |   30122023 |     143000 |
      | LessWorkHrs |   30122023 |     180000 |
      | LessWorkHrs |   04012024 |     090100 |
      | LessWorkHrs |   04012024 |     130000 |
      | LessWorkHrs |   04012024 |     140000 |
      | LessWorkHrs |   04012024 |     180000 |
      | LessWorkHrs |   05012024 |     090100 |
      | LessWorkHrs |   05012024 |     130000 |
      | LessWorkHrs |   05012024 |     140000 |
      | LessWorkHrs |   05012024 |     180000 |
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     130000 |
      | LessWorkHrs |   06012024 |     140000 |
      | LessWorkHrs |   06012024 |     173000 |
      | LessWorkHrs |   07012024 |     090000 |
      | LessWorkHrs |   07012024 |     130000 |
      | LessWorkHrs |   07012024 |     140000 |
      | LessWorkHrs |   07012024 |     175000 |
      | LessWorkHrs |   08012024 |     090100 |
      | LessWorkHrs |   08012024 |     130000 |
      | LessWorkHrs |   08012024 |     140000 |
      | LessWorkHrs |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 28/12/2023 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 29/12/2023 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 30/12/2023 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 07/01/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                              |
      | 08/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |

  @MAP_17
  Scenario: Monthly Process - Custom month - Absent marking rule - Less Working Hours - N Punch - Both
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Delete "ZD" shift schedule
    And Delete "ZD" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | True                     | Actual Break Duration     | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZD"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False            |           |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False              |             |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName     | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs | Customized |              21 |                4 | True             |                    60 | Both                   |                     2 |                    60 | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   28122023 |     090000 |
      | LessWorkHrs |   28122023 |     100000 |
      | LessWorkHrs |   28122023 |     103000 |
      | LessWorkHrs |   28122023 |     160000 |
      | LessWorkHrs |   28122023 |     163000 |
      | LessWorkHrs |   28122023 |     171500 |
      | LessWorkHrs |   30122023 |     093000 |
      | LessWorkHrs |   30122023 |     100000 |
      | LessWorkHrs |   30122023 |     103000 |
      | LessWorkHrs |   30122023 |     160000 |
      | LessWorkHrs |   30122023 |     163000 |
      | LessWorkHrs |   30122023 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     100000 |
      | LessWorkHrs |   03012024 |     103000 |
      | LessWorkHrs |   03012024 |     160000 |
      | LessWorkHrs |   03012024 |     163000 |
      | LessWorkHrs |   03012024 |     173000 |
      | LessWorkHrs |   04012024 |     090100 |
      | LessWorkHrs |   04012024 |     100000 |
      | LessWorkHrs |   04012024 |     103000 |
      | LessWorkHrs |   04012024 |     160000 |
      | LessWorkHrs |   04012024 |     163000 |
      | LessWorkHrs |   04012024 |     180000 |
      | LessWorkHrs |   05012024 |     090100 |
      | LessWorkHrs |   05012024 |     100000 |
      | LessWorkHrs |   05012024 |     103000 |
      | LessWorkHrs |   05012024 |     160000 |
      | LessWorkHrs |   05012024 |     163000 |
      | LessWorkHrs |   05012024 |     180000 |
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     100000 |
      | LessWorkHrs |   06012024 |     103000 |
      | LessWorkHrs |   06012024 |     160000 |
      | LessWorkHrs |   06012024 |     163000 |
      | LessWorkHrs |   06012024 |     173000 |
      | LessWorkHrs |   07012024 |     090000 |
      | LessWorkHrs |   07012024 |     100000 |
      | LessWorkHrs |   07012024 |     103000 |
      | LessWorkHrs |   07012024 |     160000 |
      | LessWorkHrs |   07012024 |     163000 |
      | LessWorkHrs |   07012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 28/12/2023 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 30/12/2023 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:50    | PR       | AB       | 07:50      | Half Day AB:Work Hours Limit |

  @MAP_18
  Scenario: Monthly Process - Custom month - Absent marking rule - Less Working Hours - N Punch - Both Slabwise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Delete "ZD" shift schedule
    And Delete "ZD" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZD      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | True                     | Actual Break Duration     | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZD" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZD      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZD"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False            |           |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | LessWorkHrs | False              |             |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName     | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs | Customized |              21 |                4 | True             |                    60 | Both                   |                     2 |                    60 | Slab Wise             | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   28122023 |     090000 |
      | LessWorkHrs |   28122023 |     100000 |
      | LessWorkHrs |   28122023 |     103000 |
      | LessWorkHrs |   28122023 |     160000 |
      | LessWorkHrs |   28122023 |     163000 |
      | LessWorkHrs |   28122023 |     171500 |
      | LessWorkHrs |   29122023 |     093000 |
      | LessWorkHrs |   29122023 |     100000 |
      | LessWorkHrs |   29122023 |     103000 |
      | LessWorkHrs |   29122023 |     160000 |
      | LessWorkHrs |   29122023 |     163000 |
      | LessWorkHrs |   29122023 |     180000 |
      | LessWorkHrs |   30122023 |     090000 |
      | LessWorkHrs |   30122023 |     100000 |
      | LessWorkHrs |   30122023 |     103000 |
      | LessWorkHrs |   30122023 |     160000 |
      | LessWorkHrs |   30122023 |     163000 |
      | LessWorkHrs |   30122023 |     173000 |
      | LessWorkHrs |   04012024 |     090100 |
      | LessWorkHrs |   04012024 |     100000 |
      | LessWorkHrs |   04012024 |     103000 |
      | LessWorkHrs |   04012024 |     160000 |
      | LessWorkHrs |   04012024 |     163000 |
      | LessWorkHrs |   04012024 |     180000 |
      | LessWorkHrs |   05012024 |     090100 |
      | LessWorkHrs |   05012024 |     100000 |
      | LessWorkHrs |   05012024 |     103000 |
      | LessWorkHrs |   05012024 |     160000 |
      | LessWorkHrs |   05012024 |     163000 |
      | LessWorkHrs |   05012024 |     180000 |
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     100000 |
      | LessWorkHrs |   06012024 |     103000 |
      | LessWorkHrs |   06012024 |     160000 |
      | LessWorkHrs |   06012024 |     163000 |
      | LessWorkHrs |   06012024 |     173000 |
      | LessWorkHrs |   07012024 |     090000 |
      | LessWorkHrs |   07012024 |     100000 |
      | LessWorkHrs |   07012024 |     103000 |
      | LessWorkHrs |   07012024 |     160000 |
      | LessWorkHrs |   07012024 |     163000 |
      | LessWorkHrs |   07012024 |     175000 |
      | LessWorkHrs |   08012024 |     090100 |
      | LessWorkHrs |   08012024 |     100000 |
      | LessWorkHrs |   08012024 |     103000 |
      | LessWorkHrs |   08012024 |     160000 |
      | LessWorkHrs |   08012024 |     163000 |
      | LessWorkHrs |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 28/12/2023 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 29/12/2023 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 30/12/2023 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 07/01/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                              |
      | 08/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |

  @MAP_19
  Scenario: Monthly Process - Custom month - Short Lv Restrictions - Max Minutes - N Punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes | Customized |              21 |                4 | False                |                 |                 | True                 |                        60 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   30122023 |     090000 |
      | ShLvOffHrsRes |   30122023 |     110000 |
      | ShLvOffHrsRes |   30122023 |     113000 |
      | ShLvOffHrsRes |   30122023 |     160000 |
      | ShLvOffHrsRes |   30122023 |     163000 |
      | ShLvOffHrsRes |   30122023 |     173000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        30122023 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 30/12/2023 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | SHORT LEAVE |

  @MAP_20
  Scenario: Monthly Process - Custom month - Short Lv Restrictions - Max Counts
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes | Customized |              21 |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   30122023 |     091500 |
      | ShLvOffHrsRes |   30122023 |     130000 |
      | ShLvOffHrsRes |   30122023 |     140000 |
      | ShLvOffHrsRes |   30122023 |     174500 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     091500 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     174500 |
      | ShLvOffHrsRes |   04012024 |     093000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "30/12/2023" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
      | 17:45 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
      | 17:45 | ShortLeave OUT  | ByAutomation |

  @MAP_21
  Scenario: Monthly Process - Custom month - Short Lv Restrictions - Max Minutes & Counts
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes | Customized |              21 |                4 | False                |                 |                 | True                 |                        60 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   30122023 |     093000 |
      | ShLvOffHrsRes |   30122023 |     130000 |
      | ShLvOffHrsRes |   30122023 |     140000 |
      | ShLvOffHrsRes |   30122023 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     173000 |
      | ShLvOffHrsRes |   03012024 |     093000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid4 | reason-4     | appliedBy     |
      | ShLvOffHrsRes |        30122023 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 30/12/2023 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:30    | 18:00    | AB       | PR       | 07:30      | SHORT LEAVE |

  @MAP_22
  Scenario: Monthly Process - Custom month - Auto Atd Correction - Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAP_Lv |
    And Delete "Z_" shift schedule
    And Delete "Z_" shift
    And Create Attendance Policy
      | PlcName | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | AutoAtdCorrectLeave | validation         |
      | MAP_Lv  | Customized |              21 |                2 | true                | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZH      | ZH        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "ZH" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | ZH      | true           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | Z_      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "Z_" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | Z_      |               7 |
    And Configure Off Day Configuration in Shift Schedule "Z_"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | LeaveGroup | Validation         |
      | MAP_Lv | True   | True      | True      | True      | True      | True               |                        2 | MAP_Lv        | Z_            | ZH         | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID |
      | MAP_Lv |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID |
      | MAP_Lv |
    When Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | accrual-policy | leave-code | period | month    | year | pro-rata | remark | hours  |
      | MAP_Lv |          0 |           0 |                 |                 |   14 |              1 | ZH         |        | January  | 2024 |          | credit | 002:00 |
      | MAP_Lv |          0 |           0 |                 |                 |   10 |              1 | ZH         |        | February | 2024 |          | credit | 002:00 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID |
      | MAP_Lv |
    Then Daily Attendance View for userid "MAP_Lv" and period "Date" on "21/01/2024" and "03/02/2024"
      | Date       | 1st Half | 2nd Half |
      | 21/01/2024 | ZH       | ZH       |
      | 02/02/2024 | ZH       | ZH       |
      | 03/02/2024 | ZH       | ZH       |

  @MAP_23
  Scenario: Monthly Process - Custom month - Auto Atd Correction - Overtime
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk | Customized |              21 |                4 | True                   |               2 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "December" and Year = "2023"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "December" and Year = "2023"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   15122023 |     050000 |
      | NetWrkHrsPlcChk |   15122023 |     130000 |
      | NetWrkHrsPlcChk |   15122023 |     140000 |
      | NetWrkHrsPlcChk |   15122023 |     220000 |
      | NetWrkHrsPlcChk |   16122023 |     050000 |
      | NetWrkHrsPlcChk |   16122023 |     130000 |
      | NetWrkHrsPlcChk |   16122023 |     140000 |
      | NetWrkHrsPlcChk |   16122023 |     220000 |
      | NetWrkHrsPlcChk |   22122023 |     100000 |
      | NetWrkHrsPlcChk |   22122023 |     130000 |
      | NetWrkHrsPlcChk |   22122023 |     140000 |
      | NetWrkHrsPlcChk |   22122023 |     170000 |
      | NetWrkHrsPlcChk |   24122023 |     110000 |
      | NetWrkHrsPlcChk |   24122023 |     130000 |
      | NetWrkHrsPlcChk |   24122023 |     140000 |
      | NetWrkHrsPlcChk |   24122023 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     173000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     170000 |
      | NetWrkHrsPlcChN |   15122023 |     050000 |
      | NetWrkHrsPlcChN |   15122023 |     130000 |
      | NetWrkHrsPlcChN |   15122023 |     140000 |
      | NetWrkHrsPlcChN |   15122023 |     220000 |
      | NetWrkHrsPlcChN |   16122023 |     050000 |
      | NetWrkHrsPlcChN |   16122023 |     130000 |
      | NetWrkHrsPlcChN |   16122023 |     140000 |
      | NetWrkHrsPlcChN |   16122023 |     220000 |
      | NetWrkHrsPlcChN |   22122023 |     100000 |
      | NetWrkHrsPlcChN |   22122023 |     130000 |
      | NetWrkHrsPlcChN |   22122023 |     140000 |
      | NetWrkHrsPlcChN |   22122023 |     170000 |
      | NetWrkHrsPlcChN |   24122023 |     110000 |
      | NetWrkHrsPlcChN |   24122023 |     130000 |
      | NetWrkHrsPlcChN |   24122023 |     140000 |
      | NetWrkHrsPlcChN |   24122023 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     120000 |
      | NetWrkHrsPlcChN |   02012024 |     150000 |
      | NetWrkHrsPlcChN |   02012024 |     173000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     170000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | Net-Work | 1st Half | 2nd Half |
      | 22/12/2023 | 10:00    | 17:00    | 02:00    | PR       | PR       |
      | 24/12/2023 | 11:00    | 17:00    | 03:00    | PR       | PR       |
      | 02/01/2024 | 10:00    | 17:30    | 03:30    | PR       | PR       |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    | PR       | PR       |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | Net-Work | 1st Half | 2nd Half |
      | 22/12/2023 | 10:00    | 17:00    | 02:00    | PR       | PR       |
      | 24/12/2023 | 11:00    | 17:00    | 03:00    | PR       | PR       |
      | 02/01/2024 | 10:00    | 17:30    | 03:30    | PR       | PR       |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    | PR       | PR       |

  @MAP_24
  Scenario: Monthly Process - Custom month - Auto Atd Correction - Short Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | AutoAtdCorrectShrtLv | validation         |
      | ShLvOffHrsRes | Customized |              21 |                4 | False                | False                | False         | True                 | False            | True               | True                 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc     | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   21122023 |     094500 |
      | ShLvOffHrsRes |   21122023 |     130000 |
      | ShLvOffHrsRes |   21122023 |     140000 |
      | ShLvOffHrsRes |   21122023 |     180000 |
      | ShLvOffHrsRes |   01012024 |     094500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark     |
      | 21/12/2023 | 09:45    | 18:00    | AB       | PR       | AB:Late-IN |
      | 01/01/2024 | 09:45    | 18:00    | AB       | PR       | AB:Late-IN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      | 21/12/2023 | 09:45    | 18:00    | PR       | PR       | SHORT LEAVE |
      | 01/01/2024 | 09:45    | 18:00    | PR       | PR       | SHORT LEAVE |

  @MAP_25
  Scenario: Monthly Process - Custom month - Auto Atd Correction - Official
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | AutoAtdCorrectOfficialHrs | validation         |
      | ShLvOffHrsRes | Customized |              21 |                4 | False                | False                | False         | True                 | False            | True               | True                      | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc     | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   21122023 |     094500 |
      | ShLvOffHrsRes |   21122023 |     130000 |
      | ShLvOffHrsRes |   21122023 |     140000 |
      | ShLvOffHrsRes |   21122023 |     180000 |
      | ShLvOffHrsRes |   01012024 |     094500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark     |
      | 21/12/2023 | 09:45    | 18:00    | AB       | PR       | AB:Late-IN |
      | 01/01/2024 | 09:45    | 18:00    | AB       | PR       | AB:Late-IN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      | 21/12/2023 | 09:45    | 18:00    | PR       | PR       | OFFICIAL |
      | 01/01/2024 | 09:45    | 18:00    | PR       | PR       | OFFICIAL |

  @MAP_26
  Scenario: Monthly Process - Auto Atd Correction - Official - Official Hours Restrictions - Duration Check Per Official Hour Entry = Disable - Official Hrs Check In Attendance Period= Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes |                4 | True                      | False                 |                  |                  | False                 |                                  |                                 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091500 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     101000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     164000 |
      | ShLvOffHrsRes |   01012024 |     200000 |
      | ShLvOffHrsRes |   02012024 |     103000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     111000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     164000 |
      | ShLvOffHrsRes |   02012024 |     200000 |
      | ShLvOffHrsRes |   03012024 |     120000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     131000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     164000 |
      | ShLvOffHrsRes |   03012024 |     200000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     174500 |
      | ShLvOffHrsRes |   05012024 |     090000 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     163000 |
      | ShLvOffHrsRes |   06012024 |     090000 |
      | ShLvOffHrsRes |   06012024 |     130000 |
      | ShLvOffHrsRes |   06012024 |     140000 |
      | ShLvOffHrsRes |   06012024 |     150000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark   |
      | 01/01/2024 | 09:15    | 20:00    | PR       | PR       | OFFICIAL |
      | 02/01/2024 | 10:30    | 20:00    | PR       | PR       | OFFICIAL |
      | 03/01/2024 | 12:00    | 20:00    | PR       | PR       | OFFICIAL |
      | 04/01/2024 | 09:00    | 17:45    | PR       | PR       | OFFICIAL |
      | 05/01/2024 | 09:00    | 16:30    | PR       | PR       | OFFICIAL |
      | 06/01/2024 | 09:00    | 15:00    | PR       | PR       | OFFICIAL |

  @MAP_27
  Scenario: Monthly Process - Auto Atd Correction - Official  - Official Hours Restrictions - Duration Check Per Official Hour Entry = Enable - Official Hrs Check In Attendance Period= Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes |                4 | True                      | True                  |               15 |               30 | False                 |                                  |                                 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091400 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     101000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     164000 |
      | ShLvOffHrsRes |   01012024 |     200000 |
      | ShLvOffHrsRes |   02012024 |     092000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     111000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     164000 |
      | ShLvOffHrsRes |   02012024 |     200000 |
      | ShLvOffHrsRes |   03012024 |     093100 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     131000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     164000 |
      | ShLvOffHrsRes |   03012024 |     200000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     174600 |
      | ShLvOffHrsRes |   05012024 |     090000 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     174000 |
      | ShLvOffHrsRes |   06012024 |     090000 |
      | ShLvOffHrsRes |   06012024 |     130000 |
      | ShLvOffHrsRes |   06012024 |     140000 |
      | ShLvOffHrsRes |   06012024 |     172900 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:14    | 20:00    | AB       | PR       | AB:Late-IN   |
      | 02/01/2024 | 09:20    | 20:00    | AB       | PR       | AB:Late-IN   |
      | 03/01/2024 | 09:31    | 20:00    | AB       | PR       | AB:Late-IN   |
      | 04/01/2024 | 09:00    | 17:46    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:00    | 17:40    | PR       | AB       | AB:Early-OUT |
      | 06/01/2024 | 09:00    | 17:29    | PR       | AB       | AB:Early-OUT |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:14    | 20:00    | AB       | PR       | AB:Late-IN   |
      | 02/01/2024 | 09:20    | 20:00    | PR       | PR       | OFFICIAL     |
      | 03/01/2024 | 09:31    | 20:00    | AB       | PR       | AB:Late-IN   |
      | 04/01/2024 | 09:00    | 17:46    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:00    | 17:40    | PR       | PR       | OFFICIAL     |
      | 06/01/2024 | 09:00    | 17:29    | PR       | AB       | AB:Early-OUT |

  @MAP_28
  Scenario: Monthly Process - Auto Atd Correction - Official  - Official Hours Restrictions - Duration Check Per Official Hour Entry = Disable - Official Hrs Check In Attendance Period= Enable - Max minutes = 60
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes |                4 | True                      | False                 |                  |                  | True                  |                               60 |                              99 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     174000 |
      | ShLvOffHrsRes |   03012024 |     092000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     174900 |
      | ShLvOffHrsRes |   05012024 |     091100 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     180000 |
      | ShLvOffHrsRes |   06012024 |     090000 |
      | ShLvOffHrsRes |   06012024 |     130000 |
      | ShLvOffHrsRes |   06012024 |     140000 |
      | ShLvOffHrsRes |   06012024 |     175000 |
      | ShLvOffHrsRes |   07012024 |     090100 |
      | ShLvOffHrsRes |   07012024 |     130000 |
      | ShLvOffHrsRes |   07012024 |     140000 |
      | ShLvOffHrsRes |   07012024 |     180000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:10    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 02/01/2024 | 09:00    | 17:40    | PR       | AB       | AB:Early-OUT |
      | 03/01/2024 | 09:20    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 04/01/2024 | 09:00    | 17:49    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:11    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 06/01/2024 | 09:00    | 17:50    | PR       | AB       | AB:Early-OUT |
      | 07/01/2024 | 09:01    | 18:00    | AB       | PR       | AB:Late-IN   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:10    | 18:00    | PR       | PR       | OFFICIAL     |
      | 02/01/2024 | 09:00    | 17:40    | PR       | PR       | OFFICIAL     |
      | 03/01/2024 | 09:20    | 18:00    | PR       | PR       | OFFICIAL     |
      | 04/01/2024 | 09:00    | 17:49    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:11    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 06/01/2024 | 09:00    | 17:50    | PR       | PR       | OFFICIAL     |
      | 07/01/2024 | 09:01    | 18:00    | AB       | PR       | AB:Late-IN   |

  @MAP_29
  Scenario: Monthly Process - Auto Atd Correction - Official  - Official Hours Restrictions - Duration Check Per Official Hour Entry = Disable - Official Hrs Check In Attendance Period= Enable - Max Counts = 4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes |                4 | True                      | False                 |                  |                  | True                  |                              999 |                               4 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     174000 |
      | ShLvOffHrsRes |   03012024 |     092000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     174900 |
      | ShLvOffHrsRes |   05012024 |     091100 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     180000 |
      | ShLvOffHrsRes |   06012024 |     090000 |
      | ShLvOffHrsRes |   06012024 |     130000 |
      | ShLvOffHrsRes |   06012024 |     140000 |
      | ShLvOffHrsRes |   06012024 |     175000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:10    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 02/01/2024 | 09:00    | 17:40    | PR       | AB       | AB:Early-OUT |
      | 03/01/2024 | 09:20    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 04/01/2024 | 09:00    | 17:49    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:11    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 06/01/2024 | 09:00    | 17:50    | PR       | AB       | AB:Early-OUT |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:10    | 18:00    | PR       | PR       | OFFICIAL     |
      | 02/01/2024 | 09:00    | 17:40    | PR       | PR       | OFFICIAL     |
      | 03/01/2024 | 09:20    | 18:00    | PR       | PR       | OFFICIAL     |
      | 04/01/2024 | 09:00    | 17:49    | PR       | PR       | OFFICIAL     |
      | 05/01/2024 | 09:11    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 06/01/2024 | 09:00    | 17:50    | PR       | AB       | AB:Early-OUT |

  @MAP_30
  Scenario: Monthly Process - Auto Atd Correction - Official  - Official Hours Restrictions - Duration Check Per Official Hour Entry = Disable - Official Hrs Check In Attendance Period= Enable - Max Count 3 - Max Minutes 60
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes |                4 | True                      | False                 |                  |                  | True                  |                               60 |                               3 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     092000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     174000 |
      | ShLvOffHrsRes |   03012024 |     092000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     174900 |
      | ShLvOffHrsRes |   05012024 |     091100 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     180000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:20    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 02/01/2024 | 09:00    | 17:40    | PR       | AB       | AB:Early-OUT |
      | 03/01/2024 | 09:20    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 04/01/2024 | 09:00    | 17:49    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:11    | 18:00    | AB       | PR       | AB:Late-IN   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:20    | 18:00    | PR       | PR       | OFFICIAL     |
      | 02/01/2024 | 09:00    | 17:40    | PR       | PR       | OFFICIAL     |
      | 03/01/2024 | 09:20    | 18:00    | PR       | PR       | OFFICIAL     |
      | 04/01/2024 | 09:00    | 17:49    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:11    | 18:00    | AB       | PR       | AB:Late-IN   |

  @MAP_31
  Scenario: Monthly Process - Auto Atd Correction - Official  - Official Hours Restrictions - Duration Check Per Official Hour Entry = Enable - Min = 5 - Max = 30 - Official Hrs Check In Attendance Period= Enable - Max Count 4 - Max Minutes 80
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes |                4 | True                      | True                  |                5 |               30 | True                  |                               80 |                               4 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     092500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090200 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     173500 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     172500 |
      | ShLvOffHrsRes |   05012024 |     092500 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     180000 |
      | ShLvOffHrsRes |   06012024 |     092500 |
      | ShLvOffHrsRes |   06012024 |     130000 |
      | ShLvOffHrsRes |   06012024 |     140000 |
      | ShLvOffHrsRes |   06012024 |     180000 |
      | ShLvOffHrsRes |   07012024 |     090000 |
      | ShLvOffHrsRes |   07012024 |     130000 |
      | ShLvOffHrsRes |   07012024 |     140000 |
      | ShLvOffHrsRes |   07012024 |     175500 |
      | ShLvOffHrsRes |   08012024 |     090000 |
      | ShLvOffHrsRes |   08012024 |     130000 |
      | ShLvOffHrsRes |   08012024 |     140000 |
      | ShLvOffHrsRes |   08012024 |     175500 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 02/01/2024 | 09:02    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 03/01/2024 | 09:00    | 17:35    | PR       | AB       | AB:Early-OUT |
      | 04/01/2024 | 09:00    | 17:25    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 06/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 07/01/2024 | 09:00    | 17:55    | PR       | AB       | AB:Early-OUT |
      | 08/01/2024 | 09:00    | 17:55    | PR       | AB       | AB:Early-OUT |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 01/01/2024 | 09:25    | 18:00    | PR       | PR       | OFFICIAL     |
      | 02/01/2024 | 09:02    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 03/01/2024 | 09:00    | 17:35    | PR       | PR       | OFFICIAL     |
      | 04/01/2024 | 09:00    | 17:25    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:25    | 18:00    | PR       | PR       | OFFICIAL     |
      | 06/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 07/01/2024 | 09:00    | 17:55    | PR       | PR       | OFFICIAL     |
      | 08/01/2024 | 09:00    | 17:55    | PR       | AB       | AB:Early-OUT |

  @MAP_32
  Scenario: Monthly Process - Custom month - Auto Atd Correction - Official  - Official Hours Restrictions - Duration Check Per Official Hour Entry = Enable - Min = 5 - Max = 30 - Official Hrs Check In Attendance Period= Enable - Max Count 4 - Max Minutes 80
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | AutoAtdCorrectOfficialHrs | DurChkPerOffcHrsEntry | MinDurPerOffcHrs | MaxDurPerOffcHrs | OffcHrsChkInAtdPeriod | MaxMinutesAlwdInAtdPeriodOffcHrs | MaxCountsAlwdInAtdPeriodOffcHrs | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | ShLvOffHrsRes | Customized |              21 |                4 | True                      | True                  |                5 |               30 | True                  |                               80 |                               4 | False         | True                 | False            | True               | Saved Successfully |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |         0 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name          | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True               |           0 |                          | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc   | LateInPlc     | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   21122023 |     092500 |
      | ShLvOffHrsRes |   21122023 |     130000 |
      | ShLvOffHrsRes |   21122023 |     140000 |
      | ShLvOffHrsRes |   21122023 |     180000 |
      | ShLvOffHrsRes |   23122023 |     090200 |
      | ShLvOffHrsRes |   23122023 |     130000 |
      | ShLvOffHrsRes |   23122023 |     140000 |
      | ShLvOffHrsRes |   23122023 |     180000 |
      | ShLvOffHrsRes |   25122023 |     090000 |
      | ShLvOffHrsRes |   25122023 |     130000 |
      | ShLvOffHrsRes |   25122023 |     140000 |
      | ShLvOffHrsRes |   25122023 |     173500 |
      | ShLvOffHrsRes |   31122023 |     090000 |
      | ShLvOffHrsRes |   31122023 |     130000 |
      | ShLvOffHrsRes |   31122023 |     140000 |
      | ShLvOffHrsRes |   31122023 |     172500 |
      | ShLvOffHrsRes |   05012024 |     092500 |
      | ShLvOffHrsRes |   05012024 |     130000 |
      | ShLvOffHrsRes |   05012024 |     140000 |
      | ShLvOffHrsRes |   05012024 |     180000 |
      | ShLvOffHrsRes |   06012024 |     092500 |
      | ShLvOffHrsRes |   06012024 |     130000 |
      | ShLvOffHrsRes |   06012024 |     140000 |
      | ShLvOffHrsRes |   06012024 |     180000 |
      | ShLvOffHrsRes |   07012024 |     090000 |
      | ShLvOffHrsRes |   07012024 |     130000 |
      | ShLvOffHrsRes |   07012024 |     140000 |
      | ShLvOffHrsRes |   07012024 |     175500 |
      | ShLvOffHrsRes |   08012024 |     090000 |
      | ShLvOffHrsRes |   08012024 |     130000 |
      | ShLvOffHrsRes |   08012024 |     140000 |
      | ShLvOffHrsRes |   08012024 |     175500 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 21/12/2023 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 23/12/2023 | 09:02    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 25/12/2023 | 09:00    | 17:35    | PR       | AB       | AB:Early-OUT |
      | 31/12/2023 | 09:00    | 17:25    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 06/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 07/01/2024 | 09:00    | 17:55    | PR       | AB       | AB:Early-OUT |
      | 08/01/2024 | 09:00    | 17:55    | PR       | AB       | AB:Early-OUT |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark       |
      | 21/12/2023 | 09:25    | 18:00    | PR       | PR       | OFFICIAL     |
      | 23/12/2023 | 09:02    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 25/12/2023 | 09:00    | 17:35    | PR       | PR       | OFFICIAL     |
      | 31/12/2023 | 09:00    | 17:25    | PR       | AB       | AB:Early-OUT |
      | 05/01/2024 | 09:25    | 18:00    | PR       | PR       | OFFICIAL     |
      | 06/01/2024 | 09:25    | 18:00    | AB       | PR       | AB:Late-IN   |
      | 07/01/2024 | 09:00    | 17:55    | PR       | PR       | OFFICIAL     |
      | 08/01/2024 | 09:00    | 17:55    | PR       | AB       | AB:Early-OUT |

  @MAP_33
  Scenario: Monthly Process - Custom month - Monthly Overtime
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Delete "DK" shift schedule
    And Delete "Dk" shift
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        19900 |     00000 | OT1        |   1.00 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | DK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "DK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | DK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "DK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create Attendance Policy
      | PlcName   | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | validation         |
      | TNACustom | Customized |              21 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TNACustom     |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TNACustom     |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | TandAWeeklyfour | 23/12/2023 | 24/12/2023 |          |        0 |                |
      | TandAWeeklyN    | 23/12/2023 | 24/12/2023 |          |        0 |                |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   21122023 |     070000 |
      | TandAWeeklyfour |   21122023 |     130000 |
      | TandAWeeklyfour |   21122023 |     140000 |
      | TandAWeeklyfour |   21122023 |     200000 |
      | TandAWeeklyfour |   22122023 |     070000 |
      | TandAWeeklyfour |   22122023 |     130000 |
      | TandAWeeklyfour |   22122023 |     140000 |
      | TandAWeeklyfour |   22122023 |     200000 |
      | TandAWeeklyfour |   23122023 |     070000 |
      | TandAWeeklyfour |   23122023 |     130000 |
      | TandAWeeklyfour |   23122023 |     140000 |
      | TandAWeeklyfour |   23122023 |     200000 |
      | TandAWeeklyfour |   24122023 |     070000 |
      | TandAWeeklyfour |   24122023 |     130000 |
      | TandAWeeklyfour |   24122023 |     140000 |
      | TandAWeeklyfour |   24122023 |     200000 |
      | TandAWeeklyfour |   30122023 |     070000 |
      | TandAWeeklyfour |   30122023 |     130000 |
      | TandAWeeklyfour |   30122023 |     140000 |
      | TandAWeeklyfour |   30122023 |     200000 |
      | TandAWeeklyfour |   08012024 |     090000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     180000 |
      | TandAWeeklyfour |   09012024 |     090000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     180000 |
      | TandAWeeklyfour |   10012024 |     090000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     180000 |
      | TandAWeeklyfour |   11012024 |     090000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     180000 |
      | TandAWeeklyfour |   12012024 |     090000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     180000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
      | TandAWeeklyN    |   21122023 |     070000 |
      | TandAWeeklyN    |   21122023 |     090000 |
      | TandAWeeklyN    |   21122023 |     091500 |
      | TandAWeeklyN    |   21122023 |     130000 |
      | TandAWeeklyN    |   21122023 |     133000 |
      | TandAWeeklyN    |   21122023 |     175000 |
      | TandAWeeklyN    |   21122023 |     180000 |
      | TandAWeeklyN    |   21122023 |     200000 |
      | TandAWeeklyN    |   22122023 |     070000 |
      | TandAWeeklyN    |   22122023 |     090000 |
      | TandAWeeklyN    |   22122023 |     091500 |
      | TandAWeeklyN    |   22122023 |     130000 |
      | TandAWeeklyN    |   22122023 |     133000 |
      | TandAWeeklyN    |   22122023 |     175000 |
      | TandAWeeklyN    |   22122023 |     180000 |
      | TandAWeeklyN    |   22122023 |     200000 |
      | TandAWeeklyN    |   23122023 |     071500 |
      | TandAWeeklyN    |   23122023 |     090000 |
      | TandAWeeklyN    |   23122023 |     091500 |
      | TandAWeeklyN    |   23122023 |     130000 |
      | TandAWeeklyN    |   23122023 |     133000 |
      | TandAWeeklyN    |   23122023 |     175000 |
      | TandAWeeklyN    |   23122023 |     180000 |
      | TandAWeeklyN    |   23122023 |     200000 |
      | TandAWeeklyN    |   24122023 |     071500 |
      | TandAWeeklyN    |   24122023 |     090000 |
      | TandAWeeklyN    |   24122023 |     091500 |
      | TandAWeeklyN    |   24122023 |     130000 |
      | TandAWeeklyN    |   24122023 |     133000 |
      | TandAWeeklyN    |   24122023 |     175000 |
      | TandAWeeklyN    |   24122023 |     180000 |
      | TandAWeeklyN    |   24122023 |     200000 |
      | TandAWeeklyN    |   30122023 |     070000 |
      | TandAWeeklyN    |   30122023 |     090000 |
      | TandAWeeklyN    |   30122023 |     091500 |
      | TandAWeeklyN    |   30122023 |     130000 |
      | TandAWeeklyN    |   30122023 |     133000 |
      | TandAWeeklyN    |   30122023 |     175000 |
      | TandAWeeklyN    |   30122023 |     180000 |
      | TandAWeeklyN    |   30122023 |     200000 |
      | TandAWeeklyN    |   08012024 |     071500 |
      | TandAWeeklyN    |   08012024 |     090000 |
      | TandAWeeklyN    |   08012024 |     091500 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   09012024 |     071500 |
      | TandAWeeklyN    |   09012024 |     090000 |
      | TandAWeeklyN    |   09012024 |     091500 |
      | TandAWeeklyN    |   09012024 |     130000 |
      | TandAWeeklyN    |   09012024 |     133000 |
      | TandAWeeklyN    |   09012024 |     175000 |
      | TandAWeeklyN    |   09012024 |     180000 |
      | TandAWeeklyN    |   09012024 |     200000 |
      | TandAWeeklyN    |   10012024 |     071500 |
      | TandAWeeklyN    |   10012024 |     090000 |
      | TandAWeeklyN    |   10012024 |     091500 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     133000 |
      | TandAWeeklyN    |   10012024 |     175000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     145000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/12/2023 | 07:00    | 20:00    |                    |                     |
      | 22/12/2023 | 07:00    | 20:00    |                    |                     |
      | 23/12/2023 | 07:00    | 20:00    |                    |                     |
      | 24/12/2023 | 07:00    | 20:00    |                    |                     |
      | 25/12/2023 |          |          |                    |                     |
      | 26/12/2023 |          |          |                    |                     |
      | 27/12/2023 |          |          |                    |                     |
      | 28/12/2023 |          |          |                    |                     |
      | 29/12/2023 |          |          |                    |                     |
      | 30/12/2023 | 07:00    | 20:00    |                    |                     |
      | 31/12/2023 |          |          |                    |                     |
      | 01/01/2024 |          |          |                    |                     |
      | 02/01/2024 |          |          |                    |                     |
      | 03/01/2024 |          |          |                    |                     |
      | 04/01/2024 |          |          |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/12/2023 | 07:00    | 20:00    |                    |                     |
      | 22/12/2023 | 07:00    | 20:00    |                    |                     |
      | 23/12/2023 | 07:15    | 20:00    |                    |                     |
      | 24/12/2023 | 07:15    | 20:00    |                    |                     |
      | 25/12/2023 |          |          |                    |                     |
      | 26/12/2023 |          |          |                    |                     |
      | 27/12/2023 |          |          |                    |                     |
      | 28/12/2023 |          |          |                    |                     |
      | 29/12/2023 |          |          |                    |                     |
      | 30/12/2023 | 07:00    | 20:00    |                    |                     |
      | 31/12/2023 |          |          |                    |                     |
      | 01/01/2024 |          |          |                    |                     |
      | 02/01/2024 |          |          |                    |                     |
      | 03/01/2024 |          |          |                    |                     |
      | 04/01/2024 |          |          |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 22/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 23/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 24/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 25/12/2023 |          |          |                    |                     |
      | 26/12/2023 |          |          |                    |                     |
      | 27/12/2023 |          |          |                    |                     |
      | 28/12/2023 |          |          |                    |                     |
      | 29/12/2023 |          |          |                    |                     |
      | 30/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 31/12/2023 |          |          |                    |                     |
      | 01/01/2024 |          |          |                    |                     |
      | 02/01/2024 |          |          |                    |                     |
      | 03/01/2024 |          |          |                    |                     |
      | 04/01/2024 |          |          |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          | 24:00              | 24:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 21/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 22/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 23/12/2023 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 24/12/2023 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 25/12/2023 |          |          |                    |                     |
      | 26/12/2023 |          |          |                    |                     |
      | 27/12/2023 |          |          |                    |                     |
      | 28/12/2023 |          |          |                    |                     |
      | 29/12/2023 |          |          |                    |                     |
      | 30/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 31/12/2023 |          |          |                    |                     |
      | 01/01/2024 |          |          |                    |                     |
      | 02/01/2024 |          |          |                    |                     |
      | 03/01/2024 |          |          |                    |                     |
      | 04/01/2024 |          |          |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          | 11:50              | 11:50               |

  @MAP_34
  Scenario: Monthly Process - Custom month - Weekly Overtime
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Delete "DK" shift schedule
    And Delete "Dk" shift
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
    And Create Attendance Policy
      | PlcName    | AtdPeriod  | MonthStartEndDt | MaxPunchesToCons | validation         |
      | TNACustom2 | Customized |              21 |                4 | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | DK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "DK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | DK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "DK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TNACustom2    |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TNACustom2    |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Shift Process for Month = "December" and Year = "2023"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "December" and Year = "2023"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   18122023 |     070000 |
      | TandAWeeklyfour |   18122023 |     130000 |
      | TandAWeeklyfour |   18122023 |     140000 |
      | TandAWeeklyfour |   18122023 |     200000 |
      | TandAWeeklyfour |   19122023 |     070000 |
      | TandAWeeklyfour |   19122023 |     130000 |
      | TandAWeeklyfour |   19122023 |     140000 |
      | TandAWeeklyfour |   19122023 |     200000 |
      | TandAWeeklyfour |   20122023 |     070000 |
      | TandAWeeklyfour |   20122023 |     130000 |
      | TandAWeeklyfour |   20122023 |     140000 |
      | TandAWeeklyfour |   20122023 |     200000 |
      | TandAWeeklyfour |   21122023 |     070000 |
      | TandAWeeklyfour |   21122023 |     130000 |
      | TandAWeeklyfour |   21122023 |     140000 |
      | TandAWeeklyfour |   21122023 |     200000 |
      | TandAWeeklyfour |   22122023 |     070000 |
      | TandAWeeklyfour |   22122023 |     130000 |
      | TandAWeeklyfour |   22122023 |     140000 |
      | TandAWeeklyfour |   22122023 |     200000 |
      | TandAWeeklyfour |   23122023 |     070000 |
      | TandAWeeklyfour |   23122023 |     130000 |
      | TandAWeeklyfour |   23122023 |     140000 |
      | TandAWeeklyfour |   23122023 |     200000 |
      | TandAWeeklyN    |   18122023 |     070000 |
      | TandAWeeklyN    |   18122023 |     090000 |
      | TandAWeeklyN    |   18122023 |     091500 |
      | TandAWeeklyN    |   18122023 |     130000 |
      | TandAWeeklyN    |   18122023 |     133000 |
      | TandAWeeklyN    |   18122023 |     175000 |
      | TandAWeeklyN    |   18122023 |     180000 |
      | TandAWeeklyN    |   18122023 |     200000 |
      | TandAWeeklyN    |   19122023 |     070000 |
      | TandAWeeklyN    |   19122023 |     090000 |
      | TandAWeeklyN    |   19122023 |     091500 |
      | TandAWeeklyN    |   19122023 |     130000 |
      | TandAWeeklyN    |   19122023 |     133000 |
      | TandAWeeklyN    |   19122023 |     175000 |
      | TandAWeeklyN    |   19122023 |     180000 |
      | TandAWeeklyN    |   19122023 |     200000 |
      | TandAWeeklyN    |   20122023 |     071500 |
      | TandAWeeklyN    |   20122023 |     090000 |
      | TandAWeeklyN    |   20122023 |     091500 |
      | TandAWeeklyN    |   20122023 |     130000 |
      | TandAWeeklyN    |   20122023 |     133000 |
      | TandAWeeklyN    |   20122023 |     175000 |
      | TandAWeeklyN    |   20122023 |     180000 |
      | TandAWeeklyN    |   20122023 |     200000 |
      | TandAWeeklyN    |   21122023 |     071500 |
      | TandAWeeklyN    |   21122023 |     090000 |
      | TandAWeeklyN    |   21122023 |     091500 |
      | TandAWeeklyN    |   21122023 |     130000 |
      | TandAWeeklyN    |   21122023 |     133000 |
      | TandAWeeklyN    |   21122023 |     175000 |
      | TandAWeeklyN    |   21122023 |     180000 |
      | TandAWeeklyN    |   21122023 |     200000 |
      | TandAWeeklyN    |   22122023 |     071500 |
      | TandAWeeklyN    |   22122023 |     090000 |
      | TandAWeeklyN    |   22122023 |     091500 |
      | TandAWeeklyN    |   22122023 |     130000 |
      | TandAWeeklyN    |   22122023 |     133000 |
      | TandAWeeklyN    |   22122023 |     175000 |
      | TandAWeeklyN    |   22122023 |     180000 |
      | TandAWeeklyN    |   22122023 |     200000 |
      | TandAWeeklyN    |   23122023 |     070000 |
      | TandAWeeklyN    |   23122023 |     090000 |
      | TandAWeeklyN    |   23122023 |     091500 |
      | TandAWeeklyN    |   23122023 |     130000 |
      | TandAWeeklyN    |   23122023 |     133000 |
      | TandAWeeklyN    |   23122023 |     175000 |
      | TandAWeeklyN    |   23122023 |     180000 |
      | TandAWeeklyN    |   23122023 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "18/12/2023" and "24/12/2023"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 18/12/2023 | 07:00    | 20:00    |                    |                     |
      | 19/12/2023 | 07:00    | 20:00    |                    |                     |
      | 20/12/2023 | 07:00    | 20:00    |                    |                     |
      | 21/12/2023 | 07:00    | 20:00    |                    |                     |
      | 22/12/2023 | 07:00    | 20:00    |                    |                     |
      | 23/12/2023 | 07:00    | 20:00    |                    |                     |
      | 24/12/2023 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "18/12/2023" and "24/12/2023"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 18/12/2023 | 07:00    | 20:00    |                    |                     |
      | 19/12/2023 | 07:00    | 20:00    |                    |                     |
      | 20/12/2023 | 07:15    | 20:00    |                    |                     |
      | 21/12/2023 | 07:15    | 20:00    |                    |                     |
      | 22/12/2023 | 07:15    | 20:00    |                    |                     |
      | 23/12/2023 | 07:00    | 20:00    |                    |                     |
      | 24/12/2023 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "December" and Year = "2023"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "18/12/2023" and "24/12/2023"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 18/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 19/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 20/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 21/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 22/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 23/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 24/12/2023 |          |          | 08:00              | 08:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "18/12/2023" and "24/12/2023"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 18/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 19/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 20/12/2023 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 21/12/2023 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 22/12/2023 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 23/12/2023 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 24/12/2023 |          |          | 08:30              | 08:30               |

  @MAP_35
  Scenario: Previous Adjustment
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | PrevAdjust |
    And Delete "ZI" shift schedule
    And Delete "ZI" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZI      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZI      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZI"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | AtdEnable | MaxPunchesToBeConsidered | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | PrevAdjust | True   | True      |                        4 | True      | ZI            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | PrevAdjust |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID     |
      | PrevAdjust |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | PrevAdjust |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | PrevAdjust |
    When Previous adjustment from TnA module
      | UserId     | PrevAtdDt  | AtdDetails | TargetMonth | TargetYear | AtdDays | WorkHrs | Overtime | ShiftAllowance | Remark  |
      | PrevAdjust | 31/01/2024 | Current    | February    |       2024 | +2      | -08:00  | +04:00   |             -3 | Ajusted |
    Then Verify Previous adjustment for user "PrevAdjust" from TnA module
      | Adjusted Date | Target Month | Target Year | Generated By |
      | 31/01/2024    | February     |        2024 | Manual       |

      @MAP_36
  Scenario: Club Cover Case1 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MA      | MA        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "MA" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MA      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MA         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | FIT6974_1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MA         |        |       |      |          | credit | 100:00 |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |        1 |                |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -3 |     090000 |
      | FIT6974_1 |         -3 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | FIT6974_1 |                  4 |         -1 |       -1 | MA         |                     1 |              -1 | 09:00             | 18:00           | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

  @MAP_37
  Scenario: Club Cover Case2 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MA      | MA        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "MA" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MA      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MA         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | FIT6974_1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MA         |        |       |      |          | credit | 100:00 |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |          |              1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -3 |     090000 |
      | FIT6974_1 |         -3 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | FIT6974_1 |                  4 |         -1 |       -1 | MA         |                     1 |              -1 | 09:00             | 18:00           | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

  @MAP_38
  Scenario: Club Cover Case3 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MA      | MA        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "MA" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MA      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MA         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | FIT6974_1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MA         |        |       |      |          | credit | 100:00 |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |        1 |                |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -1 |     090000 |
      | FIT6974_1 |         -1 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | FIT6974_1 |                  4 |         -3 |       -3 | MA         |                     1 |              -1 | 09:00             | 18:00           | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

  @MAP_39
  Scenario: Club Cover Case4 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MA      | MA        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "MA" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MA      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MA         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | FIT6974_1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MA         |        |       |      |          | credit | 100:00 |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |          |              1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -1 |     090000 |
      | FIT6974_1 |         -1 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | FIT6974_1 |                  4 |         -3 |       -3 | MA         |                     1 |              -1 | 09:00             | 18:00           | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

      @MAP_40
  Scenario: Club Cover Case5 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | MB      | MB        | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MB" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MB      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MB         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | FIT6974_1 |          0 |           0 |   10 | MB         |        |       |      |          | credit |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |        1 |                |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -3 |     090000 |
      | FIT6974_1 |         -3 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FIT6974_1 |                  1 |         -1 |       -1 | MB         |                     1 | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

  @MAP_41
  Scenario: Club Cover Case6 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | MB      | MB        | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MB" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MB      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MB         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | FIT6974_1 |          0 |           0 |   10 | MB         |        |       |      |          | credit |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |          |              1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -3 |     090000 |
      | FIT6974_1 |         -3 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FIT6974_1 |                  1 |         -1 |       -1 | MB         |                     1 | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

  @MAP_42
  Scenario: Club Cover Case7 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | MB      | MB        | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MB" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MB      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MB         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | FIT6974_1 |          0 |           0 |   10 | MB         |        |       |      |          | credit |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |        1 |                |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -1 |     090000 |
      | FIT6974_1 |         -1 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FIT6974_1 |                  1 |         -3 |       -3 | MB         |                     1 | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |

  @MAP_43
  Scenario: Club Cover Case8 - FIT6974
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | FIT6974_1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | MB      | MB        | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MB" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | MB      | false          |
    And Create user from user configuration
      | userid    | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FIT6974_1 | True   | True      | True      | True      | True      | True               |                        2 | MB         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | FIT6974_1 |          0 |           0 |   10 | MB         |        |       |      |          | credit |
    And Change Shift via API
      | userid    | FromDt | ToDt | shift-id | week-off | public-holiday |
      | FIT6974_1 |     -3 |   -1 |          |        0 |                |
      | FIT6974_1 |     -2 |   -2 |          |          |              1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | FIT6974_1 |         -1 |     090000 |
      | FIT6974_1 |         -1 |     180000 |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FIT6974_1 |                  1 |         -3 |       -3 | MB         |                     1 | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FIT6974_1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FIT6974_1 |
      
      