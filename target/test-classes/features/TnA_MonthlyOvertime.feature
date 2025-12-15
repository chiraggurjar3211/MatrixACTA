@MOT_
Feature: Monthly Overtime For 4 punch user and N punch User
  I want to use this template for my feature file

 @MOT_1
  Scenario: Generate Monthly Overtime while only Consider Work Done on WO/PH/Paid Leaves checkbox checked
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 48:00              | 48:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 35:45              | 35:45               |


   @MOT_2
  Scenario: Generate Monthly Overtime while only Consider Work Done on WO/PH/Paid Leaves checkbox un-checked
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | false                 | Saved Successfully |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 24:00              | 24:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 11:50              | 11:50               |


  @MOT_3
  Scenario: Check monthly overtime generated or not while user network hours generated equals to or less then Net-Work Hours Range (From)
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          11200 |        19900 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
	
	@MOT_4
  Scenario: Check monthly overtime generated or not while user network hours generated greater then Net-Work Hours Range (From) and check factor working or not
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          11159 |        19900 |     00000 | OT1        |   5.00 |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |00:05	|00:05	|
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |00:05	|00:05	|
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
	
	 @MOT_5
  Scenario: Check monthly overtime generated or not while user overtime generated equals to or greater then Minimum Duration Required
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          10000 |        19900 |     01200 | OT1        |   1.00 |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |04:00		|04:00		|
      | 02/01/2024 | 07:00    | 20:00    |04:00	|04:00	|
      | 03/01/2024 | 07:00    | 20:00    |04:00|04:00|
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |04:00	|04:00	|
      | 02/01/2024 | 07:00    | 20:00    |04:00	|04:00	|
      | 03/01/2024 | 07:15    | 20:00    |03:45|03:45|
      | 04/01/2024 | 07:15    | 20:00    |00:15|00:15|
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
	
	@MOT_6
  Scenario: Check monthly overtime generated or not while user overtime generated Less then to Minimum Duration Required
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          10000 |        19900 |     01201 | OT1        |   1.00 |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
	
 @MOT_7
  Scenario: Check monthly overtime generated or not while user total network hours less or equal to Net-Work Hours Range (To)
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          10000 |        11200 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 00:15              | 00:15               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |

 @MOT_8
  Scenario: Check monthly overtime generated or not while user total network hours greater then Net-Work Hours Range (To)
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
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          10000 |        11000 |     00000 | OT1        |   1.00 |
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
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 02:00              | 02:00               |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 02:00              | 02:00               |
      | 04/01/2024 | 07:15    | 20:00    |                    |                |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |

@MOT_9
  Scenario: check Multiple Configuration in Work Component Configuration for Monthly Overtime
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
    | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
    | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
    |          03000 |        05000 |     00000 | OT1        |   1.00 |
    |          10000 |        12000 |     00000 | OT2        |   2.00 |
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
    | TandAWeeklyfour |   14012024 |     070000 |
    | TandAWeeklyfour |   14012024 |     130000 |
    | TandAWeeklyfour |   14012024 |     140000 |
    | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:00    | 20:00    |                    |                     |
    | 04/01/2024 | 07:00    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:15    | 20:00    |                    |                     |
    | 04/01/2024 | 07:15    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
    | UserID          |
    | TandAWeeklyfour |
    | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 04/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:15    | 20:00    | 07:30              | 07:30               |
      | 04/01/2024 | 07:15    | 20:00    | 07:30              | 07:30               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 04:15              | 04:15               |
      | 09/01/2024 | 07:15    | 20:00    | 00:45              | 00:45               |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
      
      @MOT_10
  Scenario: check Auto Authorize Overtime Component checkbox unchecked for Monthly Overtime
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
    | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | false               | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
    | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
    |          03000 |        05000 |     00000 | OT1        |   1.00 |
    |          10000 |        12000 |     00000 | OT2        |   1.00 |
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
    | TandAWeeklyfour |   14012024 |     070000 |
    | TandAWeeklyfour |   14012024 |     130000 |
    | TandAWeeklyfour |   14012024 |     140000 |
    | TandAWeeklyfour |   14012024 |     200000 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:00    | 20:00    |                    |                     |
    | 04/01/2024 | 07:00    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:15    | 20:00    |                    |                     |
    | 04/01/2024 | 07:15    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
    | UserID          |
    | TandAWeeklyfour |
    | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    | 08:00              |                     |
    | 02/01/2024 | 07:00    | 20:00    | 08:00              |                     |
    | 03/01/2024 | 07:00    | 20:00    | 08:00              |                     |
    | 04/01/2024 | 07:00    | 20:00    | 04:00              |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    | 04:00              |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    | 08:00              |                     |
    | 02/01/2024 | 07:00    | 20:00    | 08:00              |                     |
    | 03/01/2024 | 07:15    | 20:00    | 07:30              |                     |
    | 04/01/2024 | 07:15    | 20:00    | 04:00              |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    | 04:00              |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 07:15    | 20:00    | 00:30              |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Monthly" from SA on "January" and "2024"
      | UserID          | OTType | OTHours | AuthAsOT | AuthAsCOFF | AuthSequence  | Validation         |
      | TandAWeeklyfour | OT1    | 20:00   | 20:00    |            | OT then C-OFF | Saved Successfully |
      | TandAWeeklyfour | OT2    | 12:00   | 12:00    |            | OT then C-OFF | Saved Successfully |
      | TandAWeeklyN    | OT1    | 20:00   | 20:00    |            | OT then C-OFF | Saved Successfully |
      | TandAWeeklyN    | OT2    | 12:00   | 12:00    |            | OT then C-OFF | Saved Successfully |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:15    | 20:00    | 07:30              | 07:30               |
      | 04/01/2024 | 07:15    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 00:30              | 00:30               |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
      
 @MOT_11
  Scenario: Auto Authorize Overtime Component checkbox checked and Authorization Required For Late-IN checked also for Monthly Overtime
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
    | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL |WklyMthlyAuthReqForLateIN |validation         |
    | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true               | true                 |true												|Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
    | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
    |          03000 |        05000 |     00000 | OT1        |   1.00 |
    |          10000 |        12000 |     00000 | OT2        |   1.00 |
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
    | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |WeekMonthOT|             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
    | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |WeekMonthOT|             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |
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
    | TandAWeeklyfour |   01012024 |     091500 |
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
    | TandAWeeklyfour |   14012024 |     092000 |
    | TandAWeeklyfour |   14012024 |     130000 |
    | TandAWeeklyfour |   14012024 |     140000 |
    | TandAWeeklyfour |   14012024 |     200000 |
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
    | TandAWeeklyN    |   11012024 |     145000 |
    | TandAWeeklyN    |   11012024 |     175000 |
    | TandAWeeklyN    |   14012024 |     092500 |
    | TandAWeeklyN    |   14012024 |     130000 |
    | TandAWeeklyN    |   14012024 |     133000 |
    | TandAWeeklyN    |   14012024 |     175000 |
    | TandAWeeklyN    |   14012024 |     180000 |
    | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 09:15    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:00    | 20:00    |                    |                     |
    | 04/01/2024 | 07:00    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 09:00    | 18:00    |                    |                     |
    | 09/01/2024 | 09:00    | 18:00    |                    |                     |
    | 10/01/2024 | 09:00    | 18:00    |                    |                     |
    | 11/01/2024 | 09:00    | 18:00    |                    |                     |
    | 12/01/2024 | 09:00    | 18:00    |                    |                     |
    | 13/01/2024 |          |          |                    |                     |
    | 14/01/2024 | 09:20    | 20:00    |                    |                     |
    | 15/01/2024 |          |          |                    |                     |
    | 16/01/2024 |          |          |                    |                     |
    | 17/01/2024 |          |          |                    |                     |
    | 18/01/2024 |          |          |                    |                     |
    | 19/01/2024 |          |          |                    |                     |
    | 20/01/2024 |          |          |                    |                     |
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 |  09:15    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:15    | 20:00    |                    |                     |
    | 04/01/2024 | 07:15    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 07:15    | 20:00    |                    |                     |
    | 09/01/2024 | 07:15    | 20:00    |                    |                     |
    | 10/01/2024 | 07:15    | 20:00    |                    |                     |
    | 11/01/2024 | 07:15    | 17:50    |                    |                     |
    | 12/01/2024 |          |          |                    |                     |
    | 13/01/2024 |          |          |                    |                     |
    | 14/01/2024 | 09:25    | 20:00    |                    |                     |
    | 15/01/2024 |          |          |                    |                     |
    | 16/01/2024 |          |          |                    |                     |
    | 17/01/2024 |          |          |                    |                     |
    | 18/01/2024 |          |          |                    |                     |
    | 19/01/2024 |          |          |                    |                     |
    | 20/01/2024 |          |          |                    |                     |
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
    | UserID          |
    | TandAWeeklyfour |
    | TandAWeeklyN    |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:15    | 20:00    | 03:30              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:00    | 20:00    | 05:40              | 05:40               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 09:20    | 20:00    | 02:00              |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 00:15              | 00:15               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:15    | 20:00    | 03:30              |                     |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:15    | 20:00    | 06:05              | 06:05               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 02:45              | 02:45               |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 09:25    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "01/01/2024" and "31/01/2024"
      | UserID          | Date       | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | TandAWeeklyfour | 01/01/2024 | OT1    | 01:45   | 01:45    |            | Saved Successfully |
      | TandAWeeklyfour | 01/01/2024 | OT2    | 01:45   | 01:45    |            | Saved Successfully |
      | TandAWeeklyfour | 14/01/2024 | OT1    | 02:00   | 02:00    |            | Saved Successfully |
      | TandAWeeklyN    | 01/01/2024 | OT1    | 01:45   | 01:45    |            | Saved Successfully |
      | TandAWeeklyN    | 01/01/2024 | OT2    | 01:45   | 01:45    |            | Saved Successfully |
     Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:15    | 20:00    | 03:30              |03:30|
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:00    | 20:00    | 05:40              | 05:40               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 09:20    | 20:00    | 02:00              |02:00 |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 00:15              | 00:15               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 09:15    | 20:00    | 03:30              | 03:30 |
      | 02/01/2024 | 07:00    | 20:00    | 08:00              | 08:00               |
      | 03/01/2024 | 07:15    | 20:00    | 06:05              | 06:05               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 02:45              | 02:45               |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 09:25    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
      
@MOT_12
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | false                 | Shift Based             | false                | Saved Successfully |
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00     |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 |07:00     | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 20:00              | 20:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 20:10              | 20:10               |
      
      
  @MOT_13
  Scenario: check Week-Offs checked box checked and Shift base configuration in week offs and other all check box unchecked in Consider In Net Work Hours and Calculation On WO/PH/FB/RD As Per Weekday checkbox unchecked
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | false              | false               | True      | All         | true           | Monthly        | true                | true                  | Shift Based             | false                | Saved Successfully |
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |32:00|32:00|
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |32:00|32:00|
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 92:00              |92:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    |01:45	              | 01:45	              |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |92:10	              | 92:10	              |
      
      @MOT_14
  Scenario: check Week-Offs checked box checked, Custom Hours selected and other all check box unchecked in Consider In Net Work Hours and Calculation On WO/PH/FB/RD As Per Weekday checkbox unchecked
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true                  | Custom Hours            | 09:15                | false                | Saved Successfully |
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 34:00              | 34:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 34:00              | 34:00               |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 94:00              | 94:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 94:10              | 94:10               |
      
       @MOT_15
  Scenario: check Holiday check box checked, Shift Based drop down selected,Consider Work Done on WO/PH/Paid Leaves checkbox unchecked and other all check box unchecked in Consider In Net Work Hours and Calculation On WO/PH/FB/RD As Per Weekday checkbox unchecked
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
     And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal |  WklyMthlyHolidaysHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true                  | Shift Based              |                      | false                | Saved Successfully |
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
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 15/01/2024 | 17/01/2024 | Utrayan     | False        |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |HolidaySchedule|
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |WEEKMONOT|
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |WEEKMONOT|
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
      | TandAWeeklyfour |   15012024 |     070000 |
      | TandAWeeklyfour |   15012024 |     130000 |
      | TandAWeeklyfour |   15012024 |     140000 |
      | TandAWeeklyfour |   15012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
       | TandAWeeklyN    |   15012024 |     071500 |
      | TandAWeeklyN    |   15012024 |     090000 |
      | TandAWeeklyN    |   15012024 |     091500 |
      | TandAWeeklyN    |   15012024 |     130000 |
      | TandAWeeklyN    |   15012024 |     133000 |
      | TandAWeeklyN    |   15012024 |     175000 |
      | TandAWeeklyN    |   15012024 |     180000 |
      | TandAWeeklyN    |   15012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 | 07:00    | 20:00    |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |               |               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |07:15    | 20:00    |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |              |               |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 | 07:00    | 20:00    |  04:00              | 04:00    |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 43:00              | 43:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |07:15    | 20:00    | 03:45              | 03:45               |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 43:25              | 43:25               |
      
      @MOT_16
  Scenario: check Holiday check box checked, Custom Hours drop down selected,Consider Work Done on WO/PH/Paid Leaves checkbox unchecked and other all check box unchecked in Consider In Net Work Hours and Calculation On WO/PH/FB/RD As Per Weekday checkbox unchecked
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
     And Delete Holiday Schedule
      | HSName    |
      | WEEKMONOT |
    And Create NetWork Hours Policy "TandAWeekMonth"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal |  WklyMthlyHolidaysHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true                  |Custom Hours             |   05:00                   | false                | Saved Successfully |
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
    And Create Holiday Schedule "WEEKMONOT"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 15/01/2024 | 17/01/2024 | Utrayan     | False        |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |HolidaySchedule|
      | TandAWeeklyfour | True   | True      |                        4 | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |WEEKMONOT|
      | TandAWeeklyN    | True   | True      | N-Punch                  | Both              |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully |WEEKMONOT|
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |              |                |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 35:00              | 35:00              |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 35:10              | 35:10               |
      
      @MOT_17
  Scenario: check Paid Leaves checked box checked and Shift Based Configuration in Paid Leaves,Consider Work Done on WO/PH/Paid Leaves checkbox unchecked and other all check box unchecked in Consider In Net Work Hours
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true            | Shift Based       |                | false                | Saved Successfully |
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
      | TandAWeeklyN    |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 47:00              | 47:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 47:10              | 47:10               |
      
       @MOT_18
  Scenario: check Paid Leaves checked box checked and Custom Based Configuration in Paid Leaves,Consider Work Done on WO/PH/Paid Leaves checkbox unchecked and other all check box unchecked in Consider In Net Work Hours
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true            | Custom Hours       |   05:30             | false                | Saved Successfully |
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
      | TandAWeeklyN    |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
      | TandAWeeklyfour |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
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
      | TandAWeeklyfour |   13012024 |     070000 |
      | TandAWeeklyfour |   13012024 |     130000 |
      | TandAWeeklyfour |   13012024 |     140000 |
      | TandAWeeklyfour |   13012024 |     200000 |
      | TandAWeeklyfour |   14012024 |     070000 |
      | TandAWeeklyfour |   14012024 |     130000 |
      | TandAWeeklyfour |   14012024 |     140000 |
      | TandAWeeklyfour |   14012024 |     200000 |
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
      | TandAWeeklyN    |   05012024 |     070000 |
      | TandAWeeklyN    |   05012024 |     090000 |
      | TandAWeeklyN    |   05012024 |     091500 |
      | TandAWeeklyN    |   05012024 |     130000 |
      | TandAWeeklyN    |   05012024 |     133000 |
      | TandAWeeklyN    |   05012024 |     175000 |
      | TandAWeeklyN    |   05012024 |     180000 |
      | TandAWeeklyN    |   05012024 |     200000 |
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
      | TandAWeeklyN    |   13012024 |     071500 |
      | TandAWeeklyN    |   13012024 |     090000 |
      | TandAWeeklyN    |   13012024 |     091500 |
      | TandAWeeklyN    |   13012024 |     130000 |
      | TandAWeeklyN    |   13012024 |     133000 |
      | TandAWeeklyN    |   13012024 |     175000 |
      | TandAWeeklyN    |   13012024 |     180000 |
      | TandAWeeklyN    |   13012024 |     200000 |
      | TandAWeeklyN    |   14012024 |     071500 |
      | TandAWeeklyN    |   14012024 |     090000 |
      | TandAWeeklyN    |   14012024 |     091500 |
      | TandAWeeklyN    |   14012024 |     130000 |
      | TandAWeeklyN    |   14012024 |     133000 |
      | TandAWeeklyN    |   14012024 |     175000 |
      | TandAWeeklyN    |   14012024 |     180000 |
      | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 36:30              | 36:30              |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 36:40              | 36:40               |
     
      @MOT_19
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
    And Delete Overtime Policy from TnA module
    | Name           |
    | TandAWeekMonth |
    And Delete Holiday Schedule
    | HSName    |
    | WEEKMONOT |
    And Create Leave
    | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
    | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
    | LeaveID |
    | KC      |
    And Create Holiday Schedule "WEEKMONOT"
    | FromDate   | ToDate     | HolidayName | DeviceSynced |
    | 20/01/2024 | 22/01/2024 | Utrayan     | False        |
    And Create NetWork Hours Policy "TandAWeekMonth"
    | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
    | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
    | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | WklyMthlyHolidaysHrs |WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
    | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true                  | Shift Based             |                      | true                  | Shift Based             |                      |true            | Shift Based       | 05:30          | true                 | Saved Successfully |
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
    And Create user from user configuration
    | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | HolidaySchedule |
    | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully | WEEKMONOT       |
    | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully | WEEKMONOT       |
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
    | TandAWeeklyN    |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
    | TandAWeeklyfour |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
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
    | TandAWeeklyfour |   13012024 |     070000 |
    | TandAWeeklyfour |   13012024 |     130000 |
    | TandAWeeklyfour |   13012024 |     140000 |
    | TandAWeeklyfour |   13012024 |     200000 |
    | TandAWeeklyfour |   14012024 |     070000 |
    | TandAWeeklyfour |   14012024 |     130000 |
    | TandAWeeklyfour |   14012024 |     140000 |
    | TandAWeeklyfour |   14012024 |     200000 |
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
    | TandAWeeklyN    |   05012024 |     070000 |
    | TandAWeeklyN    |   05012024 |     090000 |
    | TandAWeeklyN    |   05012024 |     091500 |
    | TandAWeeklyN    |   05012024 |     130000 |
    | TandAWeeklyN    |   05012024 |     133000 |
    | TandAWeeklyN    |   05012024 |     175000 |
    | TandAWeeklyN    |   05012024 |     180000 |
    | TandAWeeklyN    |   05012024 |     200000 |
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
    | TandAWeeklyN    |   13012024 |     071500 |
    | TandAWeeklyN    |   13012024 |     090000 |
    | TandAWeeklyN    |   13012024 |     091500 |
    | TandAWeeklyN    |   13012024 |     130000 |
    | TandAWeeklyN    |   13012024 |     133000 |
    | TandAWeeklyN    |   13012024 |     175000 |
    | TandAWeeklyN    |   13012024 |     180000 |
    | TandAWeeklyN    |   13012024 |     200000 |
    | TandAWeeklyN    |   14012024 |     071500 |
    | TandAWeeklyN    |   14012024 |     090000 |
    | TandAWeeklyN    |   14012024 |     091500 |
    | TandAWeeklyN    |   14012024 |     130000 |
    | TandAWeeklyN    |   14012024 |     133000 |
    | TandAWeeklyN    |   14012024 |     175000 |
    | TandAWeeklyN    |   14012024 |     180000 |
    | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:00    | 20:00    |                    |                     |
    | 04/01/2024 | 07:00    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 09:00    | 18:00    |                    |                     |
    | 09/01/2024 | 09:00    | 18:00    |                    |                     |
    | 10/01/2024 | 09:00    | 18:00    |                    |                     |
    | 11/01/2024 | 09:00    | 18:00    |                    |                     |
    | 12/01/2024 | 09:00    | 18:00    |                    |                     |
    | 13/01/2024 | 07:00    | 20:00    |                    |                     |
    | 14/01/2024 | 07:00    | 20:00    |                    |                     |
    | 15/01/2024 |          |          |                    |                     |
    | 16/01/2024 |          |          |                    |                     |
    | 17/01/2024 |          |          |                    |                     |
    | 18/01/2024 |          |          |                    |                     |
    | 19/01/2024 |          |          |                    |                     |
    | 20/01/2024 |          |          |                    |                     |
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          | 41:00              | 41:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 41:00              | 41:00               |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 131:00            | 131:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 119:00              | 119:00               |
     
     
     @MOT_20
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
    And Delete Overtime Policy from TnA module
    | Name           |
    | TandAWeekMonth |
    And Delete Holiday Schedule
    | HSName    |
    | WEEKMONOT |
    And Create Leave
    | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
    | KC      | TandAWeekMonth | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "TandAWeekMonth" with Pro-rata "False"
    | LeaveID |
    | KC      |
    And Create Holiday Schedule "WEEKMONOT"
    | FromDate   | ToDate     | HolidayName | DeviceSynced |
    | 20/01/2024 | 22/01/2024 | Utrayan     | False        |
    And Create NetWork Hours Policy "TandAWeekMonth"
    | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
    | Work Hours Within Shift |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    | Early-IN                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    | Overstay                |      0000 |    2300 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
    | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | WklyMthlyWeekOffsFlag | WklyMthlyWeekOffsHrsCal | WklyMthlyWeekOffsHrs | WklyMthlyHolidaysFlag | WklyMthlyHolidaysHrsCal | WklyMthlyHolidaysHrs |WklyMthlyPLFlag | WklyMthlyPLHrsCal | WklyMthlyPLHrs | ConsWorkDoneonWOPHPL | validation         |
    | TandAWeekMonth | TandAWeekMonth | false             | false              | True      | All         | true           | Monthly        | true                | true                  | Shift Based             |                      | true                  | Shift Based             |                      |true            | Shift Based       | 05:30          | false                 | Saved Successfully |
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
    And Create user from user configuration
    | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | LeaveGroup     | AttendancePlc | AbsenteePlc | OvertimePlc    | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | HolidaySchedule |
    | TandAWeeklyfour | True   | True      |                        4 | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully | WEEKMONOT       |
    | TandAWeeklyN    | True   | True      | N-Punch                  | Both              | TandAWeekMonth |               |             | TandAWeekMonth |           |             |         | True      | DK            | DK         | True      | True      | True               | Saved Successfully | WEEKMONOT       |
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
    | TandAWeeklyN    |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
    | TandAWeeklyfour |                  1 | 15/01/2024 | 17/01/2024 | KC         |                     1 | SA        |
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
    | TandAWeeklyfour |   13012024 |     070000 |
    | TandAWeeklyfour |   13012024 |     130000 |
    | TandAWeeklyfour |   13012024 |     140000 |
    | TandAWeeklyfour |   13012024 |     200000 |
    | TandAWeeklyfour |   14012024 |     070000 |
    | TandAWeeklyfour |   14012024 |     130000 |
    | TandAWeeklyfour |   14012024 |     140000 |
    | TandAWeeklyfour |   14012024 |     200000 |
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
    | TandAWeeklyN    |   05012024 |     070000 |
    | TandAWeeklyN    |   05012024 |     090000 |
    | TandAWeeklyN    |   05012024 |     091500 |
    | TandAWeeklyN    |   05012024 |     130000 |
    | TandAWeeklyN    |   05012024 |     133000 |
    | TandAWeeklyN    |   05012024 |     175000 |
    | TandAWeeklyN    |   05012024 |     180000 |
    | TandAWeeklyN    |   05012024 |     200000 |
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
    | TandAWeeklyN    |   13012024 |     071500 |
    | TandAWeeklyN    |   13012024 |     090000 |
    | TandAWeeklyN    |   13012024 |     091500 |
    | TandAWeeklyN    |   13012024 |     130000 |
    | TandAWeeklyN    |   13012024 |     133000 |
    | TandAWeeklyN    |   13012024 |     175000 |
    | TandAWeeklyN    |   13012024 |     180000 |
    | TandAWeeklyN    |   13012024 |     200000 |
    | TandAWeeklyN    |   14012024 |     071500 |
    | TandAWeeklyN    |   14012024 |     090000 |
    | TandAWeeklyN    |   14012024 |     091500 |
    | TandAWeeklyN    |   14012024 |     130000 |
    | TandAWeeklyN    |   14012024 |     133000 |
    | TandAWeeklyN    |   14012024 |     175000 |
    | TandAWeeklyN    |   14012024 |     180000 |
    | TandAWeeklyN    |   14012024 |     200000 |
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 20:00    |                    |                     |
    | 02/01/2024 | 07:00    | 20:00    |                    |                     |
    | 03/01/2024 | 07:00    | 20:00    |                    |                     |
    | 04/01/2024 | 07:00    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 09:00    | 18:00    |                    |                     |
    | 09/01/2024 | 09:00    | 18:00    |                    |                     |
    | 10/01/2024 | 09:00    | 18:00    |                    |                     |
    | 11/01/2024 | 09:00    | 18:00    |                    |                     |
    | 12/01/2024 | 09:00    | 18:00    |                    |                     |
    | 13/01/2024 | 07:00    | 20:00    |                    |                     |
    | 14/01/2024 | 07:00    | 20:00    |                    |                     |
    | 15/01/2024 |          |          |                    |                     |
    | 16/01/2024 |          |          |                    |                     |
    | 17/01/2024 |          |          |                    |                     |
    | 18/01/2024 |          |          |                    |                     |
    | 19/01/2024 |          |          |                    |                     |
    | 20/01/2024 |          |          |                    |                     |
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          | 41:00              | 41:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    |                    |                     |
      | 02/01/2024 | 07:00    | 20:00    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 | 07:00    | 20:00    |                    |                     |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    |                    |                     |
      | 09/01/2024 | 07:15    | 20:00    |                    |                     |
      | 10/01/2024 | 07:15    | 20:00    |                    |                     |
      | 11/01/2024 | 07:15    | 17:50    |                    |                     |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |                    |                     |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 41:00              | 41:00               |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 18:00    |                    |                     |
      | 09/01/2024 | 09:00    | 18:00    |                    |                     |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 14/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 128:00	          | 128:00	               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 02/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 06/01/2024 |          |          |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 09/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 14/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 119:00              | 119:00               |
      
      @MOT_21
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
    | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | validation         |
    | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | All         | true           | Monthly        | true                | true                 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "TandAWeekMonth"
    | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
    |          04000 |        19900 |     00000 | OT1        |   1.00 |
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
    | TandAWeeklyfour |   01012024 |     193500 |
    | TandAWeeklyfour |   02012024 |     070000 |
    | TandAWeeklyfour |   02012024 |     130000 |
    | TandAWeeklyfour |   02012024 |     140000 |
    | TandAWeeklyfour |   02012024 |     191500 |
    | TandAWeeklyfour |   03012024 |     070000 |
    | TandAWeeklyfour |   03012024 |     130000 |
    | TandAWeeklyfour |   03012024 |     140000 |
    | TandAWeeklyfour |   03012024 |     200000 |
    | TandAWeeklyfour |   04012024 |     070000 |
    | TandAWeeklyfour |   04012024 |     130000 |
    | TandAWeeklyfour |   04012024 |     140000 |
    | TandAWeeklyfour |   04012024 |     200000 |
    | TandAWeeklyfour |   06012024 |     070000 |
    | TandAWeeklyfour |   06012024 |     130000 |
    | TandAWeeklyfour |   06012024 |     140000 |
    | TandAWeeklyfour |   06012024 |     200000 |
    | TandAWeeklyfour |   08012024 |     090000 |
    | TandAWeeklyfour |   08012024 |     130000 |
    | TandAWeeklyfour |   08012024 |     140000 |
    | TandAWeeklyfour |   08012024 |     193500 |
    | TandAWeeklyfour |   09012024 |     090000 |
    | TandAWeeklyfour |   09012024 |     130000 |
    | TandAWeeklyfour |   09012024 |     140000 |
    | TandAWeeklyfour |   09012024 |     191500|
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
    | TandAWeeklyN    |   01012024 |     070000 |
    | TandAWeeklyN    |   01012024 |     090000 |
    | TandAWeeklyN    |   01012024 |     091500 |
    | TandAWeeklyN    |   01012024 |     130000 |
    | TandAWeeklyN    |   01012024 |     133000 |
    | TandAWeeklyN    |   01012024 |     175000 |
    | TandAWeeklyN    |   01012024 |     180000 |
    | TandAWeeklyN    |   01012024 |     193500 |
    | TandAWeeklyN    |   02012024 |     070000 |
    | TandAWeeklyN    |   02012024 |     090000 |
    | TandAWeeklyN    |   02012024 |     091500 |
    | TandAWeeklyN    |   02012024 |     130000 |
    | TandAWeeklyN    |   02012024 |     133000 |
    | TandAWeeklyN    |   02012024 |     175000 |
    | TandAWeeklyN    |   02012024 |     180000 |
    | TandAWeeklyN    |   02012024 |     191500 |
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
    | TandAWeeklyN    |   08012024 |     193500 |
    | TandAWeeklyN    |   09012024 |     071500 |
    | TandAWeeklyN    |   09012024 |     090000 |
    | TandAWeeklyN    |   09012024 |     091500 |
    | TandAWeeklyN    |   09012024 |     130000 |
    | TandAWeeklyN    |   09012024 |     133000 |
    | TandAWeeklyN    |   09012024 |     175000 |
    | TandAWeeklyN    |   09012024 |     180000 |
    | TandAWeeklyN    |   09012024 |     191500 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 19:35    |                    |                     |
    | 02/01/2024 | 07:00    | 19:15   |                    |                     |
    | 03/01/2024 | 07:00    | 20:00    |                    |                     |
    | 04/01/2024 | 07:00    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 09:00    | 19:35    |                    |                     |
    | 09/01/2024 | 09:00    | 19:15    |                    |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
    | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
    | 01/01/2024 | 07:00    | 19:35    |                    |                     |
    | 02/01/2024 | 07:00    | 19:15    |                    |                     |
    | 03/01/2024 | 07:15    | 20:00    |                    |                     |
    | 04/01/2024 | 07:15    | 20:00    |                    |                     |
    | 05/01/2024 |          |          |                    |                     |
    | 06/01/2024 | 07:00    | 20:00    |                    |                     |
    | 07/01/2024 |          |          |                    |                     |
    | 08/01/2024 | 07:15    | 19:35    |                    |                     |
    | 09/01/2024 | 07:15    | 19:15    |                    |                     |
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
    | 21/01/2024 |          |          |                    |                     |
    | 22/01/2024 |          |          |                    |                     |
    | 23/01/2024 |          |          |                    |                     |
    | 24/01/2024 |          |          |                    |                     |
    | 25/01/2024 |          |          |                    |                     |
    | 26/01/2024 |          |          |                    |                     |
    | 27/01/2024 |          |          |                    |                     |
    | 28/01/2024 |          |          |                    |                     |
    | 29/01/2024 |          |          |                    |                     |
    | 30/01/2024 |          |          |                    |                     |
    | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
    | UserID          |
    | TandAWeeklyfour |
    | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 19:35    | 03:35              | 03:35               |
      | 02/01/2024 | 07:00    | 19:15    | 03:15              | 03:15               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 19:35    | 01:35              | 01:35               |
      | 09/01/2024 | 09:00    | 19:15    | 01:15              | 01:15               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 48:20              | 48:20               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 19:35    | 03:35              | 03:35               |
      | 02/01/2024 | 07:00    | 19:15    | 03:15              | 03:15               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 19:35    | 03:20              | 03:20               |
      | 09/01/2024 | 07:15    | 19:15    | 03:00              | 03:00               |
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
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 36:05              | 36:05               |
      
      @MOT_22
  Scenario: check Calculation On WO/PH/FB/RD As Per Weekday checkbox checked and WO,PH and WO/PH checkbox checked/Unchecked in Weekly/Monthly Overtime configuration
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
      | PlcName        | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT                 | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | validation         |
      | TandAWeekMonth | TandAWeekMonth | True              | True               | True      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | true           | Monthly        | true                | true                 | Saved Successfully |
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
      | TandAWeeklyfour |   01012024 |     193500 |
      | TandAWeeklyfour |   02012024 |     070000 |
      | TandAWeeklyfour |   02012024 |     130000 |
      | TandAWeeklyfour |   02012024 |     140000 |
      | TandAWeeklyfour |   02012024 |     191500 |
      | TandAWeeklyfour |   03012024 |     070000 |
      | TandAWeeklyfour |   03012024 |     130000 |
      | TandAWeeklyfour |   03012024 |     140000 |
      | TandAWeeklyfour |   03012024 |     200000 |
      | TandAWeeklyfour |   04012024 |     070000 |
      | TandAWeeklyfour |   04012024 |     130000 |
      | TandAWeeklyfour |   04012024 |     140000 |
      | TandAWeeklyfour |   04012024 |     200000 |
      | TandAWeeklyfour |   06012024 |     070000 |
      | TandAWeeklyfour |   06012024 |     130000 |
      | TandAWeeklyfour |   06012024 |     140000 |
      | TandAWeeklyfour |   06012024 |     200000 |
      | TandAWeeklyfour |   08012024 |     090000 |
      | TandAWeeklyfour |   08012024 |     130000 |
      | TandAWeeklyfour |   08012024 |     140000 |
      | TandAWeeklyfour |   08012024 |     193500 |
      | TandAWeeklyfour |   09012024 |     090000 |
      | TandAWeeklyfour |   09012024 |     130000 |
      | TandAWeeklyfour |   09012024 |     140000 |
      | TandAWeeklyfour |   09012024 |     191500 |
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
      | TandAWeeklyN    |   01012024 |     070000 |
      | TandAWeeklyN    |   01012024 |     090000 |
      | TandAWeeklyN    |   01012024 |     091500 |
      | TandAWeeklyN    |   01012024 |     130000 |
      | TandAWeeklyN    |   01012024 |     133000 |
      | TandAWeeklyN    |   01012024 |     175000 |
      | TandAWeeklyN    |   01012024 |     180000 |
      | TandAWeeklyN    |   01012024 |     193500 |
      | TandAWeeklyN    |   02012024 |     070000 |
      | TandAWeeklyN    |   02012024 |     090000 |
      | TandAWeeklyN    |   02012024 |     091500 |
      | TandAWeeklyN    |   02012024 |     130000 |
      | TandAWeeklyN    |   02012024 |     133000 |
      | TandAWeeklyN    |   02012024 |     175000 |
      | TandAWeeklyN    |   02012024 |     180000 |
      | TandAWeeklyN    |   02012024 |     191500 |
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
      | TandAWeeklyN    |   08012024 |     193500 |
      | TandAWeeklyN    |   09012024 |     071500 |
      | TandAWeeklyN    |   09012024 |     090000 |
      | TandAWeeklyN    |   09012024 |     091500 |
      | TandAWeeklyN    |   09012024 |     130000 |
      | TandAWeeklyN    |   09012024 |     133000 |
      | TandAWeeklyN    |   09012024 |     175000 |
      | TandAWeeklyN    |   09012024 |     180000 |
      | TandAWeeklyN    |   09012024 |     191500 |
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
    And Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 19:35    |                    |                     |
      | 02/01/2024 | 07:00    | 19:15    |                    |                     |
      | 03/01/2024 | 07:00    | 20:00    |                    |                     |
      | 04/01/2024 | 07:00    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 19:35    |                    |                     |
      | 09/01/2024 | 09:00    | 19:15    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 19:35    |                    |                     |
      | 02/01/2024 | 07:00    | 19:15    |                    |                     |
      | 03/01/2024 | 07:15    | 20:00    |                    |                     |
      | 04/01/2024 | 07:15    | 20:00    |                    |                     |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |                    |                     |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 19:35    |                    |                     |
      | 09/01/2024 | 07:15    | 19:15    |                    |                     |
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
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          |                    |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | TandAWeeklyfour |
      | TandAWeeklyN    |
    Then Daily Attendance View for userid "TandAWeeklyfour" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 19:35    | 03:35              | 03:35               |
      | 02/01/2024 | 07:00    | 19:15    | 03:15              | 03:15               |
      | 03/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 04/01/2024 | 07:00    | 20:00    | 04:00              | 04:00               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |             |               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 09:00    | 19:35    | 01:35              | 01:35               |
      | 09/01/2024 | 09:00    | 19:15    | 01:15              | 01:15               |
      | 10/01/2024 | 09:00    | 18:00    |                    |                     |
      | 11/01/2024 | 09:00    | 18:00    |                    |                     |
      | 12/01/2024 | 09:00    | 18:00    |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 07:00    | 20:00    |               |              |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 32:00              | 32:00               |
    And Daily Attendance View for userid "TandAWeeklyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | 07:00    | 19:35    | 03:35              | 03:35               |
      | 02/01/2024 | 07:00    | 19:15    | 03:15              | 03:15               |
      | 03/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 04/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 05/01/2024 |          |          |                    |                     |
      | 06/01/2024 | 07:00    | 20:00    |            |               |
      | 07/01/2024 |          |          |                    |                     |
      | 08/01/2024 | 07:15    | 19:35    | 03:20              | 03:20               |
      | 09/01/2024 | 07:15    | 19:15    | 03:00              | 03:00               |
      | 10/01/2024 | 07:15    | 20:00    | 03:45              | 03:45               |
      | 11/01/2024 | 07:15    | 17:50    | 01:45              | 01:45               |
      | 12/01/2024 |          |          |                    |                     |
      | 13/01/2024 |          |          |                    |                     |
      | 14/01/2024 | 07:15    | 20:00    |               |              |
      | 15/01/2024 |          |          |                    |                     |
      | 16/01/2024 |          |          |                    |                     |
      | 17/01/2024 |          |          |                    |                     |
      | 18/01/2024 |          |          |                    |                     |
      | 19/01/2024 |          |          |                    |                     |
      | 20/01/2024 |          |          |                    |                     |
      | 21/01/2024 |          |          |                    |                     |
      | 22/01/2024 |          |          |                    |                     |
      | 23/01/2024 |          |          |                    |                     |
      | 24/01/2024 |          |          |                    |                     |
      | 25/01/2024 |          |          |                    |                     |
      | 26/01/2024 |          |          |                    |                     |
      | 27/01/2024 |          |          |                    |                     |
      | 28/01/2024 |          |          |                    |                     |
      | 29/01/2024 |          |          |                    |                     |
      | 30/01/2024 |          |          |                    |                     |
      | 31/01/2024 |          |          | 19:35              |19:35                |
      
      
