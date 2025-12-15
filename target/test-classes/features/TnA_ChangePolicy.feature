@tag
Feature: Change Policy
  I want to use this template for my feature file

  @CP_1
  Scenario: Change Policy - Late-IN Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                    10 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChk1 | False            |           |                          | Saved Successfully |
      | ChngPlcChk2 | True             |        30 |                          | Saved Successfully |
      | ChngPlcChk3 | True             |        60 |                          | Saved Successfully |
      | ChngPlcChk4 | True             |        90 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of LateIn Policy "ChngPlcChk4"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc   | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   01042024 |     100000 |
      | ChngPlcChk |   01042024 |     130000 |
      | ChngPlcChk |   01042024 |     140000 |
      | ChngPlcChk |   01042024 |     190000 |
      | ChngPlcChk |   20042024 |     100000 |
      | ChngPlcChk |   20042024 |     130000 |
      | ChngPlcChk |   20042024 |     140000 |
      | ChngPlcChk |   20042024 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       |         |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       |         |        |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy  | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Late-IN | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       |         |            |
      | 20/04/2024 | 10:00    | 19:00    | AB       | PR       |         | AB:Late-IN |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy  | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Late-IN | 01/01/2009 | 30/04/2024 | ChngPlcChk3   | ChangeToPlc3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       | 00:50   |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       | 00:50   |        |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy  | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Late-IN | 01/04/2024 | 31/12/2099 | ChngPlcChk4   | ChangeToPlc4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   05042024 |     092500 |
      | ChngPlcChk |   05042024 |     130000 |
      | ChngPlcChk |   05042024 |     140000 |
      | ChngPlcChk |   05042024 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       | 01:00   |        |
      | 05/04/2024 | 09:25    | 19:00    | PR       | PR       | 00:15   |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       | 01:00   |        |

  @CP_2
  Scenario: Change Policy - Late-IN Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                    10 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name        | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChk1 | False            |           |                          | Saved Successfully |
      | ChngPlcChk2 | True             |        30 |                          | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc   | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |          0 |     093000 |
      | ChngPlcChk |          0 |     130000 |
      | ChngPlcChk |          0 |     140000 |
      | ChngPlcChk |          0 |     190000 |
      | ChngPlcChk |         -1 |     095000 |
      | ChngPlcChk |         -1 |     130000 |
      | ChngPlcChk |         -1 |     140000 |
      | ChngPlcChk |         -1 |     190000 |
      | ChngPlcChk |         -2 |     092500 |
      | ChngPlcChk |         -2 |     130000 |
      | ChngPlcChk |         -2 |     140000 |
      | ChngPlcChk |         -2 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -2 | 09:25    | 19:00    | PR       | PR       |         |        |
      |   -1 | 09:50    | 19:00    | PR       | PR       |         |        |
      |    0 | 09:30    | 19:00    | PR       | PR       |         |        |
    When Create user from user configuration
      | userid     | Active | LateInPlc   | Validation         |
      | ChngPlcChk | True   | ChngPlcChk2 | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -2 | 09:25    | 19:00    | PR       | PR       |         |        |
      |   -1 | 09:50    | 19:00    | PR       | PR       |         |        |
      |    0 | 09:30    | 19:00    | PR       | PR       | 00:20   |        |

  @CP_3
  Scenario: Change Policy - Early-OUT Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                      10 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChk1 | False              |             |                          | Saved Successfully |
      | ChngPlcChk2 | True               |          30 |                          | Saved Successfully |
      | ChngPlcChk3 | True               |          60 |                          | Saved Successfully |
      | ChngPlcChk4 | True               |          90 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "ChngPlcChk4"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   01042024 |     080000 |
      | ChngPlcChk |   01042024 |     130000 |
      | ChngPlcChk |   01042024 |     140000 |
      | ChngPlcChk |   01042024 |     170000 |
      | ChngPlcChk |   20042024 |     080000 |
      | ChngPlcChk |   20042024 |     130000 |
      | ChngPlcChk |   20042024 |     140000 |
      | ChngPlcChk |   20042024 |     170000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       |           |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       |           |        |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy    | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Early-OUT | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       |           |              |
      | 20/04/2024 | 08:00    | 17:00    | PR       | AB       |           | AB:Early-OUT |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy    | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Early-OUT | 01/01/2009 | 30/04/2024 | ChngPlcChk3   | ChangeToPlc3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       | 00:50     |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       | 00:50     |        |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy    | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Early-OUT | 01/04/2024 | 31/12/2099 | ChngPlcChk4   | ChangeToPlc4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   05042024 |     080000 |
      | ChngPlcChk |   05042024 |     130000 |
      | ChngPlcChk |   05042024 |     140000 |
      | ChngPlcChk |   05042024 |     173500 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       | 01:00     |        |
      | 05/04/2024 | 08:00    | 17:35    | PR       | PR       | 00:15     |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       | 01:00     |        |

  @CP_4
  Scenario: Change Policy - Early-OUT Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                      10 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name        | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChk1 | False              |             |                          | Saved Successfully |
      | ChngPlcChk2 | True               |          30 |                          | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |          0 |     080000 |
      | ChngPlcChk |          0 |     130000 |
      | ChngPlcChk |          0 |     140000 |
      | ChngPlcChk |          0 |     173000 |
      | ChngPlcChk |         -1 |     080000 |
      | ChngPlcChk |         -1 |     130000 |
      | ChngPlcChk |         -1 |     140000 |
      | ChngPlcChk |         -1 |     171000 |
      | ChngPlcChk |         -2 |     080000 |
      | ChngPlcChk |         -2 |     130000 |
      | ChngPlcChk |         -2 |     140000 |
      | ChngPlcChk |         -2 |     173500 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-2" and "1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -2 | 08:00    | 17:35    | PR       | PR       |           |        |
      |   -1 | 08:00    | 17:10    | PR       | PR       |           |        |
      |    0 | 08:00    | 17:30    | PR       | PR       |           |        |
    When Create user from user configuration
      | userid     | Active | EarlyOutPlc | Validation         |
      | ChngPlcChk | True   | ChngPlcChk2 | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-2" and "1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -2 | 08:00    | 17:35    | PR       | PR       |           |        |
      |   -1 | 08:00    | 17:10    | PR       | PR       |           |        |
      |    0 | 08:00    | 17:30    | PR       | PR       | 00:20     |        |

  @CP_5
  Scenario: Change Policy - Overtime Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete Overtime Policy from TnA module
      | Name        |
      | ChngPlcChk1 |
      | ChngPlcChk2 |
      | ChngPlcChk3 |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChk1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChk2 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChk3 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk3"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChk | True   | True      |                        4 | Both              | ChngPlcChk1 | True      | ZG            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   01042024 |     080000 |
      | ChngPlcChk |   01042024 |     130000 |
      | ChngPlcChk |   01042024 |     140000 |
      | ChngPlcChk |   01042024 |     200000 |
      | ChngPlcChk |   20042024 |     080000 |
      | ChngPlcChk |   20042024 |     130000 |
      | ChngPlcChk |   20042024 |     140000 |
      | ChngPlcChk |   20042024 |     200000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy   | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Overtime | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 03:00              | 03:00               |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy   | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Overtime | 01/01/2009 | 30/04/2024 | ChngPlcChk3   | ChangeToPlc3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   05042024 |     080000 |
      | ChngPlcChk |   05042024 |     130000 |
      | ChngPlcChk |   05042024 |     140000 |
      | ChngPlcChk |   05042024 |     210000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 02:00              | 02:00               |
      | 05/04/2024 | 08:00    | 21:00    | 03:00              | 03:00               |
      | 20/04/2024 | 08:00    | 20:00    | 02:00              | 02:00               |

  @CP_6
  Scenario: Change Policy - Overtime Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete Overtime Policy from TnA module
      | Name        |
      | ChngPlcChk1 |
      | ChngPlcChk2 |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "ChngPlcChk2"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChk1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChk2 | ChngPlcChk2       | True      | All     | Daily 2    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "ChngPlcChk2"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
    And Create user from user configuration
      | userid     | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChk | True   | True      |                        4 | Both              | ChngPlcChk1 | True      | ZG            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |          0 |     070000 |
      | ChngPlcChk |          0 |     130000 |
      | ChngPlcChk |          0 |     140000 |
      | ChngPlcChk |          0 |     190000 |
      | ChngPlcChk |         -1 |     080000 |
      | ChngPlcChk |         -1 |     130000 |
      | ChngPlcChk |         -1 |     140000 |
      | ChngPlcChk |         -1 |     200000 |
      | ChngPlcChk |         -2 |     070000 |
      | ChngPlcChk |         -2 |     130000 |
      | ChngPlcChk |         -2 |     140000 |
      | ChngPlcChk |         -2 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 19:00    | 02:00              | 02:00               |
      |   -1 | 08:00    | 20:00    | 01:00              | 01:00               |
      |    0 | 07:00    | 19:00    | 02:00              | 02:00               |
    When Create user from user configuration
      | userid     | Active | OvertimePlc | Validation         |
      | ChngPlcChk | True   | ChngPlcChk2 | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 19:00    | 02:00              | 02:00               |
      |   -1 | 08:00    | 20:00    | 01:00              | 01:00               |
      |    0 | 07:00    | 19:00    | 11:00              | 11:00               |

  @CP_7
  Scenario: Change Policy - Overtime Policy - Auto Authorization check 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete Overtime Policy from TnA module
      | Name        |
      | ChngPlcChk1 |
      | ChngPlcChk2 |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChk1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChk2 | OverTime Policy-1 | True      | All     | Daily 1    | False           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChk | True   | True      |                        4 | Both              | ChngPlcChk1 | True      | ZG            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   01042024 |     080000 |
      | ChngPlcChk |   01042024 |     130000 |
      | ChngPlcChk |   01042024 |     140000 |
      | ChngPlcChk |   01042024 |     200000 |
      | ChngPlcChk |   20042024 |     080000 |
      | ChngPlcChk |   20042024 |     130000 |
      | ChngPlcChk |   20042024 |     140000 |
      | ChngPlcChk |   20042024 |     200000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy   | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Overtime | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              |                     |

  @CP_8
  Scenario: Change Policy - Overtime Policy - Auto Authorization check 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete Overtime Policy from TnA module
      | Name        |
      | ChngPlcChk1 |
      | ChngPlcChk2 |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChk1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChk2 | OverTime Policy-1 | True      | All     | Daily 1    | False           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChk | True   | True      |                        4 | Both              | ChngPlcChk1 | True      | ZG            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   01042024 |     080000 |
      | ChngPlcChk |   01042024 |     130000 |
      | ChngPlcChk |   01042024 |     140000 |
      | ChngPlcChk |   01042024 |     200000 |
      | ChngPlcChk |   20042024 |     080000 |
      | ChngPlcChk |   20042024 |     130000 |
      | ChngPlcChk |   20042024 |     140000 |
      | ChngPlcChk |   20042024 |     200000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy   | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Overtime | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 03:00              |                     |

  @CP_9
  Scenario: Change Policy - C-OFF Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete Overtime Policy from TnA module
      | Name        |
      | ChngPlcChk1 |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChk1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName     | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | ChngPlcChk1 | 01:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
      | ChngPlcChk2 | 02:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc     | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Only C-OFF        | ChngPlcChk1 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |   01042024 |     080000 |
      | ChngPlcChk |   01042024 |     130000 |
      | ChngPlcChk |   01042024 |     140000 |
      | ChngPlcChk |   01042024 |     193000 |
      | ChngPlcChk |   20042024 |     080000 |
      | ChngPlcChk |   20042024 |     130000 |
      | ChngPlcChk |   20042024 |     140000 |
      | ChngPlcChk |   20042024 |     183000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 19:30    | 02:30              |                     |
      | 20/04/2024 | 08:00    | 18:30    | 01:30              |                     |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "01/04/2024"
      | Component | Processed | Authorized |
      | C-OFF     |           | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "20/04/2024"
      | Component | Processed | Authorized |
      | C-OFF     |           | 01:30      |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | C-OFF  | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 19:30    | 02:30              |                     |
      | 20/04/2024 | 08:00    | 18:30    | 01:30              |                     |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "01/04/2024"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "20/04/2024"
      | Component | Authorized |
      | C-OFF     | -          |

  @CP_10
  Scenario: Change Policy - C-OFF Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete Overtime Policy from TnA module
      | Name        |
      | ChngPlcChk1 |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChk1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChk1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName     | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | ChngPlcChk1 | 01:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
      | ChngPlcChk2 | 02:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | CoffPlc     | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Only C-OFF        | ChngPlcChk1 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | ChngPlcChk |         -1 |     080000 |
      | ChngPlcChk |         -1 |     130000 |
      | ChngPlcChk |         -1 |     140000 |
      | ChngPlcChk |         -1 |     193000 |
      | ChngPlcChk |          0 |     080000 |
      | ChngPlcChk |          0 |     130000 |
      | ChngPlcChk |          0 |     140000 |
      | ChngPlcChk |          0 |     183000 |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 19:30    | 02:30              |                     |
      |    0 | 08:00    | 18:30    | 01:30              |                     |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "-1"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "0"
      | Component | Authorized |
      | C-OFF     | 01:30      |
    When Create user from user configuration
      | userid     | Active | CoffPlc     | Validation         |
      | ChngPlcChk | True   | ChngPlcChk2 | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 19:30    | 02:30              |                     |
      |    0 | 08:00    | 18:30    | 01:30              |                     |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "-1"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChk" and AtdDate= "0"
      | Component | Authorized |
      | C-OFF     | -          |

  @CP_11
  Scenario: Change Policy - Absentee Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Absentee Policy
      | PlcName     | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | ChngPlcChk1 | True             | False            | false                     | false             | false             | false                      | Saved Successfully |
      | ChngPlcChk2 | False            | False            | false                     | false             | false             | false                      | Saved Successfully |
      | ChngPlcChk3 | True             | True             | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AbsenteePlc | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    And Change Shift via API
      | userid     | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ChngPlcChk | 02/04/2024 | 02/04/2024 |          |        1 |                |
      | ChngPlcChk | 16/04/2024 | 16/04/2024 |          |        1 |                |
    And Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs    |
      | 15/04/2024 | 15/04/2024 | Full Day Present    | ByAutomation | User Wise   | ChngPlcChk |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark                  |
      | 01/04/2024 | AB       | AB       | No Punches Available    |
      | 02/04/2024 | AB       | AB       | WO-AB:Absent Cover Rule |
      | 03/04/2024 | AB       | AB       | No Punches Available    |
      | 15/04/2024 | PR       | PR       |                         |
      | 16/04/2024 | WO       | WO       |                         |
      | 17/04/2024 | AB       | AB       | No Punches Available    |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy   | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Absentee | 15/04/2024 | 30/04/2024 | ChngPlcChk2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark                  |
      | 01/04/2024 | AB       | AB       | No Punches Available    |
      | 02/04/2024 | AB       | AB       | WO-AB:Absent Cover Rule |
      | 03/04/2024 | AB       | AB       | No Punches Available    |
      | 15/04/2024 | PR       | PR       |                         |
      | 16/04/2024 | AB       | AB       | WO-AB:Absent Club Rule  |
      | 17/04/2024 | AB       | AB       | No Punches Available    |
    When Change Policy from time attendance module for "Single" user
      | UserId     | Policy   | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChk | Absentee | 01/04/2024 | 31/12/2099 | ChngPlcChk3   | ChangeToPlc3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark               |
      | 01/04/2024 | AB       | AB       | No Punches Available |
      | 02/04/2024 | WO       | WO       |                      |
      | 03/04/2024 | AB       | AB       | No Punches Available |
      | 15/04/2024 | PR       | PR       |                      |
      | 16/04/2024 | WO       | WO       |                      |
      | 17/04/2024 | AB       | AB       | No Punches Available |

  @CP_12
  Scenario: Change Policy - Absentee Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | ChngPlcChk |
    And Delete "ZG" shift schedule
    And Delete "ZG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZG"
      | OffDay1 |
      | None    |
    And Create Absentee Policy
      | PlcName     | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | ChngPlcChk1 | True             | False            | false                     | false             | false             | false                      | Saved Successfully |
      | ChngPlcChk2 | False            | False            | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AbsenteePlc | ShiftSchedule | Validation         |
      | ChngPlcChk | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChk1 | ZG            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Change Shift via API
      | userid     | FromDt | ToDt | shift-id | week-off | public-holiday |
      | ChngPlcChk |      0 |    0 |          |        1 |                |
    And Manual Status correction done from TnA module
      | FromDt | ToDt | ManualStatusMarking | Remark       | SelectUsers | UserIDs    |
      |     -1 |   -1 | Full Day Present    | ByAutomation | User Wise   | ChngPlcChk |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-1" and "0"
      | Date | 1st Half | 2nd Half | Remark |
      |   -1 | PR       | PR       |        |
      |    0 | WO       | WO       |        |
    When Create user from user configuration
      | userid     | AbsenteePlc | Validation         |
      | ChngPlcChk | ChngPlcChk2 | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | ChngPlcChk |
    Then Daily Attendance View for userid "ChngPlcChk" and period "Date" on "-1" and "0"
      | Date | 1st Half | 2nd Half | Remark                 |
      |   -1 | PR       | PR       |                        |
      |    0 | AB       | AB       | WO-AB:Absent Club Rule |

  @CP_13
  Scenario: Change Policy - Multiple User - Late-IN Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                    10 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChkM1 | False            |           |                          | Saved Successfully |
      | ChngPlcChkM2 | True             |        30 |                          | Saved Successfully |
      | ChngPlcChkM3 | True             |        60 |                          | Saved Successfully |
      | ChngPlcChkM4 | True             |        90 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of LateIn Policy "ChngPlcChkM4"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc    | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   01042024 |     100000 |
      | ChngPlcChkM1 |   01042024 |     130000 |
      | ChngPlcChkM1 |   01042024 |     140000 |
      | ChngPlcChkM1 |   01042024 |     190000 |
      | ChngPlcChkM1 |   20042024 |     100000 |
      | ChngPlcChkM1 |   20042024 |     130000 |
      | ChngPlcChkM1 |   20042024 |     140000 |
      | ChngPlcChkM1 |   20042024 |     190000 |
      | ChngPlcChkM2 |   01042024 |     100000 |
      | ChngPlcChkM2 |   01042024 |     130000 |
      | ChngPlcChkM2 |   01042024 |     140000 |
      | ChngPlcChkM2 |   01042024 |     190000 |
      | ChngPlcChkM2 |   20042024 |     100000 |
      | ChngPlcChkM2 |   20042024 |     130000 |
      | ChngPlcChkM2 |   20042024 |     140000 |
      | ChngPlcChkM2 |   20042024 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       |         |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       |         |        |
    And Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       |         |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       |         |        |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy  | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChkM1,ChngPlcChkM2 | Late-IN | 15/04/2024 | 30/04/2024 | ChngPlcChkM2   | ChangeToPlc2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       |         |            |
      | 20/04/2024 | 10:00    | 19:00    | AB       | PR       |         | AB:Late-IN |
    And Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark     |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       |         |            |
      | 20/04/2024 | 10:00    | 19:00    | AB       | PR       |         | AB:Late-IN |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy  | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChkM1,ChngPlcChkM2 | Late-IN | 01/01/2009 | 30/04/2024 | ChngPlcChkM3   | ChangeToPlc3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       | 00:50   |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       | 00:50   |        |
    And Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       | 00:50   |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       | 00:50   |        |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy  | StartDate  | EndDate    | NewPolicyName | Remark       |
      | ChngPlcChkM1,ChngPlcChkM2 | Late-IN | 01/04/2024 | 31/12/2099 | ChngPlcChkM4   | ChangeToPlc4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   05042024 |     092500 |
      | ChngPlcChkM1 |   05042024 |     130000 |
      | ChngPlcChkM1 |   05042024 |     140000 |
      | ChngPlcChkM1 |   05042024 |     190000 |
      | ChngPlcChkM2 |   05042024 |     092500 |
      | ChngPlcChkM2 |   05042024 |     130000 |
      | ChngPlcChkM2 |   05042024 |     140000 |
      | ChngPlcChkM2 |   05042024 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       | 01:00   |        |
      | 05/04/2024 | 09:25    | 19:00    | PR       | PR       | 00:15   |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       | 01:00   |        |
    And Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 01/04/2024 | 10:00    | 19:00    | PR       | PR       | 01:00   |        |
      | 05/04/2024 | 09:25    | 19:00    | PR       | PR       | 00:15   |        |
      | 20/04/2024 | 10:00    | 19:00    | PR       | PR       | 01:00   |        |

  @CP_14
  Scenario: Change Policy - Multiple User - Multiple User - Late-IN Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                    10 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChkM1 | False            |           |                          | Saved Successfully |
      | ChngPlcChkM2 | True             |        30 |                          | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc    | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |          0 |     093000 |
      | ChngPlcChkM1 |          0 |     130000 |
      | ChngPlcChkM1 |          0 |     140000 |
      | ChngPlcChkM1 |          0 |     190000 |
      | ChngPlcChkM1 |         -1 |     095000 |
      | ChngPlcChkM1 |         -1 |     130000 |
      | ChngPlcChkM1 |         -1 |     140000 |
      | ChngPlcChkM1 |         -1 |     190000 |
      | ChngPlcChkM1 |         -2 |     092500 |
      | ChngPlcChkM1 |         -2 |     130000 |
      | ChngPlcChkM1 |         -2 |     140000 |
      | ChngPlcChkM1 |         -2 |     190000 |
      | ChngPlcChkM2 |          0 |     093000 |
      | ChngPlcChkM2 |          0 |     130000 |
      | ChngPlcChkM2 |          0 |     140000 |
      | ChngPlcChkM2 |          0 |     190000 |
      | ChngPlcChkM2 |         -1 |     095000 |
      | ChngPlcChkM2 |         -1 |     130000 |
      | ChngPlcChkM2 |         -1 |     140000 |
      | ChngPlcChkM2 |         -1 |     190000 |
      | ChngPlcChkM2 |         -2 |     092500 |
      | ChngPlcChkM2 |         -2 |     130000 |
      | ChngPlcChkM2 |         -2 |     140000 |
      | ChngPlcChkM2 |         -2 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -2 | 09:25    | 19:00    | PR       | PR       |         |        |
      |   -1 | 09:50    | 19:00    | PR       | PR       |         |        |
      |    0 | 09:30    | 19:00    | PR       | PR       |         |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -2 | 09:25    | 19:00    | PR       | PR       |         |        |
      |   -1 | 09:50    | 19:00    | PR       | PR       |         |        |
      |    0 | 09:30    | 19:00    | PR       | PR       |         |        |
    When Update users from multiuser Configuration page
      | UserID                    | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc    | EarlyOutPlc | CoffPlc |
      | ChngPlcChkM1,ChngPlcChkM2 |               |             |             | ChngPlcChkM2 |             |         |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -2 | 09:25    | 19:00    | PR       | PR       |         |        |
      |   -1 | 09:50    | 19:00    | PR       | PR       |         |        |
      |    0 | 09:30    | 19:00    | PR       | PR       | 00:20   |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      |   -2 | 09:25    | 19:00    | PR       | PR       |         |        |
      |   -1 | 09:50    | 19:00    | PR       | PR       |         |        |
      |    0 | 09:30    | 19:00    | PR       | PR       | 00:20   |        |

  @CP_15
  Scenario: Change Policy - Multiple User - Early-OUT Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                      10 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChkM1 | False              |             |                          | Saved Successfully |
      | ChngPlcChkM2 | True               |          30 |                          | Saved Successfully |
      | ChngPlcChkM3 | True               |          60 |                          | Saved Successfully |
      | ChngPlcChkM4 | True               |          90 | True                     | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "ChngPlcChkM4"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      30 | Actual          |              |
      |        31 |      59 | Fixed           |           60 |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc  | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   01042024 |     080000 |
      | ChngPlcChkM1 |   01042024 |     130000 |
      | ChngPlcChkM1 |   01042024 |     140000 |
      | ChngPlcChkM1 |   01042024 |     170000 |
      | ChngPlcChkM1 |   20042024 |     080000 |
      | ChngPlcChkM1 |   20042024 |     130000 |
      | ChngPlcChkM1 |   20042024 |     140000 |
      | ChngPlcChkM1 |   20042024 |     170000 |
      | ChngPlcChkM2 |   01042024 |     080000 |
      | ChngPlcChkM2 |   01042024 |     130000 |
      | ChngPlcChkM2 |   01042024 |     140000 |
      | ChngPlcChkM2 |   01042024 |     170000 |
      | ChngPlcChkM2 |   20042024 |     080000 |
      | ChngPlcChkM2 |   20042024 |     130000 |
      | ChngPlcChkM2 |   20042024 |     140000 |
      | ChngPlcChkM2 |   20042024 |     170000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       |           |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       |           |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       |           |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       |           |        |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy    | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Early-OUT | 15/04/2024 | 30/04/2024 | ChngPlcChkM2  | ChangeToPlcM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       |           |              |
      | 20/04/2024 | 08:00    | 17:00    | PR       | AB       |           | AB:Early-OUT |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark       |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       |           |              |
      | 20/04/2024 | 08:00    | 17:00    | PR       | AB       |           | AB:Early-OUT |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy    | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Early-OUT | 01/01/2009 | 30/04/2024 | ChngPlcChkM3  | ChangeToPlcM3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       | 00:50     |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       | 00:50     |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       | 00:50     |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       | 00:50     |        |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy    | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Early-OUT | 01/04/2024 | 31/12/2099 | ChngPlcChkM4  | ChangeToPlcM4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   05042024 |     080000 |
      | ChngPlcChkM1 |   05042024 |     130000 |
      | ChngPlcChkM1 |   05042024 |     140000 |
      | ChngPlcChkM1 |   05042024 |     173500 |
      | ChngPlcChkM2 |   05042024 |     080000 |
      | ChngPlcChkM2 |   05042024 |     130000 |
      | ChngPlcChkM2 |   05042024 |     140000 |
      | ChngPlcChkM2 |   05042024 |     173500 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       | 01:00     |        |
      | 05/04/2024 | 08:00    | 17:35    | PR       | PR       | 00:15     |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       | 01:00     |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      | 01/04/2024 | 08:00    | 17:00    | PR       | PR       | 01:00     |        |
      | 05/04/2024 | 08:00    | 17:35    | PR       | PR       | 00:15     |        |
      | 20/04/2024 | 08:00    | 17:00    | PR       | PR       | 01:00     |        |

  @CP_16
  Scenario: Change Policy - Multiple User - Early-OUT Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                      10 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | ChngPlcChkM1 | False              |             |                          | Saved Successfully |
      | ChngPlcChkM2 | True               |          30 |                          | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc  | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |          0 |     080000 |
      | ChngPlcChkM1 |          0 |     130000 |
      | ChngPlcChkM1 |          0 |     140000 |
      | ChngPlcChkM1 |          0 |     173000 |
      | ChngPlcChkM1 |         -1 |     080000 |
      | ChngPlcChkM1 |         -1 |     130000 |
      | ChngPlcChkM1 |         -1 |     140000 |
      | ChngPlcChkM1 |         -1 |     171000 |
      | ChngPlcChkM1 |         -2 |     080000 |
      | ChngPlcChkM1 |         -2 |     130000 |
      | ChngPlcChkM1 |         -2 |     140000 |
      | ChngPlcChkM1 |         -2 |     173500 |
      | ChngPlcChkM2 |          0 |     080000 |
      | ChngPlcChkM2 |          0 |     130000 |
      | ChngPlcChkM2 |          0 |     140000 |
      | ChngPlcChkM2 |          0 |     173000 |
      | ChngPlcChkM2 |         -1 |     080000 |
      | ChngPlcChkM2 |         -1 |     130000 |
      | ChngPlcChkM2 |         -1 |     140000 |
      | ChngPlcChkM2 |         -1 |     171000 |
      | ChngPlcChkM2 |         -2 |     080000 |
      | ChngPlcChkM2 |         -2 |     130000 |
      | ChngPlcChkM2 |         -2 |     140000 |
      | ChngPlcChkM2 |         -2 |     173500 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-2" and "1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -2 | 08:00    | 17:35    | PR       | PR       |           |        |
      |   -1 | 08:00    | 17:10    | PR       | PR       |           |        |
      |    0 | 08:00    | 17:30    | PR       | PR       |           |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-2" and "1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -2 | 08:00    | 17:35    | PR       | PR       |           |        |
      |   -1 | 08:00    | 17:10    | PR       | PR       |           |        |
      |    0 | 08:00    | 17:30    | PR       | PR       |           |        |
    When Update users from multiuser Configuration page
      | UserID                    | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc  | CoffPlc |
      | ChngPlcChkM1,ChngPlcChkM2 |               |             |             |           | ChngPlcChkM2 |         |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-2" and "1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -2 | 08:00    | 17:35    | PR       | PR       |           |        |
      |   -1 | 08:00    | 17:10    | PR       | PR       |           |        |
      |    0 | 08:00    | 17:30    | PR       | PR       | 00:20     |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-2" and "1"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Early-OUT | Remark |
      |   -2 | 08:00    | 17:35    | PR       | PR       |           |        |
      |   -1 | 08:00    | 17:10    | PR       | PR       |           |        |
      |    0 | 08:00    | 17:30    | PR       | PR       | 00:20     |        |

  @CP_17
  Scenario: Change Policy - Multiple User - Overtime Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete Overtime Policy from TnA module
      | Name         |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
      | ChngPlcChkM3 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChkM1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChkM2 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChkM3 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM3"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChkM1 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
      | ChngPlcChkM2 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   01042024 |     080000 |
      | ChngPlcChkM1 |   01042024 |     130000 |
      | ChngPlcChkM1 |   01042024 |     140000 |
      | ChngPlcChkM1 |   01042024 |     200000 |
      | ChngPlcChkM1 |   20042024 |     080000 |
      | ChngPlcChkM1 |   20042024 |     130000 |
      | ChngPlcChkM1 |   20042024 |     140000 |
      | ChngPlcChkM1 |   20042024 |     200000 |
      | ChngPlcChkM2 |   01042024 |     080000 |
      | ChngPlcChkM2 |   01042024 |     130000 |
      | ChngPlcChkM2 |   01042024 |     140000 |
      | ChngPlcChkM2 |   01042024 |     200000 |
      | ChngPlcChkM2 |   20042024 |     080000 |
      | ChngPlcChkM2 |   20042024 |     130000 |
      | ChngPlcChkM2 |   20042024 |     140000 |
      | ChngPlcChkM2 |   20042024 |     200000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy   | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Overtime | 15/04/2024 | 30/04/2024 | ChngPlcChkM2  | ChangeToPlcM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 03:00              | 03:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 03:00              | 03:00               |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy   | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Overtime | 01/01/2009 | 30/04/2024 | ChngPlcChkM3  | ChangeToPlcM3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   05042024 |     080000 |
      | ChngPlcChkM1 |   05042024 |     130000 |
      | ChngPlcChkM1 |   05042024 |     140000 |
      | ChngPlcChkM1 |   05042024 |     210000 |
      | ChngPlcChkM2 |   05042024 |     080000 |
      | ChngPlcChkM2 |   05042024 |     130000 |
      | ChngPlcChkM2 |   05042024 |     140000 |
      | ChngPlcChkM2 |   05042024 |     210000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 02:00              | 02:00               |
      | 05/04/2024 | 08:00    | 21:00    | 03:00              | 03:00               |
      | 20/04/2024 | 08:00    | 20:00    | 02:00              | 02:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 02:00              | 02:00               |
      | 05/04/2024 | 08:00    | 21:00    | 03:00              | 03:00               |
      | 20/04/2024 | 08:00    | 20:00    | 02:00              | 02:00               |

  @CP_18
  Scenario: Change Policy - Multiple User - Overtime Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete Overtime Policy from TnA module
      | Name         |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "ChngPlcChkM2"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChkM1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChkM2 | ChngPlcChkM2      | True      | All     | Daily 2    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "ChngPlcChkM2"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays |
      |          00000 |        02300 |     00000 | OT1        |   1.00 | Priority Work Component | Check All      |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChkM1 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
      | ChngPlcChkM2 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |          0 |     070000 |
      | ChngPlcChkM1 |          0 |     130000 |
      | ChngPlcChkM1 |          0 |     140000 |
      | ChngPlcChkM1 |          0 |     190000 |
      | ChngPlcChkM1 |         -1 |     080000 |
      | ChngPlcChkM1 |         -1 |     130000 |
      | ChngPlcChkM1 |         -1 |     140000 |
      | ChngPlcChkM1 |         -1 |     200000 |
      | ChngPlcChkM1 |         -2 |     070000 |
      | ChngPlcChkM1 |         -2 |     130000 |
      | ChngPlcChkM1 |         -2 |     140000 |
      | ChngPlcChkM1 |         -2 |     190000 |
      | ChngPlcChkM2 |          0 |     070000 |
      | ChngPlcChkM2 |          0 |     130000 |
      | ChngPlcChkM2 |          0 |     140000 |
      | ChngPlcChkM2 |          0 |     190000 |
      | ChngPlcChkM2 |         -1 |     080000 |
      | ChngPlcChkM2 |         -1 |     130000 |
      | ChngPlcChkM2 |         -1 |     140000 |
      | ChngPlcChkM2 |         -1 |     200000 |
      | ChngPlcChkM2 |         -2 |     070000 |
      | ChngPlcChkM2 |         -2 |     130000 |
      | ChngPlcChkM2 |         -2 |     140000 |
      | ChngPlcChkM2 |         -2 |     190000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 19:00    | 02:00              | 02:00               |
      |   -1 | 08:00    | 20:00    | 01:00              | 01:00               |
      |    0 | 07:00    | 19:00    | 02:00              | 02:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 19:00    | 02:00              | 02:00               |
      |   -1 | 08:00    | 20:00    | 01:00              | 01:00               |
      |    0 | 07:00    | 19:00    | 02:00              | 02:00               |
    When Update users from multiuser Configuration page
      | UserID                    | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc |
      | ChngPlcChkM1,ChngPlcChkM2 |               |             | ChngPlcChkM2 |           |             |         |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 19:00    | 02:00              | 02:00               |
      |   -1 | 08:00    | 20:00    | 01:00              | 01:00               |
      |    0 | 07:00    | 19:00    | 11:00              | 11:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 19:00    | 02:00              | 02:00               |
      |   -1 | 08:00    | 20:00    | 01:00              | 01:00               |
      |    0 | 07:00    | 19:00    | 11:00              | 11:00               |

  @CP_19
  Scenario: Change Policy - Multiple User - Overtime Policy - Auto Authorization check 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete Overtime Policy from TnA module
      | Name         |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChkM1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChkM2 | OverTime Policy-1 | True      | All     | Daily 1    | False           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChkM1 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
      | ChngPlcChkM2 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   01042024 |     080000 |
      | ChngPlcChkM1 |   01042024 |     130000 |
      | ChngPlcChkM1 |   01042024 |     140000 |
      | ChngPlcChkM1 |   01042024 |     200000 |
      | ChngPlcChkM1 |   20042024 |     080000 |
      | ChngPlcChkM1 |   20042024 |     130000 |
      | ChngPlcChkM1 |   20042024 |     140000 |
      | ChngPlcChkM1 |   20042024 |     200000 |
      | ChngPlcChkM2 |   01042024 |     080000 |
      | ChngPlcChkM2 |   01042024 |     130000 |
      | ChngPlcChkM2 |   01042024 |     140000 |
      | ChngPlcChkM2 |   01042024 |     200000 |
      | ChngPlcChkM2 |   20042024 |     080000 |
      | ChngPlcChkM2 |   20042024 |     130000 |
      | ChngPlcChkM2 |   20042024 |     140000 |
      | ChngPlcChkM2 |   20042024 |     200000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy   | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Overtime | 15/04/2024 | 30/04/2024 | ChngPlcChkM2  | ChangeToPlcM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              |                     |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              |                     |

  @CP_20
  Scenario: Change Policy - Multiple User - Overtime Policy - Auto Authorization check 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete Overtime Policy from TnA module
      | Name         |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              |                       0 | False                | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChkM1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
      | ChngPlcChkM2 | OverTime Policy-1 | True      | All     | Daily 1    | False           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | ChngPlcChkM1 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
      | ChngPlcChkM2 | True   | True      |                        4 | Both              | ChngPlcChkM1 | True      | ZH            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   01042024 |     080000 |
      | ChngPlcChkM1 |   01042024 |     130000 |
      | ChngPlcChkM1 |   01042024 |     140000 |
      | ChngPlcChkM1 |   01042024 |     200000 |
      | ChngPlcChkM1 |   20042024 |     080000 |
      | ChngPlcChkM1 |   20042024 |     130000 |
      | ChngPlcChkM1 |   20042024 |     140000 |
      | ChngPlcChkM1 |   20042024 |     200000 |
      | ChngPlcChkM2 |   01042024 |     080000 |
      | ChngPlcChkM2 |   01042024 |     130000 |
      | ChngPlcChkM2 |   01042024 |     140000 |
      | ChngPlcChkM2 |   01042024 |     200000 |
      | ChngPlcChkM2 |   20042024 |     080000 |
      | ChngPlcChkM2 |   20042024 |     130000 |
      | ChngPlcChkM2 |   20042024 |     140000 |
      | ChngPlcChkM2 |   20042024 |     200000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy   | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Overtime | 15/04/2024 | 30/04/2024 | ChngPlcChkM2  | ChangeToPlcM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 03:00              |                     |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 20:00    | 01:00              | 01:00               |
      | 20/04/2024 | 08:00    | 20:00    | 03:00              |                     |

  @CP_21
  Scenario: Change Policy - Multiple User - C-OFF Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete Overtime Policy from TnA module
      | Name         |
      | ChngPlcChkM1 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChkM1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | ChngPlcChkM1 | 01:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
      | ChngPlcChkM2 | 02:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | CoffPlc      | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | Only C-OFF        | ChngPlcChkM1 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | Only C-OFF        | ChngPlcChkM1 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |   01042024 |     080000 |
      | ChngPlcChkM1 |   01042024 |     130000 |
      | ChngPlcChkM1 |   01042024 |     140000 |
      | ChngPlcChkM1 |   01042024 |     193000 |
      | ChngPlcChkM1 |   20042024 |     080000 |
      | ChngPlcChkM1 |   20042024 |     130000 |
      | ChngPlcChkM1 |   20042024 |     140000 |
      | ChngPlcChkM1 |   20042024 |     183000 |
      | ChngPlcChkM2 |   01042024 |     080000 |
      | ChngPlcChkM2 |   01042024 |     130000 |
      | ChngPlcChkM2 |   01042024 |     140000 |
      | ChngPlcChkM2 |   01042024 |     193000 |
      | ChngPlcChkM2 |   20042024 |     080000 |
      | ChngPlcChkM2 |   20042024 |     130000 |
      | ChngPlcChkM2 |   20042024 |     140000 |
      | ChngPlcChkM2 |   20042024 |     183000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 19:30    | 02:30              |                     |
      | 20/04/2024 | 08:00    | 18:30    | 01:30              |                     |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 19:30    | 02:30              |                     |
      | 20/04/2024 | 08:00    | 18:30    | 01:30              |                     |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "01/04/2024"
      | Component | Processed | Authorized |
      | C-OFF     |           | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "20/04/2024"
      | Component | Processed | Authorized |
      | C-OFF     |           | 01:30      |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "01/04/2024"
      | Component | Processed | Authorized |
      | C-OFF     |           | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "20/04/2024"
      | Component | Processed | Authorized |
      | C-OFF     |           | 01:30      |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | C-OFF  | 15/04/2024 | 30/04/2024 | ChngPlcChkM2  | ChangeToPlcM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 19:30    | 02:30              |                     |
      | 20/04/2024 | 08:00    | 18:30    | 01:30              |                     |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      | 01/04/2024 | 08:00    | 19:30    | 02:30              |                     |
      | 20/04/2024 | 08:00    | 18:30    | 01:30              |                     |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "01/04/2024"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "20/04/2024"
      | Component | Authorized |
      | C-OFF     | -          |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "01/04/2024"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "20/04/2024"
      | Component | Authorized |
      | C-OFF     | -          |

  @CP_22
  Scenario: Change Policy - Multiple User - C-OFF Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete Overtime Policy from TnA module
      | Name         |
      | ChngPlcChkM1 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | ChngPlcChkM1 | OverTime Policy-1 | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "ChngPlcChkM1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName     | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | ChngPlcChk1 | 01:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
      | ChngPlcChk2 | 02:00           | 00:01            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc  | CoffPlc      | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | Only C-OFF        | ChngPlcChkM1 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | Only C-OFF        | ChngPlcChkM1 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    When Set event via Event Set API
      | Userid       | event-date | event-time |
      | ChngPlcChkM1 |         -1 |     080000 |
      | ChngPlcChkM1 |         -1 |     130000 |
      | ChngPlcChkM1 |         -1 |     140000 |
      | ChngPlcChkM1 |         -1 |     193000 |
      | ChngPlcChkM1 |          0 |     080000 |
      | ChngPlcChkM1 |          0 |     130000 |
      | ChngPlcChkM1 |          0 |     140000 |
      | ChngPlcChkM1 |          0 |     183000 |
      | ChngPlcChkM2 |         -1 |     080000 |
      | ChngPlcChkM2 |         -1 |     130000 |
      | ChngPlcChkM2 |         -1 |     140000 |
      | ChngPlcChkM2 |         -1 |     193000 |
      | ChngPlcChkM2 |          0 |     080000 |
      | ChngPlcChkM2 |          0 |     130000 |
      | ChngPlcChkM2 |          0 |     140000 |
      | ChngPlcChkM2 |          0 |     183000 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 19:30    | 02:30              |                     |
      |    0 | 08:00    | 18:30    | 01:30              |                     |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 19:30    | 02:30              |                     |
      |    0 | 08:00    | 18:30    | 01:30              |                     |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "-1"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "0"
      | Component | Authorized |
      | C-OFF     | 01:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "-1"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "0"
      | Component | Authorized |
      | C-OFF     | 01:30      |
    And Update users from multiuser Configuration page
      | UserID                    | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc      |
      | ChngPlcChkM1,ChngPlcChkM2 |               |             |             |           |             | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 19:30    | 02:30              |                     |
      |    0 | 08:00    | 18:30    | 01:30              |                     |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 19:30    | 02:30              |                     |
      |    0 | 08:00    | 18:30    | 01:30              |                     |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "-1"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM1" and AtdDate= "0"
      | Component | Authorized |
      | C-OFF     | -          |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "-1"
      | Component | Authorized |
      | C-OFF     | 02:30      |
    And Verify Manual Overtime/C-OFF Entry for UserID= "ChngPlcChkM2" and AtdDate= "0"
      | Component | Authorized |
      | C-OFF     | -          |

  @CP_23
  Scenario: Change Policy - Multiple User - Absentee Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | ChngPlcChkM1 | True             | False            | false                     | false             | false             | false                      | Saved Successfully |
      | ChngPlcChkM2 | False            | False            | false                     | false             | false             | false                      | Saved Successfully |
      | ChngPlcChkM3 | True             | True             | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AbsenteePlc  | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ChngPlcChkM1 | 02/04/2024 | 02/04/2024 |          |        1 |                |
      | ChngPlcChkM1 | 16/04/2024 | 16/04/2024 |          |        1 |                |
      | ChngPlcChkM2 | 02/04/2024 | 02/04/2024 |          |        1 |                |
      | ChngPlcChkM2 | 16/04/2024 | 16/04/2024 |          |        1 |                |
    And Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs                   |
      | 15/04/2024 | 15/04/2024 | Full Day Present    | ByAutomation | User Wise   | ChngPlcChkM1,ChngPlcChkM2 |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ChngPlcChkM1 | Process Completed |
      | ChngPlcChkM2 | Process Completed |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark                  |
      | 01/04/2024 | AB       | AB       | No Punches Available    |
      | 02/04/2024 | AB       | AB       | WO-AB:Absent Cover Rule |
      | 03/04/2024 | AB       | AB       | No Punches Available    |
      | 15/04/2024 | PR       | PR       |                         |
      | 16/04/2024 | WO       | WO       |                         |
      | 17/04/2024 | AB       | AB       | No Punches Available    |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark                  |
      | 01/04/2024 | AB       | AB       | No Punches Available    |
      | 02/04/2024 | AB       | AB       | WO-AB:Absent Cover Rule |
      | 03/04/2024 | AB       | AB       | No Punches Available    |
      | 15/04/2024 | PR       | PR       |                         |
      | 16/04/2024 | WO       | WO       |                         |
      | 17/04/2024 | AB       | AB       | No Punches Available    |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy   | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Absentee | 15/04/2024 | 30/04/2024 | ChngPlcChkM2  | ChangeToPlcM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark                  |
      | 01/04/2024 | AB       | AB       | No Punches Available    |
      | 02/04/2024 | AB       | AB       | WO-AB:Absent Cover Rule |
      | 03/04/2024 | AB       | AB       | No Punches Available    |
      | 15/04/2024 | PR       | PR       |                         |
      | 16/04/2024 | AB       | AB       | WO-AB:Absent Club Rule  |
      | 17/04/2024 | AB       | AB       | No Punches Available    |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark                  |
      | 01/04/2024 | AB       | AB       | No Punches Available    |
      | 02/04/2024 | AB       | AB       | WO-AB:Absent Cover Rule |
      | 03/04/2024 | AB       | AB       | No Punches Available    |
      | 15/04/2024 | PR       | PR       |                         |
      | 16/04/2024 | AB       | AB       | WO-AB:Absent Club Rule  |
      | 17/04/2024 | AB       | AB       | No Punches Available    |
    When Change Policy from time attendance module for "Multiple" user
      | UserId                    | Policy   | StartDate  | EndDate    | NewPolicyName | Remark        |
      | ChngPlcChkM1,ChngPlcChkM2 | Absentee | 01/04/2024 | 31/12/2099 | ChngPlcChkM3  | ChangeToPlcM3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark               |
      | 01/04/2024 | AB       | AB       | No Punches Available |
      | 02/04/2024 | WO       | WO       |                      |
      | 03/04/2024 | AB       | AB       | No Punches Available |
      | 15/04/2024 | PR       | PR       |                      |
      | 16/04/2024 | WO       | WO       |                      |
      | 17/04/2024 | AB       | AB       | No Punches Available |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "01/04/2024" and "20/04/2024"
      | Date       | 1st Half | 2nd Half | Remark               |
      | 01/04/2024 | AB       | AB       | No Punches Available |
      | 02/04/2024 | WO       | WO       |                      |
      | 03/04/2024 | AB       | AB       | No Punches Available |
      | 15/04/2024 | PR       | PR       |                      |
      | 16/04/2024 | WO       | WO       |                      |
      | 17/04/2024 | AB       | AB       | No Punches Available |

  @CP_24
  Scenario: Change Policy - Multiple User - Absentee Policy - Plc change from user config
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Delete "ZH" shift schedule
    And Delete "ZH" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZH      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False              |                     0 | False              | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZH      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZH"
      | OffDay1 |
      | None    |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | ChngPlcChkM1 | True             | False            | false                     | false             | false             | false                      | Saved Successfully |
      | ChngPlcChkM2 | False            | False            | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AbsenteePlc  | ShiftSchedule | Validation         |
      | ChngPlcChkM1 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
      | ChngPlcChkM2 | True   | True      | True      | True      | True      | True               |                        4 | ChngPlcChkM1 | ZH            | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Change Shift via API
      | userid       | FromDt | ToDt | shift-id | week-off | public-holiday |
      | ChngPlcChkM1 |      0 |    0 |          |        1 |                |
      | ChngPlcChkM2 |      0 |    0 |          |        1 |                |
    And Manual Status correction done from TnA module
      | FromDt | ToDt | ManualStatusMarking | Remark       | SelectUsers | UserIDs                   |
      |     -1 |   -1 | Full Day Present    | ByAutomation | User Wise   | ChngPlcChkM1,ChngPlcChkM2 |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ChngPlcChkM1 | Process Completed |
      | ChngPlcChkM2 | Process Completed |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-1" and "0"
      | Date | 1st Half | 2nd Half | Remark |
      |   -1 | PR       | PR       |        |
      |    0 | WO       | WO       |        |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-1" and "0"
      | Date | 1st Half | 2nd Half | Remark |
      |   -1 | PR       | PR       |        |
      |    0 | WO       | WO       |        |
    And Update users from multiuser Configuration page
      | UserID                    | AttendancePlc | AbsenteePlc  | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc |
      | ChngPlcChkM1,ChngPlcChkM2 |               | ChngPlcChkM2 |             |           |             |         |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID       |
      | ChngPlcChkM1 |
      | ChngPlcChkM2 |
    Then Daily Attendance View for userid "ChngPlcChkM1" and period "Date" on "-1" and "0"
      | Date | 1st Half | 2nd Half | Remark                 |
      |   -1 | PR       | PR       |                        |
      |    0 | AB       | AB       | WO-AB:Absent Club Rule |
    Then Daily Attendance View for userid "ChngPlcChkM2" and period "Date" on "-1" and "0"
      | Date | 1st Half | 2nd Half | Remark                 |
      |   -1 | PR       | PR       |                        |
      |    0 | AB       | AB       | WO-AB:Absent Club Rule |
