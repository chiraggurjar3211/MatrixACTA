@tag
Feature: Attendance Policy - Less Working Hours Check
  I want to use this template for my feature file

  @LWH_1
  Scenario: LessWorkHrs - Check Disable
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | False            |                       |                        |                       |                       |                       |                       | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     173000 |
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
      | LessWorkHrs |   05012024 |     180000 |
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     101500 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     091500 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     101500 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     173000 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     101500 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 17:15    | PR       | AB       | 07:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:15    | 17:30    | PR       | AB       | 07:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:15      |                  |

  @LWH_2
  Scenario: LessWorkHrs - Daily Allowed Limit Min = 30
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    30 | Monthly Count          |                    31 |                       | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     173000 |
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
      | LessWorkHrs |   05012024 |     172000 |
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     130000 |
      | LessWorkHrs |   06012024 |     144000 |
      | LessWorkHrs |   06012024 |     180000 |
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     101500 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     091500 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     101500 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     173000 |
      | LessWorkHrN |   03012024 |     091500 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     101500 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     172000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                  |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                  |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 09:00    | 17:20    | PR       | AB       | 07:20      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:20      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                  |
      | 02/01/2024 | 09:15    | 17:30    | PR       | PR       | 07:30      |                  |
      | 03/01/2024 | 09:15    | 17:20    | PR       | AB       | 07:20      | AB:Less Work Hrs |

  @LWH_3
  Scenario: LessWorkHrs - Monthly Count - Max Count 2 - AB marking type = Continuous - Mark Absent = Half Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Monthly Count          |                     2 |                       | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     173000 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     101500 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     101500 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     171500 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     101500 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     171500 |
      | LessWorkHrN |   04012024 |     090000 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     101500 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     171500 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     101500 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     171500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 17:15    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 17:15    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:15    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |

  @LWH_4
  Scenario: LessWorkHrs - Monthly Count - Max Count 2 - AB marking type = Continuous - Mark Absent = Full Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Monthly Count          |                     2 |                       | Continuous            | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     173000 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     101500 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     101500 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     171500 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     101500 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     171500 |
      | LessWorkHrN |   04012024 |     090000 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     101500 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     171500 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     101500 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     171500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 17:15    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 17:15    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:15    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |

  @LWH_5
  Scenario: LessWorkHrs - Monthly Count - Max Count 2 - AB marking type = Slab Wise - Mark Absent = Half Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Monthly Count          |                     2 |                       | Slab Wise             | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     173000 |
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
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     130000 |
      | LessWorkHrs |   06012024 |     140000 |
      | LessWorkHrs |   06012024 |     173000 |
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     101500 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     101500 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     171500 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     101500 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     171500 |
      | LessWorkHrN |   04012024 |     090000 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     101500 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     171500 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     101500 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     171500 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     101500 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     171500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 17:15    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 05/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:15    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |

  @LWH_6
  Scenario: LessWorkHrs - Monthly Count - Max Count 2 - AB marking type = Slab Wise - Mark Absent = Full Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Monthly Count          |                     2 |                       | Slab Wise             | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     173000 |
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
      | LessWorkHrs |   06012024 |     090000 |
      | LessWorkHrs |   06012024 |     130000 |
      | LessWorkHrs |   06012024 |     140000 |
      | LessWorkHrs |   06012024 |     173000 |
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     101500 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     101500 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     171500 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     101500 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     171500 |
      | LessWorkHrN |   04012024 |     090000 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     101500 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     171500 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     101500 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     171500 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     101500 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     171500 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 02/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 17:15    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 05/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:15    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |

  @LWH_7
  Scenario: LessWorkHrs - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    45 | Monthly Duration       |                       |                    60 | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090100 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     180000 |
      | LessWorkHrs |   02012024 |     090000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     143000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     093000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     140000 |
      | LessWorkHrs |   03012024 |     180000 |
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
      | LessWorkHrs |   06012024 |     143000 |
      | LessWorkHrs |   06012024 |     180000 |
      | LessWorkHrs |   07012024 |     090000 |
      | LessWorkHrs |   07012024 |     130000 |
      | LessWorkHrs |   07012024 |     140000 |
      | LessWorkHrs |   07012024 |     173300 |
      | LessWorkHrs |   08012024 |     090100 |
      | LessWorkHrs |   08012024 |     130000 |
      | LessWorkHrs |   08012024 |     140000 |
      | LessWorkHrs |   08012024 |     180000 |
      | LessWorkHrN |   01012024 |     090100 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     180000 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     173000 |
      | LessWorkHrN |   03012024 |     093000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     173000 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     173300 |
      | LessWorkHrN |   08012024 |     090100 |
      | LessWorkHrN |   08012024 |     100000 |
      | LessWorkHrN |   08012024 |     103000 |
      | LessWorkHrN |   08012024 |     160000 |
      | LessWorkHrN |   08012024 |     163000 |
      | LessWorkHrN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 06/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:33    | PR       | PR       | 07:33      |                              |
      | 08/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 06/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:33    | PR       | PR       | 07:33      |                              |
      | 08/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |

  @LWH_8
  Scenario: LessWorkHrs - Monthly Duration - Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    45 | Monthly Duration       |                       |                    60 | Continuous            | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090100 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     180000 |
      | LessWorkHrs |   02012024 |     090000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     143000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     093000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     140000 |
      | LessWorkHrs |   03012024 |     180000 |
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
      | LessWorkHrs |   06012024 |     143000 |
      | LessWorkHrs |   06012024 |     180000 |
      | LessWorkHrs |   07012024 |     090000 |
      | LessWorkHrs |   07012024 |     130000 |
      | LessWorkHrs |   07012024 |     140000 |
      | LessWorkHrs |   07012024 |     173300 |
      | LessWorkHrs |   08012024 |     090100 |
      | LessWorkHrs |   08012024 |     130000 |
      | LessWorkHrs |   08012024 |     140000 |
      | LessWorkHrs |   08012024 |     180000 |
      | LessWorkHrN |   01012024 |     090100 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     180000 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     173000 |
      | LessWorkHrN |   03012024 |     093000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     173000 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     173300 |
      | LessWorkHrN |   08012024 |     090100 |
      | LessWorkHrN |   08012024 |     100000 |
      | LessWorkHrN |   08012024 |     103000 |
      | LessWorkHrN |   08012024 |     160000 |
      | LessWorkHrN |   08012024 |     163000 |
      | LessWorkHrN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 06/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:33    | PR       | PR       | 07:33      |                              |
      | 08/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 06/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:33    | PR       | PR       | 07:33      |                              |
      | 08/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |

  @LWH_9
  Scenario: LessWorkHrs - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    45 | Monthly Duration       |                       |                    60 | Slab Wise             | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090100 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     180000 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     123000 |
      | LessWorkHrs |   03012024 |     140000 |
      | LessWorkHrs |   03012024 |     180000 |
      | LessWorkHrs |   04012024 |     091400 |
      | LessWorkHrs |   04012024 |     130000 |
      | LessWorkHrs |   04012024 |     140000 |
      | LessWorkHrs |   04012024 |     180000 |
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
      | LessWorkHrN |   01012024 |     090100 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     180000 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     173000 |
      | LessWorkHrN |   03012024 |     093000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     091400 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     173000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     174500 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:14    | 18:00    | PR       | PR       | 07:46      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 07/01/2024 | 09:00    | 17:59    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:14    | 18:00    | PR       | PR       | 07:46      |                              |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 07/01/2024 | 09:00    | 17:59    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |

  @LWH_10
  Scenario: LessWorkHrs - Monthly Duration - Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Full Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    45 | Monthly Duration       |                       |                    60 | Slab Wise             | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090100 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     180000 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     123000 |
      | LessWorkHrs |   03012024 |     140000 |
      | LessWorkHrs |   03012024 |     180000 |
      | LessWorkHrs |   04012024 |     091400 |
      | LessWorkHrs |   04012024 |     130000 |
      | LessWorkHrs |   04012024 |     140000 |
      | LessWorkHrs |   04012024 |     180000 |
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
      | LessWorkHrN |   01012024 |     090100 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     180000 |
      | LessWorkHrN |   02012024 |     090000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     173000 |
      | LessWorkHrN |   03012024 |     093000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     091400 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     173000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     174500 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     175900 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:14    | 18:00    | PR       | PR       | 07:46      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 07/01/2024 | 09:00    | 17:59    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:14    | 18:00    | PR       | PR       | 07:46      |                              |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 06/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 07/01/2024 | 09:00    | 17:59    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |

  @LWH_11
  Scenario: LessWorkHrs - Both - Max Count 2 & Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day - Case1
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Both                   |                     2 |                    60 | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     174500 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     174500 |
      | LessWorkHrN |   02012024 |     091500 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     093000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     090000 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     173000 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 02/01/2024 | 09:15    | 18:00    | PR       | PR       | 07:45      |                              |
      | 03/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 02/01/2024 | 09:15    | 18:00    | PR       | PR       | 07:45      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |

  @LWH_12
  Scenario: LessWorkHrs - Both - Max Count 2 & Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day - Case2
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Both                   |                     2 |                    60 | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     171500 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     143000 |
      | LessWorkHrs |   03012024 |     180000 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     093000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     173000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     173000 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:50    | PR       | AB       | 07:50      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:50    | PR       | AB       | 07:50      | Half Day AB:Work Hours Limit |

  @LWH_13
  Scenario: LessWorkHrs - Both - Max Count 2 & Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day - Case1
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Both                   |                     2 |                    60 | Continuous            | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     174500 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     174500 |
      | LessWorkHrN |   02012024 |     091500 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     093000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     090000 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     173000 |
      | LessWorkHrN |   05012024 |     090000 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 02/01/2024 | 09:15    | 18:00    | PR       | PR       | 07:45      |                              |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:45    | PR       | PR       | 07:45      |                              |
      | 02/01/2024 | 09:15    | 18:00    | PR       | PR       | 07:45      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 05/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |

  @LWH_14
  Scenario: LessWorkHrs - Both - Max Count 2 & Max Duration 60 min - AB marking type = Continuous - Mark Absent = Full Day - Case2
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Both                   |                     2 |                    60 | Continuous            | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     171500 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     143000 |
      | LessWorkHrs |   03012024 |     180000 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     093000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     173000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     173000 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     175000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:50    | AB       | AB       | 07:50      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 07/01/2024 | 09:00    | 17:50    | AB       | AB       | 07:50      | Full Day AB:Work Hours Limit |

  @LWH_15
  Scenario: LessWorkHrs - Both - Max Count 2 & Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Half Day - Case1
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Both                   |                     2 |                    60 | Slab Wise             | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     171500 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     143000 |
      | LessWorkHrs |   03012024 |     180000 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     093000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     173000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     173000 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     175000 |
      | LessWorkHrN |   08012024 |     090100 |
      | LessWorkHrN |   08012024 |     100000 |
      | LessWorkHrN |   08012024 |     103000 |
      | LessWorkHrN |   08012024 |     160000 |
      | LessWorkHrN |   08012024 |     163000 |
      | LessWorkHrN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 07/01/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                              |
      | 08/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | Half Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 07/01/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                              |
      | 08/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |

  @LWH_16
  Scenario: LessWorkHrs - Both - Max Count 2 & Max Duration 60 min - AB marking type = Slab Wise - Mark Absent = Full Day - Case1
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    60 | Both                   |                     2 |                    60 | Slab Wise             | Full Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     090000 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     171500 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     090000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     143000 |
      | LessWorkHrs |   03012024 |     180000 |
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
      | LessWorkHrN |   01012024 |     090000 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     171500 |
      | LessWorkHrN |   02012024 |     093000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     090000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     173000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
      | LessWorkHrN |   06012024 |     090000 |
      | LessWorkHrN |   06012024 |     100000 |
      | LessWorkHrN |   06012024 |     103000 |
      | LessWorkHrN |   06012024 |     160000 |
      | LessWorkHrN |   06012024 |     163000 |
      | LessWorkHrN |   06012024 |     173000 |
      | LessWorkHrN |   07012024 |     090000 |
      | LessWorkHrN |   07012024 |     100000 |
      | LessWorkHrN |   07012024 |     103000 |
      | LessWorkHrN |   07012024 |     160000 |
      | LessWorkHrN |   07012024 |     163000 |
      | LessWorkHrN |   07012024 |     175000 |
      | LessWorkHrN |   08012024 |     090100 |
      | LessWorkHrN |   08012024 |     100000 |
      | LessWorkHrN |   08012024 |     103000 |
      | LessWorkHrN |   08012024 |     160000 |
      | LessWorkHrN |   08012024 |     163000 |
      | LessWorkHrN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 07/01/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                              |
      | 08/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 17:15    | PR       | PR       | 07:15      |                              |
      | 02/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Work Hours Limit |
      | 03/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |
      | 06/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 07/01/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                              |
      | 08/01/2024 | 09:01    | 18:00    | AB       | AB       | 07:59      | Full Day AB:Work Hours Limit |

  @LWH_17
  Scenario: LessWorkHrs - Daily Allowed Limit Min = 30 - Both - Max Count 2 & Max Duration 60 min - AB marking type = Continuous - Mark Absent = Half Day
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
      | PlcName     | MaxPunchesToCons | LessWorkHrsCheck | LessWorkHrsDailyLimit | LessWorkHrsMarkABasPer | LessWorkHrsMonthCount | LessWorkHrsMonthLimit | LessWorkHrsABmarkType | LessWorkHrsMarkAbsent | validation         |
      | LessWorkHrs |                4 | True             |                    30 | Both                   |                     2 |                    60 | Continuous            | Half Day              | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc   | EarlyOutPlc | ShiftSchedule | Validation         |
      | LessWorkHrs | True   | True      | True      | True      | True      | True               |                        4 | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
      | LessWorkHrN | True   | True      | True      | True      | True      | True               | N-Punch                  | LessWorkHrs   | LessWorkHrs | LessWorkHrs | ZD            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | LessWorkHrs |   01012024 |     094500 |
      | LessWorkHrs |   01012024 |     130000 |
      | LessWorkHrs |   01012024 |     140000 |
      | LessWorkHrs |   01012024 |     180000 |
      | LessWorkHrs |   02012024 |     093000 |
      | LessWorkHrs |   02012024 |     130000 |
      | LessWorkHrs |   02012024 |     140000 |
      | LessWorkHrs |   02012024 |     180000 |
      | LessWorkHrs |   03012024 |     094000 |
      | LessWorkHrs |   03012024 |     130000 |
      | LessWorkHrs |   03012024 |     140000 |
      | LessWorkHrs |   03012024 |     180000 |
      | LessWorkHrs |   04012024 |     090100 |
      | LessWorkHrs |   04012024 |     130000 |
      | LessWorkHrs |   04012024 |     140000 |
      | LessWorkHrs |   04012024 |     180000 |
      | LessWorkHrs |   05012024 |     090100 |
      | LessWorkHrs |   05012024 |     130000 |
      | LessWorkHrs |   05012024 |     140000 |
      | LessWorkHrs |   05012024 |     180000 |
      | LessWorkHrN |   01012024 |     094500 |
      | LessWorkHrN |   01012024 |     100000 |
      | LessWorkHrN |   01012024 |     103000 |
      | LessWorkHrN |   01012024 |     160000 |
      | LessWorkHrN |   01012024 |     163000 |
      | LessWorkHrN |   01012024 |     180000 |
      | LessWorkHrN |   02012024 |     093000 |
      | LessWorkHrN |   02012024 |     100000 |
      | LessWorkHrN |   02012024 |     103000 |
      | LessWorkHrN |   02012024 |     160000 |
      | LessWorkHrN |   02012024 |     163000 |
      | LessWorkHrN |   02012024 |     180000 |
      | LessWorkHrN |   03012024 |     094000 |
      | LessWorkHrN |   03012024 |     100000 |
      | LessWorkHrN |   03012024 |     103000 |
      | LessWorkHrN |   03012024 |     160000 |
      | LessWorkHrN |   03012024 |     163000 |
      | LessWorkHrN |   03012024 |     180000 |
      | LessWorkHrN |   04012024 |     090100 |
      | LessWorkHrN |   04012024 |     100000 |
      | LessWorkHrN |   04012024 |     103000 |
      | LessWorkHrN |   04012024 |     160000 |
      | LessWorkHrN |   04012024 |     163000 |
      | LessWorkHrN |   04012024 |     180000 |
      | LessWorkHrN |   05012024 |     090100 |
      | LessWorkHrN |   05012024 |     100000 |
      | LessWorkHrN |   05012024 |     103000 |
      | LessWorkHrN |   05012024 |     160000 |
      | LessWorkHrN |   05012024 |     163000 |
      | LessWorkHrN |   05012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID      |
      | LessWorkHrs |
      | LessWorkHrN |
    Then Daily Attendance View for userid "LessWorkHrs" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:45    | 18:00    | PR       | AB       | 07:15      | AB:Less Work Hrs             |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:40    | 18:00    | PR       | AB       | 07:20      | AB:Less Work Hrs             |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
    Then Daily Attendance View for userid "LessWorkHrN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:45    | 18:00    | PR       | AB       | 07:15      | AB:Less Work Hrs             |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 03/01/2024 | 09:40    | 18:00    | PR       | AB       | 07:20      | AB:Less Work Hrs             |
      | 04/01/2024 | 09:01    | 18:00    | PR       | PR       | 07:59      |                              |
      | 05/01/2024 | 09:01    | 18:00    | PR       | AB       | 07:59      | Half Day AB:Work Hours Limit |
