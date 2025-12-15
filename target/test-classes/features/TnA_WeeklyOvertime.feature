@WeeklyOT_
Feature: Weekly Overtime For 4 punch user and N punch User
  I want to use this template for my feature file

  @WeeklyOT_1
  Scenario: Generate Weekly Overtime while only Consider Work Done on WO/PH/Paid Leaves checkbox checked
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     200000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
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
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
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
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          | 08:00              | 08:00               |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          | 08:30              | 08:30               |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:35              | 03:35               |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |

  @WeeklyOT_2
  Scenario: Generate Weekly Overtime while only Consider Work Done on WO/PH/Paid Leaves checkbox unchecked
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     200000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
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
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
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
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "15/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 00:25              | 00:25               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:35              | 03:35               |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 |          |          |                    |                     |

  @WeeklyOT_3
  Scenario: check boundry value analysis of Minimum Duration Required and factor in Work Component Configuration for Weekly Overtime
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
      |          04000 |        09900 |     03230 | OT1        |   1.53 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     202900 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   15012024 |     070000 |
      | TandAWeeklyfour |   15012024 |     130000 |
      | TandAWeeklyfour |   15012024 |     140000 |
      | TandAWeeklyfour |   15012024 |     203100 |
      | TandAWeeklyfour |   16012024 |     070000 |
      | TandAWeeklyfour |   16012024 |     130000 |
      | TandAWeeklyfour |   16012024 |     140000 |
      | TandAWeeklyfour |   16012024 |     200000 |
      | TandAWeeklyfour |   17012024 |     070000 |
      | TandAWeeklyfour |   17012024 |     130000 |
      | TandAWeeklyfour |   17012024 |     140000 |
      | TandAWeeklyfour |   17012024 |     200000 |
      | TandAWeeklyfour |   18012024 |     070000 |
      | TandAWeeklyfour |   18012024 |     130000 |
      | TandAWeeklyfour |   18012024 |     140000 |
      | TandAWeeklyfour |   18012024 |     200000 |
      | TandAWeeklyfour |   19012024 |     070000 |
      | TandAWeeklyfour |   19012024 |     130000 |
      | TandAWeeklyfour |   19012024 |     140000 |
      | TandAWeeklyfour |   19012024 |     200000 |
      | TandAWeeklyfour |   20012024 |     070000 |
      | TandAWeeklyfour |   20012024 |     130000 |
      | TandAWeeklyfour |   20012024 |     140000 |
      | TandAWeeklyfour |   20012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     204500 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     090000 |
      | TandAWeeklyN    |   08012024 |     091500 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     204400 |
      | TandAWeeklyN    |   09012024 |     070000 |
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
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
      | TandAWeeklyN    |   13012024 |     070000 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   15012024 |     070000 |
      | TandAWeeklyN    |   15012024 |     090000 |
      | TandAWeeklyN    |   15012024 |     091500 |
      | TandAWeeklyN    |   15012024 |     130000 |
      | TandAWeeklyN    |   15012024 |     133000 |
      | TandAWeeklyN    |   15012024 |     175000 |
      | TandAWeeklyN    |   15012024 |     180000 |
      | TandAWeeklyN    |   15012024 |     204600 |
      | TandAWeeklyN    |   16012024 |     071500 |
      | TandAWeeklyN    |   16012024 |     090000 |
      | TandAWeeklyN    |   16012024 |     091500 |
      | TandAWeeklyN    |   16012024 |     130000 |
      | TandAWeeklyN    |   16012024 |     133000 |
      | TandAWeeklyN    |   16012024 |     175000 |
      | TandAWeeklyN    |   16012024 |     180000 |
      | TandAWeeklyN    |   16012024 |     200000 |
      | TandAWeeklyN    |   17012024 |     071500 |
      | TandAWeeklyN    |   17012024 |     090000 |
      | TandAWeeklyN    |   17012024 |     091500 |
      | TandAWeeklyN    |   17012024 |     130000 |
      | TandAWeeklyN    |   17012024 |     133000 |
      | TandAWeeklyN    |   17012024 |     175000 |
      | TandAWeeklyN    |   17012024 |     180000 |
      | TandAWeeklyN    |   17012024 |     200000 |
      | TandAWeeklyN    |   18012024 |     071500 |
      | TandAWeeklyN    |   18012024 |     090000 |
      | TandAWeeklyN    |   18012024 |     091500 |
      | TandAWeeklyN    |   18012024 |     130000 |
      | TandAWeeklyN    |   18012024 |     133000 |
      | TandAWeeklyN    |   18012024 |     175000 |
      | TandAWeeklyN    |   18012024 |     180000 |
      | TandAWeeklyN    |   18012024 |     200000 |
      | TandAWeeklyN    |   19012024 |     070000 |
      | TandAWeeklyN    |   19012024 |     090000 |
      | TandAWeeklyN    |   19012024 |     091500 |
      | TandAWeeklyN    |   19012024 |     130000 |
      | TandAWeeklyN    |   19012024 |     133000 |
      | TandAWeeklyN    |   19012024 |     175000 |
      | TandAWeeklyN    |   19012024 |     180000 |
      | TandAWeeklyN    |   19012024 |     200000 |
      | TandAWeeklyN    |   20012024 |     070000 |
      | TandAWeeklyN    |   20012024 |     090000 |
      | TandAWeeklyN    |   20012024 |     091500 |
      | TandAWeeklyN    |   20012024 |     130000 |
      | TandAWeeklyN    |   20012024 |     133000 |
      | TandAWeeklyN    |   20012024 |     175000 |
      | TandAWeeklyN    |   20012024 |     180000 |
      | TandAWeeklyN    |   20012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "21/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:29    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:31    |                    |                     |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "21/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:44    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:46    |                    |                     |
      | 16/01/2024 | 07:15    | 20:00    |                    |                     |
      | 17/01/2024 | 07:15    | 20:00    |                    |                     |
      | 18/01/2024 | 07:15    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "21/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          | 25:14              | 25:14               |
      | 08/01/2024 | 07:00    | 20:29    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:31    | 04:31              | 04:31               |
      | 16/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 17/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 18/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 19/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 20/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 21/01/2024 |          |          | 25:14              | 25:14               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "21/01/2024 "
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    | 04:45              | 04:45               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          | 25:44              | 25:44               |
      | 08/01/2024 | 07:00    | 20:44    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:46    | 04:46              | 04:46               |
      | 16/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 17/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 18/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 19/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 20/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 21/01/2024 |          |          | 25:44              | 25:44               |

  @WeeklyOT_4
  Scenario: check boundry value analysis of Net-Work Hours Range From and To in Work Component Configuration for Weekly Overtime
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
      |          07230 |        09000 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     202900 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   15012024 |     070000 |
      | TandAWeeklyfour |   15012024 |     130000 |
      | TandAWeeklyfour |   15012024 |     140000 |
      | TandAWeeklyfour |   15012024 |     203100 |
      | TandAWeeklyfour |   16012024 |     070000 |
      | TandAWeeklyfour |   16012024 |     130000 |
      | TandAWeeklyfour |   16012024 |     140000 |
      | TandAWeeklyfour |   16012024 |     200000 |
      | TandAWeeklyfour |   17012024 |     070000 |
      | TandAWeeklyfour |   17012024 |     130000 |
      | TandAWeeklyfour |   17012024 |     140000 |
      | TandAWeeklyfour |   17012024 |     200000 |
      | TandAWeeklyfour |   18012024 |     070000 |
      | TandAWeeklyfour |   18012024 |     130000 |
      | TandAWeeklyfour |   18012024 |     140000 |
      | TandAWeeklyfour |   18012024 |     200000 |
      | TandAWeeklyfour |   19012024 |     070000 |
      | TandAWeeklyfour |   19012024 |     130000 |
      | TandAWeeklyfour |   19012024 |     140000 |
      | TandAWeeklyfour |   19012024 |     200000 |
      | TandAWeeklyfour |   20012024 |     070000 |
      | TandAWeeklyfour |   20012024 |     130000 |
      | TandAWeeklyfour |   20012024 |     140000 |
      | TandAWeeklyfour |   20012024 |     200000 |
      | TandAWeeklyfour |   22012024 |     030000 |
      | TandAWeeklyfour |   22012024 |     130000 |
      | TandAWeeklyfour |   22012024 |     140000 |
      | TandAWeeklyfour |   22012024 |     203000 |
      | TandAWeeklyfour |   23012024 |     030000 |
      | TandAWeeklyfour |   23012024 |     130000 |
      | TandAWeeklyfour |   23012024 |     140000 |
      | TandAWeeklyfour |   23012024 |     200000 |
      | TandAWeeklyfour |   24012024 |     030000 |
      | TandAWeeklyfour |   24012024 |     130000 |
      | TandAWeeklyfour |   24012024 |     140000 |
      | TandAWeeklyfour |   24012024 |     200000 |
      | TandAWeeklyfour |   25012024 |     030000 |
      | TandAWeeklyfour |   25012024 |     130000 |
      | TandAWeeklyfour |   25012024 |     140000 |
      | TandAWeeklyfour |   25012024 |     200000 |
      | TandAWeeklyfour |   26012024 |     053000 |
      | TandAWeeklyfour |   26012024 |     130000 |
      | TandAWeeklyfour |   26012024 |     140000 |
      | TandAWeeklyfour |   26012024 |     200000 |
      | TandAWeeklyfour |   27012024 |     070000 |
      | TandAWeeklyfour |   27012024 |     130000 |
      | TandAWeeklyfour |   27012024 |     140000 |
      | TandAWeeklyfour |   27012024 |     200000 |
      | TandAWeeklyfour |   29012024 |     030000 |
      | TandAWeeklyfour |   29012024 |     130000 |
      | TandAWeeklyfour |   29012024 |     140000 |
      | TandAWeeklyfour |   29012024 |     203000 |
      | TandAWeeklyfour |   30012024 |     030000 |
      | TandAWeeklyfour |   30012024 |     130000 |
      | TandAWeeklyfour |   30012024 |     140000 |
      | TandAWeeklyfour |   30012024 |     200000 |
      | TandAWeeklyfour |   31012024 |     030000 |
      | TandAWeeklyfour |   31012024 |     130000 |
      | TandAWeeklyfour |   31012024 |     140000 |
      | TandAWeeklyfour |   31012024 |     200000 |
      | TandAWeeklyfour |   01022024 |     030000 |
      | TandAWeeklyfour |   01022024 |     130000 |
      | TandAWeeklyfour |   01022024 |     140000 |
      | TandAWeeklyfour |   01022024 |     200000 |
      | TandAWeeklyfour |   02022024 |     052900 |
      | TandAWeeklyfour |   02022024 |     130000 |
      | TandAWeeklyfour |   02022024 |     140000 |
      | TandAWeeklyfour |   02022024 |     200000 |
      | TandAWeeklyfour |   03022024 |     070000 |
      | TandAWeeklyfour |   03022024 |     130000 |
      | TandAWeeklyfour |   03022024 |     140000 |
      | TandAWeeklyfour |   03022024 |     200000 |
      | TandAWeeklyfour |   05022024 |     030000 |
      | TandAWeeklyfour |   05022024 |     130000 |
      | TandAWeeklyfour |   05022024 |     140000 |
      | TandAWeeklyfour |   05022024 |     203000 |
      | TandAWeeklyfour |   06022024 |     030000 |
      | TandAWeeklyfour |   06022024 |     130000 |
      | TandAWeeklyfour |   06022024 |     140000 |
      | TandAWeeklyfour |   06022024 |     200000 |
      | TandAWeeklyfour |   07022024 |     030000 |
      | TandAWeeklyfour |   07022024 |     130000 |
      | TandAWeeklyfour |   07022024 |     140000 |
      | TandAWeeklyfour |   07022024 |     200000 |
      | TandAWeeklyfour |   08022024 |     030000 |
      | TandAWeeklyfour |   08022024 |     130000 |
      | TandAWeeklyfour |   08022024 |     140000 |
      | TandAWeeklyfour |   08022024 |     200000 |
      | TandAWeeklyfour |   09022024 |     053100 |
      | TandAWeeklyfour |   09022024 |     130000 |
      | TandAWeeklyfour |   09022024 |     140000 |
      | TandAWeeklyfour |   09022024 |     200000 |
      | TandAWeeklyfour |   10022024 |     070000 |
      | TandAWeeklyfour |   10022024 |     130000 |
      | TandAWeeklyfour |   10022024 |     140000 |
      | TandAWeeklyfour |   10022024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     204500 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     090000 |
      | TandAWeeklyN    |   08012024 |     091500 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     204400 |
      | TandAWeeklyN    |   09012024 |     070000 |
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
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
      | TandAWeeklyN    |   13012024 |     070000 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   15012024 |     070000 |
      | TandAWeeklyN    |   15012024 |     090000 |
      | TandAWeeklyN    |   15012024 |     091500 |
      | TandAWeeklyN    |   15012024 |     130000 |
      | TandAWeeklyN    |   15012024 |     133000 |
      | TandAWeeklyN    |   15012024 |     175000 |
      | TandAWeeklyN    |   15012024 |     180000 |
      | TandAWeeklyN    |   15012024 |     204600 |
      | TandAWeeklyN    |   16012024 |     071500 |
      | TandAWeeklyN    |   16012024 |     090000 |
      | TandAWeeklyN    |   16012024 |     091500 |
      | TandAWeeklyN    |   16012024 |     130000 |
      | TandAWeeklyN    |   16012024 |     133000 |
      | TandAWeeklyN    |   16012024 |     175000 |
      | TandAWeeklyN    |   16012024 |     180000 |
      | TandAWeeklyN    |   16012024 |     200000 |
      | TandAWeeklyN    |   17012024 |     071500 |
      | TandAWeeklyN    |   17012024 |     090000 |
      | TandAWeeklyN    |   17012024 |     091500 |
      | TandAWeeklyN    |   17012024 |     130000 |
      | TandAWeeklyN    |   17012024 |     133000 |
      | TandAWeeklyN    |   17012024 |     175000 |
      | TandAWeeklyN    |   17012024 |     180000 |
      | TandAWeeklyN    |   17012024 |     200000 |
      | TandAWeeklyN    |   18012024 |     071500 |
      | TandAWeeklyN    |   18012024 |     090000 |
      | TandAWeeklyN    |   18012024 |     091500 |
      | TandAWeeklyN    |   18012024 |     130000 |
      | TandAWeeklyN    |   18012024 |     133000 |
      | TandAWeeklyN    |   18012024 |     175000 |
      | TandAWeeklyN    |   18012024 |     180000 |
      | TandAWeeklyN    |   18012024 |     200000 |
      | TandAWeeklyN    |   19012024 |     070000 |
      | TandAWeeklyN    |   19012024 |     090000 |
      | TandAWeeklyN    |   19012024 |     091500 |
      | TandAWeeklyN    |   19012024 |     130000 |
      | TandAWeeklyN    |   19012024 |     133000 |
      | TandAWeeklyN    |   19012024 |     175000 |
      | TandAWeeklyN    |   19012024 |     180000 |
      | TandAWeeklyN    |   19012024 |     200000 |
      | TandAWeeklyN    |   20012024 |     070000 |
      | TandAWeeklyN    |   20012024 |     090000 |
      | TandAWeeklyN    |   20012024 |     091500 |
      | TandAWeeklyN    |   20012024 |     130000 |
      | TandAWeeklyN    |   20012024 |     133000 |
      | TandAWeeklyN    |   20012024 |     175000 |
      | TandAWeeklyN    |   20012024 |     180000 |
      | TandAWeeklyN    |   20012024 |     200000 |
      | TandAWeeklyN    |   22012024 |     030000 |
      | TandAWeeklyN    |   22012024 |     090000 |
      | TandAWeeklyN    |   22012024 |     091500 |
      | TandAWeeklyN    |   22012024 |     130000 |
      | TandAWeeklyN    |   22012024 |     133000 |
      | TandAWeeklyN    |   22012024 |     175000 |
      | TandAWeeklyN    |   22012024 |     180000 |
      | TandAWeeklyN    |   22012024 |     204500 |
      | TandAWeeklyN    |   23012024 |     030000 |
      | TandAWeeklyN    |   23012024 |     090000 |
      | TandAWeeklyN    |   23012024 |     091500 |
      | TandAWeeklyN    |   23012024 |     130000 |
      | TandAWeeklyN    |   23012024 |     133000 |
      | TandAWeeklyN    |   23012024 |     175000 |
      | TandAWeeklyN    |   23012024 |     180000 |
      | TandAWeeklyN    |   23012024 |     200000 |
      | TandAWeeklyN    |   24012024 |     031500 |
      | TandAWeeklyN    |   24012024 |     090000 |
      | TandAWeeklyN    |   24012024 |     091500 |
      | TandAWeeklyN    |   24012024 |     130000 |
      | TandAWeeklyN    |   24012024 |     133000 |
      | TandAWeeklyN    |   24012024 |     175000 |
      | TandAWeeklyN    |   24012024 |     180000 |
      | TandAWeeklyN    |   24012024 |     200000 |
      | TandAWeeklyN    |   25012024 |     031500 |
      | TandAWeeklyN    |   25012024 |     090000 |
      | TandAWeeklyN    |   25012024 |     091500 |
      | TandAWeeklyN    |   25012024 |     130000 |
      | TandAWeeklyN    |   25012024 |     133000 |
      | TandAWeeklyN    |   25012024 |     175000 |
      | TandAWeeklyN    |   25012024 |     180000 |
      | TandAWeeklyN    |   25012024 |     200000 |
      | TandAWeeklyN    |   26012024 |     054500 |
      | TandAWeeklyN    |   26012024 |     090000 |
      | TandAWeeklyN    |   26012024 |     091500 |
      | TandAWeeklyN    |   26012024 |     130000 |
      | TandAWeeklyN    |   26012024 |     133000 |
      | TandAWeeklyN    |   26012024 |     175000 |
      | TandAWeeklyN    |   26012024 |     180000 |
      | TandAWeeklyN    |   26012024 |     200000 |
      | TandAWeeklyN    |   27012024 |     070000 |
      | TandAWeeklyN    |   27012024 |     090000 |
      | TandAWeeklyN    |   27012024 |     091500 |
      | TandAWeeklyN    |   27012024 |     130000 |
      | TandAWeeklyN    |   27012024 |     133000 |
      | TandAWeeklyN    |   27012024 |     175000 |
      | TandAWeeklyN    |   27012024 |     180000 |
      | TandAWeeklyN    |   27012024 |     200000 |
      | TandAWeeklyN    |   29012024 |     030000 |
      | TandAWeeklyN    |   29012024 |     090000 |
      | TandAWeeklyN    |   29012024 |     091500 |
      | TandAWeeklyN    |   29012024 |     130000 |
      | TandAWeeklyN    |   29012024 |     133000 |
      | TandAWeeklyN    |   29012024 |     175000 |
      | TandAWeeklyN    |   29012024 |     180000 |
      | TandAWeeklyN    |   29012024 |     204500 |
      | TandAWeeklyN    |   30012024 |     030000 |
      | TandAWeeklyN    |   30012024 |     090000 |
      | TandAWeeklyN    |   30012024 |     091500 |
      | TandAWeeklyN    |   30012024 |     130000 |
      | TandAWeeklyN    |   30012024 |     133000 |
      | TandAWeeklyN    |   30012024 |     175000 |
      | TandAWeeklyN    |   30012024 |     180000 |
      | TandAWeeklyN    |   30012024 |     200000 |
      | TandAWeeklyN    |   31012024 |     031500 |
      | TandAWeeklyN    |   31012024 |     090000 |
      | TandAWeeklyN    |   31012024 |     091500 |
      | TandAWeeklyN    |   31012024 |     130000 |
      | TandAWeeklyN    |   31012024 |     133000 |
      | TandAWeeklyN    |   31012024 |     175000 |
      | TandAWeeklyN    |   31012024 |     180000 |
      | TandAWeeklyN    |   31012024 |     200000 |
      | TandAWeeklyN    |   01022024 |     031500 |
      | TandAWeeklyN    |   01022024 |     090000 |
      | TandAWeeklyN    |   01022024 |     091500 |
      | TandAWeeklyN    |   01022024 |     130000 |
      | TandAWeeklyN    |   01022024 |     133000 |
      | TandAWeeklyN    |   01022024 |     175000 |
      | TandAWeeklyN    |   01022024 |     180000 |
      | TandAWeeklyN    |   01022024 |     200000 |
      | TandAWeeklyN    |   02022024 |     054600 |
      | TandAWeeklyN    |   02022024 |     090000 |
      | TandAWeeklyN    |   02022024 |     091500 |
      | TandAWeeklyN    |   02022024 |     130000 |
      | TandAWeeklyN    |   02022024 |     133000 |
      | TandAWeeklyN    |   02022024 |     175000 |
      | TandAWeeklyN    |   02022024 |     180000 |
      | TandAWeeklyN    |   02022024 |     200000 |
      | TandAWeeklyN    |   03022024 |     070000 |
      | TandAWeeklyN    |   03022024 |     090000 |
      | TandAWeeklyN    |   03022024 |     091500 |
      | TandAWeeklyN    |   03022024 |     130000 |
      | TandAWeeklyN    |   03022024 |     133000 |
      | TandAWeeklyN    |   03022024 |     175000 |
      | TandAWeeklyN    |   03022024 |     180000 |
      | TandAWeeklyN    |   03022024 |     200000 |
      | TandAWeeklyN    |   05022024 |     030000 |
      | TandAWeeklyN    |   05022024 |     090000 |
      | TandAWeeklyN    |   05022024 |     091500 |
      | TandAWeeklyN    |   05022024 |     130000 |
      | TandAWeeklyN    |   05022024 |     133000 |
      | TandAWeeklyN    |   05022024 |     175000 |
      | TandAWeeklyN    |   05022024 |     180000 |
      | TandAWeeklyN    |   05022024 |     204500 |
      | TandAWeeklyN    |   06022024 |     030000 |
      | TandAWeeklyN    |   06022024 |     090000 |
      | TandAWeeklyN    |   06022024 |     091500 |
      | TandAWeeklyN    |   06022024 |     130000 |
      | TandAWeeklyN    |   06022024 |     133000 |
      | TandAWeeklyN    |   06022024 |     175000 |
      | TandAWeeklyN    |   06022024 |     180000 |
      | TandAWeeklyN    |   06022024 |     200000 |
      | TandAWeeklyN    |   07022024 |     031500 |
      | TandAWeeklyN    |   07022024 |     090000 |
      | TandAWeeklyN    |   07022024 |     091500 |
      | TandAWeeklyN    |   07022024 |     130000 |
      | TandAWeeklyN    |   07022024 |     133000 |
      | TandAWeeklyN    |   07022024 |     175000 |
      | TandAWeeklyN    |   07022024 |     180000 |
      | TandAWeeklyN    |   07022024 |     200000 |
      | TandAWeeklyN    |   08022024 |     031500 |
      | TandAWeeklyN    |   08022024 |     090000 |
      | TandAWeeklyN    |   08022024 |     091500 |
      | TandAWeeklyN    |   08022024 |     130000 |
      | TandAWeeklyN    |   08022024 |     133000 |
      | TandAWeeklyN    |   08022024 |     175000 |
      | TandAWeeklyN    |   08022024 |     180000 |
      | TandAWeeklyN    |   08022024 |     200000 |
      | TandAWeeklyN    |   09022024 |     054400 |
      | TandAWeeklyN    |   09022024 |     090000 |
      | TandAWeeklyN    |   09022024 |     091500 |
      | TandAWeeklyN    |   09022024 |     130000 |
      | TandAWeeklyN    |   09022024 |     133000 |
      | TandAWeeklyN    |   09022024 |     175000 |
      | TandAWeeklyN    |   09022024 |     180000 |
      | TandAWeeklyN    |   09022024 |     200000 |
      | TandAWeeklyN    |   10022024 |     070000 |
      | TandAWeeklyN    |   10022024 |     090000 |
      | TandAWeeklyN    |   10022024 |     091500 |
      | TandAWeeklyN    |   10022024 |     130000 |
      | TandAWeeklyN    |   10022024 |     133000 |
      | TandAWeeklyN    |   10022024 |     175000 |
      | TandAWeeklyN    |   10022024 |     180000 |
      | TandAWeeklyN    |   10022024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "11/02/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:29    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:31    |                    |                     |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:30    |                    |                     |
      | 23/01/2024 | 03:00    | 20:00    |                    |                     |
      | 24/01/2024 | 03:00    | 20:00    |                    |                     |
      | 25/01/2024 | 03:00    | 20:00    |                    |                     |
      | 26/01/2024 | 05:30    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:30    |                    |                     |
      | 30/01/2024 | 03:00    | 20:00    |                    |                     |
      | 31/01/2024 | 03:00    | 20:00    |                    |                     |
      | 01/02/2024 | 03:00    | 20:00    |                    |                     |
      | 02/02/2024 | 05:29    | 20:00    |                    |                     |
      | 03/02/2024 | 07:00    | 20:00    |                    |                     |
      | 04/02/2024 |          |          |                    |                     |
      | 05/02/2024 | 03:00    | 20:30    |                    |                     |
      | 06/02/2024 | 03:00    | 20:00    |                    |                     |
      | 07/02/2024 | 03:00    | 20:00    |                    |                     |
      | 08/02/2024 | 03:00    | 20:00    |                    |                     |
      | 09/02/2024 | 05:31    | 20:00    |                    |                     |
      | 10/02/2024 | 07:00    | 20:00    |                    |                     |
      | 11/02/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "11/02/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:44    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:46    |                    |                     |
      | 16/01/2024 | 07:15    | 20:00    |                    |                     |
      | 17/01/2024 | 07:15    | 20:00    |                    |                     |
      | 18/01/2024 | 07:15    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:45    |                    |                     |
      | 23/01/2024 | 03:00    | 20:00    |                    |                     |
      | 24/01/2024 | 03:15    | 20:00    |                    |                     |
      | 25/01/2024 | 03:15    | 20:00    |                    |                     |
      | 26/01/2024 | 05:45    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:45    |                    |                     |
      | 30/01/2024 | 03:00    | 20:00    |                    |                     |
      | 31/01/2024 | 03:15    | 20:00    |                    |                     |
      | 01/02/2024 | 03:15    | 20:00    |                    |                     |
      | 02/02/2024 | 05:46    | 20:00    |                    |                     |
      | 03/02/2024 | 07:00    | 20:00    |                    |                     |
      | 04/02/2024 |          |          |                    |                     |
      | 05/02/2024 | 03:00    | 20:45    |                    |                     |
      | 06/02/2024 | 03:00    | 20:00    |                    |                     |
      | 07/02/2024 | 03:15    | 20:00    |                    |                     |
      | 08/02/2024 | 03:15    | 20:00    |                    |                     |
      | 09/02/2024 | 05:44    | 20:00    |                    |                     |
      | 10/02/2024 | 07:00    | 20:00    |                    |                     |
      | 11/02/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "11/02/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:29    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:31    | 00:01              | 00:01               |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:30    | 08:30              | 08:30               |
      | 23/01/2024 | 03:00    | 20:00    | 08:00              | 08:00               |
      | 24/01/2024 | 03:00    | 20:00    | 01:00              | 01:00               |
      | 25/01/2024 | 03:00    | 20:00    |                    |                     |
      | 26/01/2024 | 05:30    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:30    | 08:30              | 08:30               |
      | 30/01/2024 | 03:00    | 20:00    | 08:00              | 08:00               |
      | 31/01/2024 | 03:00    | 20:00    | 01:00              | 01:00               |
      | 01/02/2024 | 03:00    | 20:00    |                    |                     |
      | 02/02/2024 | 05:29    | 20:00    |                    |                     |
      | 03/02/2024 | 07:00    | 20:00    |                    |                     |
      | 04/02/2024 |          |          |                    |                     |
      | 05/02/2024 | 03:00    | 20:30    | 08:30              | 08:30               |
      | 06/02/2024 | 03:00    | 20:00    | 08:00              | 08:00               |
      | 07/02/2024 | 03:00    | 20:00    | 00:59              | 00:59               |
      | 08/02/2024 | 03:00    | 20:00    |                    |                     |
      | 09/02/2024 | 05:31    | 20:00    |                    |                     |
      | 10/02/2024 | 07:00    | 20:00    |                    |                     |
      | 11/02/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "11/02/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:44    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:46    | 00:01              | 00:01               |
      | 16/01/2024 | 07:15    | 20:00    |                    |                     |
      | 17/01/2024 | 07:15    | 20:00    |                    |                     |
      | 18/01/2024 | 07:15    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:45    | 08:45              | 08:45               |
      | 23/01/2024 | 03:00    | 20:00    | 08:00              | 08:00               |
      | 24/01/2024 | 03:15    | 20:00    | 00:45              | 00:45               |
      | 25/01/2024 | 03:15    | 20:00    |                    |                     |
      | 26/01/2024 | 05:45    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:45    | 08:45              | 08:45               |
      | 30/01/2024 | 03:00    | 20:00    | 08:00              | 08:00               |
      | 31/01/2024 | 03:15    | 20:00    | 00:44              | 00:44               |
      | 01/02/2024 | 03:15    | 20:00    |                    |                     |
      | 02/02/2024 | 05:46    | 20:00    |                    |                     |
      | 03/02/2024 | 07:00    | 20:00    |                    |                     |
      | 04/02/2024 |          |          |                    |                     |
      | 05/02/2024 | 03:00    | 20:45    | 08:45              | 08:45               |
      | 06/02/2024 | 03:00    | 20:00    | 08:00              | 08:00               |
      | 07/02/2024 | 03:15    | 20:00    | 00:45              | 00:45               |
      | 08/02/2024 | 03:15    | 20:00    |                    |                     |
      | 09/02/2024 | 05:44    | 20:00    |                    |                     |
      | 10/02/2024 | 07:00    | 20:00    |                    |                     |
      | 11/02/2024 |          |          |                    |                     |

  @WeeklyOT_5
  Scenario: check Multiple Configuration in Work Component Configuration for Weekly Overtime
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
      |          04000 |        05000 |     00000 | OT1        |   1.00 |
      |          07200 |        09900 |     00000 | OT2        |   1.33 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     202900 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   15012024 |     070000 |
      | TandAWeeklyfour |   15012024 |     130000 |
      | TandAWeeklyfour |   15012024 |     140000 |
      | TandAWeeklyfour |   15012024 |     203100 |
      | TandAWeeklyfour |   16012024 |     070000 |
      | TandAWeeklyfour |   16012024 |     130000 |
      | TandAWeeklyfour |   16012024 |     140000 |
      | TandAWeeklyfour |   16012024 |     200000 |
      | TandAWeeklyfour |   17012024 |     070000 |
      | TandAWeeklyfour |   17012024 |     130000 |
      | TandAWeeklyfour |   17012024 |     140000 |
      | TandAWeeklyfour |   17012024 |     200000 |
      | TandAWeeklyfour |   18012024 |     070000 |
      | TandAWeeklyfour |   18012024 |     130000 |
      | TandAWeeklyfour |   18012024 |     140000 |
      | TandAWeeklyfour |   18012024 |     200000 |
      | TandAWeeklyfour |   19012024 |     070000 |
      | TandAWeeklyfour |   19012024 |     130000 |
      | TandAWeeklyfour |   19012024 |     140000 |
      | TandAWeeklyfour |   19012024 |     200000 |
      | TandAWeeklyfour |   20012024 |     070000 |
      | TandAWeeklyfour |   20012024 |     130000 |
      | TandAWeeklyfour |   20012024 |     140000 |
      | TandAWeeklyfour |   20012024 |     200000 |
      | TandAWeeklyfour |   22012024 |     030000 |
      | TandAWeeklyfour |   22012024 |     130000 |
      | TandAWeeklyfour |   22012024 |     140000 |
      | TandAWeeklyfour |   22012024 |     203000 |
      | TandAWeeklyfour |   23012024 |     030000 |
      | TandAWeeklyfour |   23012024 |     130000 |
      | TandAWeeklyfour |   23012024 |     140000 |
      | TandAWeeklyfour |   23012024 |     200000 |
      | TandAWeeklyfour |   24012024 |     030000 |
      | TandAWeeklyfour |   24012024 |     130000 |
      | TandAWeeklyfour |   24012024 |     140000 |
      | TandAWeeklyfour |   24012024 |     200000 |
      | TandAWeeklyfour |   25012024 |     030000 |
      | TandAWeeklyfour |   25012024 |     130000 |
      | TandAWeeklyfour |   25012024 |     140000 |
      | TandAWeeklyfour |   25012024 |     200000 |
      | TandAWeeklyfour |   26012024 |     053000 |
      | TandAWeeklyfour |   26012024 |     130000 |
      | TandAWeeklyfour |   26012024 |     140000 |
      | TandAWeeklyfour |   26012024 |     200000 |
      | TandAWeeklyfour |   27012024 |     070000 |
      | TandAWeeklyfour |   27012024 |     130000 |
      | TandAWeeklyfour |   27012024 |     140000 |
      | TandAWeeklyfour |   27012024 |     200000 |
      | TandAWeeklyfour |   29012024 |     030000 |
      | TandAWeeklyfour |   29012024 |     130000 |
      | TandAWeeklyfour |   29012024 |     140000 |
      | TandAWeeklyfour |   29012024 |     203000 |
      | TandAWeeklyfour |   30012024 |     030000 |
      | TandAWeeklyfour |   30012024 |     130000 |
      | TandAWeeklyfour |   30012024 |     140000 |
      | TandAWeeklyfour |   30012024 |     200000 |
      | TandAWeeklyfour |   31012024 |     030000 |
      | TandAWeeklyfour |   31012024 |     130000 |
      | TandAWeeklyfour |   31012024 |     140000 |
      | TandAWeeklyfour |   31012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     204500 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     090000 |
      | TandAWeeklyN    |   08012024 |     091500 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     204400 |
      | TandAWeeklyN    |   09012024 |     070000 |
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
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
      | TandAWeeklyN    |   13012024 |     070000 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   15012024 |     070000 |
      | TandAWeeklyN    |   15012024 |     090000 |
      | TandAWeeklyN    |   15012024 |     091500 |
      | TandAWeeklyN    |   15012024 |     130000 |
      | TandAWeeklyN    |   15012024 |     133000 |
      | TandAWeeklyN    |   15012024 |     175000 |
      | TandAWeeklyN    |   15012024 |     180000 |
      | TandAWeeklyN    |   15012024 |     204600 |
      | TandAWeeklyN    |   16012024 |     071500 |
      | TandAWeeklyN    |   16012024 |     090000 |
      | TandAWeeklyN    |   16012024 |     091500 |
      | TandAWeeklyN    |   16012024 |     130000 |
      | TandAWeeklyN    |   16012024 |     133000 |
      | TandAWeeklyN    |   16012024 |     175000 |
      | TandAWeeklyN    |   16012024 |     180000 |
      | TandAWeeklyN    |   16012024 |     200000 |
      | TandAWeeklyN    |   17012024 |     071500 |
      | TandAWeeklyN    |   17012024 |     090000 |
      | TandAWeeklyN    |   17012024 |     091500 |
      | TandAWeeklyN    |   17012024 |     130000 |
      | TandAWeeklyN    |   17012024 |     133000 |
      | TandAWeeklyN    |   17012024 |     175000 |
      | TandAWeeklyN    |   17012024 |     180000 |
      | TandAWeeklyN    |   17012024 |     200000 |
      | TandAWeeklyN    |   18012024 |     071500 |
      | TandAWeeklyN    |   18012024 |     090000 |
      | TandAWeeklyN    |   18012024 |     091500 |
      | TandAWeeklyN    |   18012024 |     130000 |
      | TandAWeeklyN    |   18012024 |     133000 |
      | TandAWeeklyN    |   18012024 |     175000 |
      | TandAWeeklyN    |   18012024 |     180000 |
      | TandAWeeklyN    |   18012024 |     200000 |
      | TandAWeeklyN    |   19012024 |     070000 |
      | TandAWeeklyN    |   19012024 |     090000 |
      | TandAWeeklyN    |   19012024 |     091500 |
      | TandAWeeklyN    |   19012024 |     130000 |
      | TandAWeeklyN    |   19012024 |     133000 |
      | TandAWeeklyN    |   19012024 |     175000 |
      | TandAWeeklyN    |   19012024 |     180000 |
      | TandAWeeklyN    |   19012024 |     200000 |
      | TandAWeeklyN    |   20012024 |     070000 |
      | TandAWeeklyN    |   20012024 |     090000 |
      | TandAWeeklyN    |   20012024 |     091500 |
      | TandAWeeklyN    |   20012024 |     130000 |
      | TandAWeeklyN    |   20012024 |     133000 |
      | TandAWeeklyN    |   20012024 |     175000 |
      | TandAWeeklyN    |   20012024 |     180000 |
      | TandAWeeklyN    |   20012024 |     200000 |
      | TandAWeeklyN    |   22012024 |     030000 |
      | TandAWeeklyN    |   22012024 |     090000 |
      | TandAWeeklyN    |   22012024 |     091500 |
      | TandAWeeklyN    |   22012024 |     130000 |
      | TandAWeeklyN    |   22012024 |     133000 |
      | TandAWeeklyN    |   22012024 |     175000 |
      | TandAWeeklyN    |   22012024 |     180000 |
      | TandAWeeklyN    |   22012024 |     204500 |
      | TandAWeeklyN    |   23012024 |     030000 |
      | TandAWeeklyN    |   23012024 |     090000 |
      | TandAWeeklyN    |   23012024 |     091500 |
      | TandAWeeklyN    |   23012024 |     130000 |
      | TandAWeeklyN    |   23012024 |     133000 |
      | TandAWeeklyN    |   23012024 |     175000 |
      | TandAWeeklyN    |   23012024 |     180000 |
      | TandAWeeklyN    |   23012024 |     200000 |
      | TandAWeeklyN    |   24012024 |     031500 |
      | TandAWeeklyN    |   24012024 |     090000 |
      | TandAWeeklyN    |   24012024 |     091500 |
      | TandAWeeklyN    |   24012024 |     130000 |
      | TandAWeeklyN    |   24012024 |     133000 |
      | TandAWeeklyN    |   24012024 |     175000 |
      | TandAWeeklyN    |   24012024 |     180000 |
      | TandAWeeklyN    |   24012024 |     200000 |
      | TandAWeeklyN    |   25012024 |     031500 |
      | TandAWeeklyN    |   25012024 |     090000 |
      | TandAWeeklyN    |   25012024 |     091500 |
      | TandAWeeklyN    |   25012024 |     130000 |
      | TandAWeeklyN    |   25012024 |     133000 |
      | TandAWeeklyN    |   25012024 |     175000 |
      | TandAWeeklyN    |   25012024 |     180000 |
      | TandAWeeklyN    |   25012024 |     200000 |
      | TandAWeeklyN    |   26012024 |     054500 |
      | TandAWeeklyN    |   26012024 |     090000 |
      | TandAWeeklyN    |   26012024 |     091500 |
      | TandAWeeklyN    |   26012024 |     130000 |
      | TandAWeeklyN    |   26012024 |     133000 |
      | TandAWeeklyN    |   26012024 |     175000 |
      | TandAWeeklyN    |   26012024 |     180000 |
      | TandAWeeklyN    |   26012024 |     200000 |
      | TandAWeeklyN    |   27012024 |     070000 |
      | TandAWeeklyN    |   27012024 |     090000 |
      | TandAWeeklyN    |   27012024 |     091500 |
      | TandAWeeklyN    |   27012024 |     130000 |
      | TandAWeeklyN    |   27012024 |     133000 |
      | TandAWeeklyN    |   27012024 |     175000 |
      | TandAWeeklyN    |   27012024 |     180000 |
      | TandAWeeklyN    |   27012024 |     200000 |
      | TandAWeeklyN    |   29012024 |     030000 |
      | TandAWeeklyN    |   29012024 |     090000 |
      | TandAWeeklyN    |   29012024 |     091500 |
      | TandAWeeklyN    |   29012024 |     130000 |
      | TandAWeeklyN    |   29012024 |     133000 |
      | TandAWeeklyN    |   29012024 |     175000 |
      | TandAWeeklyN    |   29012024 |     180000 |
      | TandAWeeklyN    |   29012024 |     204500 |
      | TandAWeeklyN    |   30012024 |     030000 |
      | TandAWeeklyN    |   30012024 |     090000 |
      | TandAWeeklyN    |   30012024 |     091500 |
      | TandAWeeklyN    |   30012024 |     130000 |
      | TandAWeeklyN    |   30012024 |     133000 |
      | TandAWeeklyN    |   30012024 |     175000 |
      | TandAWeeklyN    |   30012024 |     180000 |
      | TandAWeeklyN    |   30012024 |     200000 |
      | TandAWeeklyN    |   31012024 |     031500 |
      | TandAWeeklyN    |   31012024 |     090000 |
      | TandAWeeklyN    |   31012024 |     091500 |
      | TandAWeeklyN    |   31012024 |     130000 |
      | TandAWeeklyN    |   31012024 |     133000 |
      | TandAWeeklyN    |   31012024 |     175000 |
      | TandAWeeklyN    |   31012024 |     180000 |
      | TandAWeeklyN    |   31012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:29    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:31    |                    |                     |
      | 16/01/2024 | 07:00    | 20:00    |                    |                     |
      | 17/01/2024 | 07:00    | 20:00    |                    |                     |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:30    |                    |                     |
      | 23/01/2024 | 03:00    | 20:00    |                    |                     |
      | 24/01/2024 | 03:00    | 20:00    |                    |                     |
      | 25/01/2024 | 03:00    | 20:00    |                    |                     |
      | 26/01/2024 | 05:30    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:30    |                    |                     |
      | 30/01/2024 | 03:00    | 20:00    |                    |                     |
      | 31/01/2024 | 03:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:44    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:46    |                    |                     |
      | 16/01/2024 | 07:15    | 20:00    |                    |                     |
      | 17/01/2024 | 07:15    | 20:00    |                    |                     |
      | 18/01/2024 | 07:15    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:45    |                    |                     |
      | 23/01/2024 | 03:00    | 20:00    |                    |                     |
      | 24/01/2024 | 03:15    | 20:00    |                    |                     |
      | 25/01/2024 | 03:15    | 20:00    |                    |                     |
      | 26/01/2024 | 05:45    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:45    |                    |                     |
      | 30/01/2024 | 03:00    | 20:00    |                    |                     |
      | 31/01/2024 | 03:15    | 20:00    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 05:10              | 05:10               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 01:30              | 01:30               |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:29    | 05:08              | 05:08               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    | 01:31              | 01:31               |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:31    | 05:12              | 05:12               |
      | 16/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 17/01/2024 | 07:00    | 20:00    | 01:29              | 01:29               |
      | 18/01/2024 | 07:00    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:30    | 17:00              | 17:00               |
      | 23/01/2024 | 03:00    | 20:00    | 09:30              | 09:30               |
      | 24/01/2024 | 03:00    | 20:00    | 07:26              | 07:26               |
      | 25/01/2024 | 03:00    | 20:00    |                    |                     |
      | 26/01/2024 | 05:30    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:30    |                    |                     |
      | 30/01/2024 | 03:00    | 20:00    |                    |                     |
      | 31/01/2024 | 03:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    | 05:25              | 05:25               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 01:15              | 01:15               |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:44    | 05:23              | 05:23               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:15    | 20:00    | 01:16              | 01:16               |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
      | 15/01/2024 | 07:00    | 20:46    | 05:27              | 05:27               |
      | 16/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 17/01/2024 | 07:15    | 20:00    | 01:29              | 01:29               |
      | 18/01/2024 | 07:15    | 20:00    |                    |                     |
      | 19/01/2024 | 07:00    | 20:00    |                    |                     |
      | 20/01/2024 | 07:00    | 20:00    |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 | 03:00    | 20:45    | 17:30              | 17:30               |
      | 23/01/2024 | 03:00    | 20:00    | 09:15              | 09:15               |
      | 24/01/2024 | 03:15    | 20:00    | 07:11              | 07:11               |
      | 25/01/2024 | 03:15    | 20:00    |                    |                     |
      | 26/01/2024 | 05:45    | 20:00    |                    |                     |
      | 27/01/2024 | 07:00    | 20:00    |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 | 03:00    | 20:45    |                    |                     |
      | 30/01/2024 | 03:00    | 20:00    |                    |                     |
      | 31/01/2024 | 03:15    | 20:00    |                    |                     |

  @WeeklyOT_6
  Scenario: check Auto Authorize Overtime Component checkbox unchecked in Weekly/Monthly Overtime Configuration
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | false               | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        05000 |     00000 | OT1        |   1.00 |
      |          07200 |        09900 |     00000 | OT2        |   1.33 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     204500 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 05:10              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 03/01/2024 | 07:00    | 20:00    | 01:30              |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    | 05:25              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 03/01/2024 | 07:15    | 20:00    | 01:15              |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "01/01/2024" and "02/01/2024"
      | UserID          | Date       | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandAWeeklyN    | 01/01/2024 | OT1    | 04:45   | 04:45    |            | Saved Successfully |
      | TandAWeeklyN    | 01/01/2024 | OT2    | 00:40   | 00:15    |            | Saved Successfully |
      | TandAWeeklyN    | 02/01/2024 | OT1    | 04:00   | 04:00    |            | Saved Successfully |
      | TandAWeeklyfour | 01/01/2024 | OT1    | 04:30   | 04:00    |            | Saved Successfully |
      | TandAWeeklyfour | 01/01/2024 | OT2    | 00:40   | 00:30    |            | Saved Successfully |
      | TandAWeeklyfour | 02/01/2024 | OT1    | 04:00   | 04:00    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 05:10              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 01:30              |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:45    | 05:25              | 05:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 01:15              |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |

  @WeeklyOT_7
  Scenario: check Auto Authorize Overtime Component checkbox checked but Authorization Required For Late-IN checkbox unchecked in Weekly/Monthly Overtime Configuration
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
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | WeekMonthOT | true             |        30 |                          | Saved Successfully |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | WklyMthlyAuthReqForLateIN | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                 | true                      | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        05000 |     00000 | OT1        |   1.00 |
      |          07200 |        09900 |     00000 | OT2        |   1.33 |
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
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc   | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth | WeekMonthOT |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth | WeekMonthOT |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     092000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     222000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     092500 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     231000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 09:20    | 22:20    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:25    | 23:10    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 05:10              | 05:10               |
      | 02/01/2024 | 09:20    | 22:20    | 04:00              |                     |
      | 03/01/2024 | 07:00    | 20:00    | 01:30              | 01:30               |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:25    | 23:10    | 05:24              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 01:15              | 01:15               |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "01/01/2024" and "02/01/2024"
      | UserID          | Date       | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandAWeeklyN    | 01/01/2024 | OT1    | 04:45   | 04:45    |            | Saved Successfully |
      | TandAWeeklyN    | 01/01/2024 | OT2    | 00:39   | 00:30    |            | Saved Successfully |
      | TandAWeeklyfour | 02/01/2024 | OT1    | 04:00   | 04:00    |            | Saved Successfully |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 05:10              | 05:10               |
      | 02/01/2024 | 09:20    | 22:20    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 01:30              | 01:30               |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:25    | 23:10    | 05:24              | 05:15               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 01:15              | 01:15               |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |

  @WeeklyOT_7
  Scenario: check Week-Offs checked box unchecked and other all check box unchecked in Consider In Net Work Hours
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | false                 | Shift Based             | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     070000 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 00:24              | 00:24               |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |

  @WeeklyOT_8
  Scenario: check Week-Offs checked box checked and Shift base configuration in week offs and other all check box unchecked in Consider In Net Work Hours
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     070000 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 14:00              | 14:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 14:24              | 14:24               |

  @WeeklyOT_9
  Scenario: check Week-Offs checked box checked and Custom Hours configuration in week offs and other all check box unchecked in Consider In Net Work Hours
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Custom Hours            | 10:00                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     070000 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 16:00              | 16:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 16:24              | 16:24               |

  @WeeklyOT_10
  Scenario: check Week-Offs checked box checked and Custom Hours configuration in week offs , Consider Work Done on WO/PH/Paid Leaves checkbox checked and other all check box unchecked in Consider In Net Work Hours
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Custom Hours            | 10:00                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     070000 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 34:30              | 34:30               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 35:45              | 35:45               |

  @WeeklyOT_11
  Scenario: check Week-Offs checked box checked and Custom Hours configuration in week offs , Consider Work Done on WO/PH/Paid Leaves checkbox checked and other all check box unchecked in Consider In Net Work Hours(WO Punches Not Available)
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Custom Hours            | 10:00                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 20:00              | 20:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 20:24              | 20:24               |

  @WeeklyOT_12
  Scenario: check Week-Offs checked box checked and Shift Based configuration in week offs , Consider Work Done on WO/PH/Paid Leaves checkbox checked and other all check box unchecked in Consider In Net Work Hours(WO Punches Not Available)
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          04000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 18:00              | 18:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 18:24              | 18:24               |

  @WeeklyOT_13
  Scenario: check Holidays checked box unchecked,Consider Work Done on WO/PH/Paid Leaves checkbox checked and other all check box unchecked in Consider In Net Work Hours
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
    And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | false                 | Shift Based             | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | DK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "DK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | DK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "DK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 02/01/2024 | 02/01/2024 | Utrayan     | False        |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 10:00              | 10:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 10:24              | 10:24               |

  @WeeklyOT_14
  Scenario: check Holidays checked box checked and Shift Based Configuration in Holidays,Consider Work Done on WO/PH/Paid Leaves checkbox checked and other all check box unchecked in Consider In Net Work Hours
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
    And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | DK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "DK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | DK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "DK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 02/01/2024 | 02/01/2024 | Utrayan     | False        |
      | 10/01/2024 | 10/01/2024 | TeachersDAY | False        |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     203000 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     100000 |
      | TandAWeeklyN    |   08012024 |     101600 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   09012024 |     070000 |
      | TandAWeeklyN    |   09012024 |     090000 |
      | TandAWeeklyN    |   09012024 |     091500 |
      | TandAWeeklyN    |   09012024 |     130000 |
      | TandAWeeklyN    |   09012024 |     133000 |
      | TandAWeeklyN    |   09012024 |     175000 |
      | TandAWeeklyN    |   09012024 |     180000 |
      | TandAWeeklyN    |   09012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:30    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:00    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 19:00              | 19:00               |
      | 08/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 11:00              | 11:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 19:24              | 19:24               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 11:19              | 11:19               |

  @WeeklyOT_15
  Scenario: check Holidays checked box checked and Shift Based Configuration in Holidays,Consider Work Done on WO/PH/Paid Leaves checkbox un-checked and other all check box unchecked in Consider In Net Work Hours
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
    And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | DK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "DK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | DK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "DK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 02/01/2024 | 02/01/2024 | Utrayan     | False        |
      | 10/01/2024 | 10/01/2024 | TeachersDAY | False        |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     203000 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     100000 |
      | TandAWeeklyN    |   08012024 |     101600 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   09012024 |     070000 |
      | TandAWeeklyN    |   09012024 |     090000 |
      | TandAWeeklyN    |   09012024 |     091500 |
      | TandAWeeklyN    |   09012024 |     130000 |
      | TandAWeeklyN    |   09012024 |     133000 |
      | TandAWeeklyN    |   09012024 |     175000 |
      | TandAWeeklyN    |   09012024 |     180000 |
      | TandAWeeklyN    |   09012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:30    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:00    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 07:00              | 07:00               |
      | 08/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 11:00              | 11:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 07:19              | 07:19               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 11:19              | 11:19               |

  @WeeklyOT_16
  Scenario: check Holidays checked box checked and Custom Hours Configuration in Holidays,Consider Work Done on WO/PH/Paid Leaves checkbox un-checked and other all check box unchecked in Consider In Net Work Hours
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
    And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | WklyMthlyHolidaysHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Custom Hours            | 10:30                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | DK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "DK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | DK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "DK"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 02/01/2024 | 02/01/2024 | Utrayan     | False        |
      | 10/01/2024 | 10/01/2024 | TeachersDAY | False        |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     070000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     203000 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     100000 |
      | TandAWeeklyN    |   08012024 |     101600 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   09012024 |     070000 |
      | TandAWeeklyN    |   09012024 |     090000 |
      | TandAWeeklyN    |   09012024 |     091500 |
      | TandAWeeklyN    |   09012024 |     130000 |
      | TandAWeeklyN    |   09012024 |     133000 |
      | TandAWeeklyN    |   09012024 |     175000 |
      | TandAWeeklyN    |   09012024 |     180000 |
      | TandAWeeklyN    |   09012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:30    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:00    |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 08:30              | 08:30               |
      | 08/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 12:30              | 12:30               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 08:49              | 08:49               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 |          |          |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 12:49              | 12:49               |

  @WeeklyOT_17
  Scenario: check Paid Leaves checked box un checked and Shift Based Configuration in Paid Leaves,Consider Work Done on WO/PH/Paid Leaves checkbox checked and other all check box unchecked in Consider In Net Work Hours
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
      | LeaveID |
      | KC      |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | false           | Custom Hours      |                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
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
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs                      | Validation         |
      | Monthly | January | 2024 | KC      |            |          10 | User Wise   | TandAWeeklyN,TandAWeeklyfour | Saved Successfully |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | TandAWeeklyN    |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyN    |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 01/01/2024 | 01/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 08/01/2024 | 08/01/2024 | KC         |                     1 | SA        |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     100000 |
      | TandAWeeklyN    |   08012024 |     101600 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   10012024 |     070000 |
      | TandAWeeklyN    |   10012024 |     100000 |
      | TandAWeeklyN    |   10012024 |     101600 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     133000 |
      | TandAWeeklyN    |   10012024 |     175000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:00    |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 10:00              | 10:00               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 02:00              | 02:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 10:24              | 10:24               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 02:18              | 02:18               |

  @WeeklyOT_18
  Scenario: check Paid Leaves checked box checked and Shift Based Configuration in Paid Leaves,Consider Work Done on WO/PH/Paid Leaves checkbox un-checked and other all check box unchecked in Consider In Net Work Hours
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
      | LeaveID |
      | KC      |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true            | Shift Based       |                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
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
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs                      | Validation         |
      | Monthly | January | 2024 | KC      |            |          10 | User Wise   | TandAWeeklyN,TandAWeeklyfour | Saved Successfully |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | TandAWeeklyN    |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyN    |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 01/01/2024 | 01/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 08/01/2024 | 08/01/2024 | KC         |                     1 | SA        |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     100000 |
      | TandAWeeklyN    |   08012024 |     101600 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   10012024 |     070000 |
      | TandAWeeklyN    |   10012024 |     100000 |
      | TandAWeeklyN    |   10012024 |     101600 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     133000 |
      | TandAWeeklyN    |   10012024 |     175000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:00    |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 06:30              | 06:30               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 11:00              | 11:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 07:19              | 07:19               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 11:18              | 11:18               |

  @WeeklyOT_19
  Scenario: check Paid Leaves checked box checked and Custom Hours Configuration in Paid Leaves,Consider Work Done on WO/PH/Paid Leaves checkbox un-checked and other all check box unchecked in Consider In Net Work Hours
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
      | LeaveID |
      | KC      |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true            | Custom Hours      | 08:15          | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          03000 |        09900 |     00000 | OT1        |   1.00 |
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
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs                      | Validation         |
      | Monthly | January | 2024 | KC      |            |          10 | User Wise   | TandAWeeklyN,TandAWeeklyfour | Saved Successfully |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | TandAWeeklyN    |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyN    |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 01/01/2024 | 01/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 08/01/2024 | 08/01/2024 | KC         |                     1 | SA        |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   09012024 |     070000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   08012024 |     070000 |
      | TandAWeeklyN    |   08012024 |     100000 |
      | TandAWeeklyN    |   08012024 |     101600 |
      | TandAWeeklyN    |   08012024 |     130000 |
      | TandAWeeklyN    |   08012024 |     133000 |
      | TandAWeeklyN    |   08012024 |     175000 |
      | TandAWeeklyN    |   08012024 |     180000 |
      | TandAWeeklyN    |   08012024 |     200000 |
      | TandAWeeklyN    |   10012024 |     070000 |
      | TandAWeeklyN    |   10012024 |     100000 |
      | TandAWeeklyN    |   10012024 |     101600 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     133000 |
      | TandAWeeklyN    |   10012024 |     175000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:00    | 20:00    |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 05:45              | 05:45               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 10:15              | 10:15               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 06:34              | 06:34               |
      | 08/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 10:33              | 10:33               |

  @WeeklyOT_20
  Scenario: check shift based selection in all Consider In Net Work Hours control and Consider Work Done on WO/PH/Paid Leaves checkbox unchecked
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
    And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 01/01/2024 | 01/01/2024 | Utrayan     | False        |
      | 08/01/2024 | 08/01/2024 | Utrayan     | False        |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
      | LeaveID |
      | KC      |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | WklyMthlyHolidaysHrs | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             |                      | true                  | Shift Based             |                      | true            | Shift Based       |                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          02000 |        09900 |     00000 | OT1        |   1.00 |
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
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs                      | Validation         |
      | Monthly | January | 2024 | KC      |            |          10 | User Wise   | TandAWeeklyN,TandAWeeklyfour | Saved Successfully |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | TandAWeeklyN    |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyN    |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     071500 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     071500 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
      | TandAWeeklyN    |   10012024 |     070000 |
      | TandAWeeklyN    |   10012024 |     100000 |
      | TandAWeeklyN    |   10012024 |     101600 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     133000 |
      | TandAWeeklyN    |   10012024 |     175000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 07:00              | 07:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:15    | 20:00    |                    |                     |
      | 07/01/2024 | 07:15    | 20:00    |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 07:00              | 07:00               |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 27:30              | 27:30               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 40:00              | 40:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 07/01/2024 | 07:15    | 20:00    | 28:30              | 28:30               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 40:14              | 40:14               |

  @WeeklyOT_21
  Scenario: check shift based selection in all Consider In Net Work Hours control and Consider Work Done on WO/PH/Paid Leaves checkbox checked
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
    And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Delete Overtime Policy from TnA module
      | Name           |
      | TandAWeekMonth |
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 01/01/2024 | 01/01/2024 | Utrayan     | False        |
      | 08/01/2024 | 08/01/2024 | Utrayan     | False        |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
      | LeaveID |
      | KC      |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | WklyMthlyHolidaysHrs | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             |                      | true                  | Shift Based             |                      | true            | Shift Based       |                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          02000 |        09900 |     00000 | OT1        |   1.00 |
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
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | WEEKMONOT       | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs                      | Validation         |
      | Monthly | January | 2024 | KC      |            |          10 | User Wise   | TandAWeeklyN,TandAWeeklyfour | Saved Successfully |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | TandAWeeklyN    |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyN    |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 02/01/2024 | 02/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 09/01/2024 | 09/01/2024 | KC         |                     1 | SA        |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     101600 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     071500 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     071500 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
      | TandAWeeklyN    |   10012024 |     070000 |
      | TandAWeeklyN    |   10012024 |     100000 |
      | TandAWeeklyN    |   10012024 |     101600 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     133000 |
      | TandAWeeklyN    |   10012024 |     175000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     071500 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     091500 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     133000 |
      | TandAWeeklyN    |   11012024 |     175000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     071500 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     091500 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     133000 |
      | TandAWeeklyN    |   12012024 |     175000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 07:00              | 07:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:15    | 20:00    |                    |                     |
      | 07/01/2024 | 07:15    | 20:00    |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 20:00    |                    |                     |
      | 12/01/2024 | 07:15    | 20:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 07:00              | 07:00               |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 | 07:00    | 20:00    | 54:30              | 54:30               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 40:00              | 40:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 06/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 07/01/2024 | 07:15    | 20:00    | 56:00              | 56:00               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 12/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 40:14              | 40:14               |

  @WeeklyOT_22
  Scenario: check actual and fixed configuration in Overtime Rounding For Fraction Of An Hour for weekly Overtime
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | WklyMthlyHolidaysHrs | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Weekly         | Monday       | true                | true                  | Shift Based             |                      | true                  | Shift Based             |                      | true            | Shift Based       |                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          02000 |        09900 |     00000 | OT1        |   1.00 |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "TandAWeekMonth"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   10012024 |     070000 |
      | TandAWeeklyfour |   10012024 |     130000 |
      | TandAWeeklyfour |   10012024 |     140000 |
      | TandAWeeklyfour |   10012024 |     200000 |
      | TandAWeeklyfour |   11012024 |     070000 |
      | TandAWeeklyfour |   11012024 |     130000 |
      | TandAWeeklyfour |   11012024 |     140000 |
      | TandAWeeklyfour |   11012024 |     200000 |
      | TandAWeeklyfour |   12012024 |     070000 |
      | TandAWeeklyfour |   12012024 |     130000 |
      | TandAWeeklyfour |   12012024 |     140000 |
      | TandAWeeklyfour |   12012024 |     204500 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     140000 |
      | TandAWeeklyN    |   01012024 |     170000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     100000 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     140000 |
      | TandAWeeklyN    |   02012024 |     170000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     070000 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     100000 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     140000 |
      | TandAWeeklyN    |   03012024 |     170000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     070000 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     100000 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     140000 |
      | TandAWeeklyN    |   04012024 |     170000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     100000 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     140000 |
      | TandAWeeklyN    |   05012024 |     170000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     202500 |
      | TandAWeeklyN    |   10012024 |     070000 |
      | TandAWeeklyN    |   10012024 |     100000 |
      | TandAWeeklyN    |   10012024 |     110000 |
      | TandAWeeklyN    |   10012024 |     130000 |
      | TandAWeeklyN    |   10012024 |     140000 |
      | TandAWeeklyN    |   10012024 |     170000 |
      | TandAWeeklyN    |   10012024 |     180000 |
      | TandAWeeklyN    |   10012024 |     200000 |
      | TandAWeeklyN    |   11012024 |     070000 |
      | TandAWeeklyN    |   11012024 |     090000 |
      | TandAWeeklyN    |   11012024 |     100000 |
      | TandAWeeklyN    |   11012024 |     130000 |
      | TandAWeeklyN    |   11012024 |     140000 |
      | TandAWeeklyN    |   11012024 |     170000 |
      | TandAWeeklyN    |   11012024 |     180000 |
      | TandAWeeklyN    |   11012024 |     200000 |
      | TandAWeeklyN    |   12012024 |     070000 |
      | TandAWeeklyN    |   12012024 |     090000 |
      | TandAWeeklyN    |   12012024 |     100000 |
      | TandAWeeklyN    |   12012024 |     130000 |
      | TandAWeeklyN    |   12012024 |     140000 |
      | TandAWeeklyN    |   12012024 |     170000 |
      | TandAWeeklyN    |   12012024 |     180000 |
      | TandAWeeklyN    |   12012024 |     204500 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:45    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:25    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    |                    |                     |
      | 11/01/2024 | 07:00    | 20:00    |                    |                     |
      | 12/01/2024 | 07:00    | 20:45    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              | 04:30               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 38:00              | 38:00               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:45    | 04:45              | 04:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 22:15              | 22:15               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 | 07:00    | 20:25    | 04:25              | 04:25               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          | 28:00              | 28:00               |
      | 08/01/2024 |          |          |                    |                     |
      | 09/01/2024 |          |          |                    |                     |
      | 10/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 11/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 12/01/2024 | 07:00    | 20:45    | 04:45              | 04:45               |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 |          |          | 16:15              | 16:15               |

  @WeeklyOT_23
  Scenario: check Calculation On WO/PH/FB/RD As Per Weekday checkbox checked and WO,PH and WO/PH checkbox unchecked in Weekly/Monthly Overtime configuration
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT                 | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | true           | Weekly         | Monday       | false               | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          02000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     203000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     070000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     200000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     100000 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     140000 |
      | TandAWeeklyN    |   01012024 |     170000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     100000 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     140000 |
      | TandAWeeklyN    |   02012024 |     170000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     070000 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     100000 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     140000 |
      | TandAWeeklyN    |   03012024 |     170000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     070000 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     100000 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     140000 |
      | TandAWeeklyN    |   04012024 |     170000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     100000 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     140000 |
      | TandAWeeklyN    |   05012024 |     170000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     202500 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     100000 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     140000 |
      | TandAWeeklyN    |   06012024 |     170000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     202500 |
      | TandAWeeklyN    |   07012024 |     070000 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     100000 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     140000 |
      | TandAWeeklyN    |   07012024 |     170000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     202500 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:25    |                    |                     |
      | 06/01/2024 | 07:00    | 20:25    |                    |                     |
      | 07/01/2024 | 07:00    | 20:25    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:30    | 04:30              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 05/01/2024 | 07:00    | 20:00    | 24:00              |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:00    | 20:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              |                     |
      | 05/01/2024 | 07:00    | 20:25    | 14:25              |                     |
      | 06/01/2024 | 07:00    | 20:25    |                    |                     |
      | 07/01/2024 | 07:00    | 20:25    |                    |                     |

  @WeeklyOT_24
  Scenario: Consider Weekly Overtime only Monday,Tuesday and Saturday
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
      | TandAWeekMonth | TandAWeekMonth | true              | false              | True      | Mon,Tue,Sat | true           | Weekly         | Monday       | true                | false                | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          02000 |        09900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Set event via Event Set API
      | Userid          | event-date | event-time |
      | TandAWeeklyfour |   01012024 |     070000 |
      | TandAWeeklyfour |   01012024 |     130000 |
      | TandAWeeklyfour |   01012024 |     140000 |
      | TandAWeeklyfour |   01012024 |     200000 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     200000 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   05012024 |     070000 |
      | TandAWeeklyfour |   05012024 |     130000 |
      | TandAWeeklyfour |   05012024 |     140000 |
      | TandAWeeklyfour |   05012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   07012024 |     090000 |
      | TandAWeeklyfour |   07012024 |     130000 |
      | TandAWeeklyfour |   07012024 |     140000 |
      | TandAWeeklyfour |   07012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     200000 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     200000 |
      | TandAWeeklyN    |   03012024 |     071500 |
      | TandAWeeklyN    |   03012024 |     090000 |
      | TandAWeeklyN    |   03012024 |     091500 |
      | TandAWeeklyN    |   03012024 |     130000 |
      | TandAWeeklyN    |   03012024 |     133000 |
      | TandAWeeklyN    |   03012024 |     175000 |
      | TandAWeeklyN    |   03012024 |     180000 |
      | TandAWeeklyN    |   03012024 |     200000 |
      | TandAWeeklyN    |   04012024 |     071500 |
      | TandAWeeklyN    |   04012024 |     090000 |
      | TandAWeeklyN    |   04012024 |     091500 |
      | TandAWeeklyN    |   04012024 |     130000 |
      | TandAWeeklyN    |   04012024 |     133000 |
      | TandAWeeklyN    |   04012024 |     175000 |
      | TandAWeeklyN    |   04012024 |     180000 |
      | TandAWeeklyN    |   04012024 |     200000 |
      | TandAWeeklyN    |   05012024 |     071500 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
      | TandAWeeklyN    |   06012024 |     070000 |
      | TandAWeeklyN    |   06012024 |     090000 |
      | TandAWeeklyN    |   06012024 |     091500 |
      | TandAWeeklyN    |   06012024 |     130000 |
      | TandAWeeklyN    |   06012024 |     133000 |
      | TandAWeeklyN    |   06012024 |     175000 |
      | TandAWeeklyN    |   06012024 |     180000 |
      | TandAWeeklyN    |   06012024 |     200000 |
      | TandAWeeklyN    |   07012024 |     071500 |
      | TandAWeeklyN    |   07012024 |     090000 |
      | TandAWeeklyN    |   07012024 |     091500 |
      | TandAWeeklyN    |   07012024 |     130000 |
      | TandAWeeklyN    |   07012024 |     133000 |
      | TandAWeeklyN    |   07012024 |     175000 |
      | TandAWeeklyN    |   07012024 |     180000 |
      | TandAWeeklyN    |   07012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 09:00    | 18:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:15    | 20:00    |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 09:00    | 18:00    |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 00:10              | 00:10               |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:15    | 20:00    |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 | 07:15    | 20:00    |                    |                     |
