@FlexibleUserWeekly
Feature: Flexible User - Weekly

  @TnA_FlexibleWeekly_1
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Calculated Shortfall Hours Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs | Weekly Basis | Monday         | True            | Fixed Limit  |  06400 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     180000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     180000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     180000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     180000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     180000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     180000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     180000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     180000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     180000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     180000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     180000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     180000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     180000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     180000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     180000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 09:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 09:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_FlexibleWeekly_2
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Custom Shortfall Hours Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs | Weekly Basis | Monday         | True            | Fixed Limit  |  06400 | False    |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     180000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     180000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     180000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     180000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     180000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     180000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     180000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     180000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     180000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     180000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     180000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     180000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     130000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     230000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     180000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     180000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     180000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     180000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     180000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     180000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     180000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     180000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     180000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     180000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     180000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     180000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     230000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "20/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 15/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 20/01/2024 | 09:00    | 23:00    | PR       | PR       | 13:00      |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "20/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 15/01/2024 | 09:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 20/01/2024 | 09:00    | 23:00    | PR       | PR       | 13:00      |                              |

  @TnA_FlexibleWeekly_3
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_4
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_5
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_6
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWklyN |
      | FlxWkly1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |        |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |        |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |        |
      | 05/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |        |

  @TnA_FlexibleWeekly_7
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Grace Count (Monthly) - AplyDailyWrkLmt enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |               1 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     180000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     180000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 09:00    | 11:30    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs             |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 09:00    | 11:30    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 09:00    | 18:30    | PR       | PR       | 08:30      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs             |

  @TnA_FlexibleWeekly_8
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Deduct Hrs From Tgt - WO enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtWO | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     160000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     160000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     120000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     113000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     113000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     110000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     180000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     160000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     160000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     120000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     113000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     113000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     120000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     160000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     160000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     120000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     113000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     113000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     160000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     160000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     120000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     113000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     113000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     110000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     180000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     160000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     160000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     120000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     113000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     113000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     120000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     160000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     160000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     120000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     113000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     113000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 12/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 17/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 12/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 17/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 12/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 13/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 17/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 12/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 13/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 17/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_9
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Deduct Hrs From Tgt - Lv enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     120000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     113000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     113000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     110000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     160000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     120000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     113000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     113000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     120000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     113000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     113000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     110000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     160000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     120000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     113000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     113000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_10
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Deduct Hrs From Tgt - PH enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtPH | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 03/01/2024 | 03/01/2024 |          |          |              1 |
      | FlxWkly1 | 17/01/2024 | 17/01/2024 |          |          |              1 |
      | FlxWklyN | 03/01/2024 | 03/01/2024 |          |          |              1 |
      | FlxWklyN | 17/01/2024 | 17/01/2024 |          |          |              1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     120000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     113000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     113000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     110000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     160000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     120000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     113000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     113000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     120000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     113000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     113000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     110000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     160000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     120000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     113000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     113000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | PH       | PH       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | PH       | PH       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | PH       | PH       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | PH       | PH       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | PH       | PH       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | PH       | PH       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | PH       | PH       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | PH       | PH       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_11
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Deduct Hrs From Tgt - FB/RD enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtFbRd | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00              | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | Validation         |
      | 1C      | Field Break | Saved Successfully |
      | 1D      | Rest Day    | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 03/01/2024 | 03/01/2024 | 1C       |          |                |
      | FlxWkly1 | 17/01/2024 | 17/01/2024 | 1D       |          |                |
      | FlxWklyN | 03/01/2024 | 03/01/2024 | 1C       |          |                |
      | FlxWklyN | 17/01/2024 | 17/01/2024 | 1D       |          |                |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     120000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     113000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     113000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     110000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     160000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     120000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     113000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     113000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     120000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     113000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     113000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     110000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     160000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     120000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     113000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     113000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | FB       | FB       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | RD       | RD       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | FB       | FB       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | RD       | RD       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | FB       | FB       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | RD       | RD       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | FB       | FB       |            |                  |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | RD       | RD       |            |                  |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_12
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Deduct Hrs From Tgt - Not Applicable Days enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtNA | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | JoiningDate | LeavingDate | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   |    02012024 |    20012024 | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   |    02012024 |    20012024 | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     120000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     113000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     113000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     110000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     160000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     113000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     120000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     113000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     113000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     120000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     113000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     113000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     110000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     160000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     113000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     120000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     113000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     113000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs     |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                      |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 17/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 20/01/2024 |          |          | AB       | AB       |            | No Punches Available |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 04/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs     |
      | 05/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 06/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                      |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 17/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 20/01/2024 |          |          | AB       | AB       |            | No Punches Available |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                      |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                      |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                      |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                      |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 17/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 20/01/2024 |          |          | AB       | AB       |            | No Punches Available |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 04/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                      |
      | 05/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                      |
      | 06/01/2024 | 09:00    | 11:30    | PR       | PR       | 02:30      |                      |
      | 07/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                      |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                      |
      | 17/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 18/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs     |
      | 20/01/2024 |          |          | AB       | AB       |            | No Punches Available |

  @TnA_FlexibleWeekly_13
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Consider Work Hours - WO enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsWoFlg | ConsWrkHrsWoHrs | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     120000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     160000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     160000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     120000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     160000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     160000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     160000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   14012024 |     090000 |
      | FlxWkly1 |   14012024 |     120000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     100000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     110000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     120000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     160000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     150000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     120000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     160000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     160000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     120000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     160000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     160000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     160000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   14012024 |     090000 |
      | FlxWklyN |   14012024 |     120000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     100000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     110000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     120000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     160000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     150000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 19/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 19/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 19/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 20/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 19/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 20/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_14
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     120000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     160000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     160000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     120000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     160000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     160000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     160000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   14012024 |     090000 |
      | FlxWkly1 |   14012024 |     120000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     100000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     110000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     120000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     110000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     120000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     160000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     160000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     120000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     160000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     160000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     160000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   14012024 |     090000 |
      | FlxWklyN |   14012024 |     120000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     100000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     110000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     120000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     110000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_15
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Consider Work Hours - AB/In enable with 01:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True              | 01:00             | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     120000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     213000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     093000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     120000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     160000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     220000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     093000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     120000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     120000 |
      | FlxWkly1 |   14012024 |     090000 |
      | FlxWkly1 |   14012024 |     120000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     160000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     120000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     220000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     110000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     120000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     110000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     110000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     120000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     213000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     093000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     120000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     120000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     160000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     220000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     093000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     120000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     120000 |
      | FlxWklyN |   14012024 |     090000 |
      | FlxWklyN |   14012024 |     120000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     160000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     120000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     220000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     110000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     120000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     110000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     110000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 21:30    | PR       | PR       | 11:30      |                  |
      | 04/01/2024 | 09:00    | 09:30    | AB       | AB       | 00:30      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 10/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 11/01/2024 | 09:00    | 09:30    | AB       | AB       | 00:30      | AB:Less Work Hrs |
      | 12/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 18/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 21:30    | PR       | PR       | 11:30      |                  |
      | 04/01/2024 | 09:00    | 09:30    | AB       | AB       | 00:30      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 10/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 11/01/2024 | 09:00    | 09:30    | AB       | AB       | 00:30      | AB:Less Work Hrs |
      | 12/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 18/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 19/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 21:30    | PR       | PR       | 11:30      |                  |
      | 04/01/2024 | 09:00    | 09:30    | AB       | AB       | 00:30      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 11/01/2024 | 09:00    | 09:30    | PR       | PR       | 00:30      |                  |
      | 12/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 13/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 17/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 18/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 19/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 20/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 21/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 21:30    | PR       | PR       | 11:30      |                  |
      | 04/01/2024 | 09:00    | 09:30    | AB       | AB       | 00:30      | AB:Less Work Hrs |
      | 05/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 06/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 11/01/2024 | 09:00    | 09:30    | PR       | PR       | 00:30      |                  |
      | 12/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 13/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 17/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                  |
      | 18/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 19/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 20/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 21/01/2024 | 09:00    | 11:00    | WO       | WO       | 02:00      |                  |

  @TnA_FlexibleWeekly_16
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Consider Work Hours - PH enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsPhFlg | ConsWrkHrsPhHrs | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWkly1 | 09/01/2024 | 09/01/2024 |          |          |              1 |
      | FlxWkly1 | 18/01/2024 | 18/01/2024 |          |          |              1 |
      | FlxWklyN | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWklyN | 09/01/2024 | 09/01/2024 |          |          |              1 |
      | FlxWklyN | 18/01/2024 | 18/01/2024 |          |          |              1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     120000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     160000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     160000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     120000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     160000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     160000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     160000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   14012024 |     090000 |
      | FlxWkly1 |   14012024 |     120000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     100000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     110000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     120000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     110000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     120000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     160000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     160000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     120000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     160000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     160000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     160000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   14012024 |     090000 |
      | FlxWklyN |   14012024 |     120000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     100000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     110000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     120000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     110000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 19:00    | PH       | PH       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 19:00    | PH       | PH       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 19:00    | PH       | PH       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | PH       | PH       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 19:00    | PH       | PH       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_17
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Consider Work Hours - FB RD enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
      And Delete "1C" shift
      And Delete "1D" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsFbRdFlg | ConsWrkHrsFbRdHrs | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True              | 08:00             | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | Validation         |
      | 1C      | Field Break | Saved Successfully |
      | 1D      | Rest Day    | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 05/01/2024 | 05/01/2024 | 1C       |          |                |
      | FlxWkly1 | 09/01/2024 | 09/01/2024 | 1D       |          |                |
      | FlxWkly1 | 18/01/2024 | 18/01/2024 | 1C       |          |                |
      | FlxWklyN | 05/01/2024 | 05/01/2024 | 1C       |          |                |
      | FlxWklyN | 09/01/2024 | 09/01/2024 | 1D       |          |                |
      | FlxWklyN | 18/01/2024 | 18/01/2024 | 1C       |          |                |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     120000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     160000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     160000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     120000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     160000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     160000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     160000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   14012024 |     090000 |
      | FlxWkly1 |   14012024 |     120000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     100000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     110000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     120000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     110000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     120000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     160000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     160000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     120000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     160000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     160000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     160000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   14012024 |     090000 |
      | FlxWklyN |   14012024 |     120000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     100000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     110000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     120000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     180000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     110000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | FB       | FB       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | RD       | RD       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 19:00    | FB       | FB       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | FB       | FB       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | RD       | RD       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 09:00    | 18:00    | FB       | FB       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | FB       | FB       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | RD       | RD       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 19:00    | FB       | FB       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 09:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 09:00    | 12:00    | FB       | FB       | 03:00      |                  |
      | 06/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 09:00    | 12:00    | RD       | RD       | 03:00      |                  |
      | 10/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 09:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 09:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 09:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 09:00    | 18:00    | FB       | FB       | 09:00      |                  |
      | 19/01/2024 | 09:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_18
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Fixed Limit - Leave Hour deduction from target Hours for 24 Hrs Flexible User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | DeductHrsFrTgtWO | DeductHrsFrTgtPH | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  05000 | False    |                        0600 | Calculated Shortfall Hours |                   |                            |             0600 |             0600 |             0600 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWkly1 | 06/01/2024 | 07/01/2024 |          |        1 |                |
      | FlxWklyN | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWklyN | 06/01/2024 | 07/01/2024 |          |        1 |                |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     160000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     160000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 09:00    | 12:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 09:00    | 12:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 16:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 09:00    | 12:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 16:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 09:00    | 12:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_19
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Custom Shortfall
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  05600 | False    |                        0600 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     180000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     180000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     200000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     200000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     200000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     180000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     180000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     180000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     200000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     200000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     200000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     180000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     160000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |        |
      | 09/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |        |
      | 10/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |        |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |        |
      | 09/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |        |
      | 10/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |        |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 09/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 10/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 09/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 10/01/2024 | 09:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_20
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Weekly Target As Per = Days In A Week Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     170000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     170000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     230000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     230000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     230000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     230000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     170000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     170000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     170000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     230000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     230000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     230000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     230000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     170000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 12/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 13/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 12/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 13/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 12/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 13/01/2024 |          |          | PR       | PR       |            |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 12/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 13/01/2024 |          |          | PR       | PR       |            |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_21
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Weekly Target As Per = Days In A Week - Deduct Hrs from Target Lv Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            |             0800 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     170000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     170000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     230000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     230000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     230000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     230000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     110000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     230000 |
      | FlxWkly1 |   17012024 |     080000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     230000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     230000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     230000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     170000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     170000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     230000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     230000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     230000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     230000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     110000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     230000 |
      | FlxWklyN |   17012024 |     080000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     230000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     230000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     230000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                      |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 09/01/2024 |          |          | AB       | 1A       |            | No Punches Available |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 13/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 16/01/2024 |          |          | AB       | 1A       |            | No Punches Available |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 20/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                      |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                      |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |                      |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 09/01/2024 |          |          | AB       | 1A       |            | No Punches Available |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 13/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 16/01/2024 |          |          | AB       | 1A       |            | No Punches Available |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 20/01/2024 | 09:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 09/01/2024 |          |          | AB       | 1A       |            | No Punches Available         |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 13/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 16/01/2024 |          |          | PR       | 1A       |            |                              |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 20/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 09/01/2024 |          |          | AB       | 1A       |            | No Punches Available         |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 13/01/2024 | 09:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 16/01/2024 |          |          | PR       | 1A       |            |                              |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 20/01/2024 | 09:00    | 13:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_22
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Weekly Target As Per = Days In A Week Shortfall Hours Deduction Deduct (Full Day Hrs)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0600 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     170000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     170000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     170000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     170000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     230000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     230000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     200000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     170000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     170000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     170000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     170000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     230000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     230000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     200000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     160000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 09/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |        |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |        |
      | 12/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 09/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |        |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |        |
      | 12/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 09:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 09/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 12/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 09/01/2024 | 09:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                              |
      | 12/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 09:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_23
  Scenario: TnA_Flexible - Weekly - Flexible for 24 Hrs - Weekly Target As Per = Days In A Week - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     220000 |
      | FlxWkly1 |   07012024 |     090000 |
      | FlxWkly1 |   07012024 |     130000 |
      | FlxWkly1 |   07012024 |     140000 |
      | FlxWkly1 |   07012024 |     230000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     210000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     220000 |
      | FlxWkly1 |   14012024 |     090000 |
      | FlxWkly1 |   14012024 |     130000 |
      | FlxWkly1 |   14012024 |     140000 |
      | FlxWkly1 |   14012024 |     230000 |
      | FlxWkly1 |   15012024 |     090000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     090000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     090000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     090000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     090000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     090000 |
      | FlxWkly1 |   20012024 |     130000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWkly1 |   21012024 |     090000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     220000 |
      | FlxWklyN |   07012024 |     090000 |
      | FlxWklyN |   07012024 |     130000 |
      | FlxWklyN |   07012024 |     140000 |
      | FlxWklyN |   07012024 |     230000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     210000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     220000 |
      | FlxWklyN |   14012024 |     090000 |
      | FlxWklyN |   14012024 |     130000 |
      | FlxWklyN |   14012024 |     140000 |
      | FlxWklyN |   14012024 |     230000 |
      | FlxWklyN |   15012024 |     090000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     090000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     090000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     090000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     090000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     090000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
      | FlxWklyN |   21012024 |     090000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 09:00    | 21:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |        |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 09:00    | 21:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 09:00    | 21:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 09:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 09:00    | 21:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 09:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 09:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 09:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 09:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 09:00    | 19:00    | WO       | WO       | 09:00      |                              |

  @TnA_FlexibleWeekly_24
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Calculated Shortfall Hours Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start | Weekly Basis | Monday         | True            | Fixed Limit  |  06400 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     180000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     180000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     180000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     180000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     180000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     180000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     180000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     180000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     180000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     180000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     180000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     180000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     180000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     180000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     180000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     180000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 08/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 10/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 11/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 08/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 10/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 11/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 08:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 08:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 08:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 08:00    | 18:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 08:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 08:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_FlexibleWeekly_25
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_26
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_27
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_28
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 08:00    | 15:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |        |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 08:00    | 12:00    | PR       | PR       | 03:00      |        |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 08:00    | 15:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |        |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 08:00    | 12:00    | PR       | PR       | 03:00      |        |

  @TnA_FlexibleWeekly_29
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Grace Count (Monthly) - AplyDailyWrkLmt enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |               1 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     113000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     113000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     183000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     180000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     120000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     113000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     113000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     183000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     180000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     120000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 08:00    | 11:30    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                              |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs             |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 08:00    | 11:30    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 08:00    | 18:30    | PR       | PR       | 08:30      |                              |
      | 05/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs             |

  @TnA_FlexibleWeekly_30
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Deduct Hrs From Tgt - Lv enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     120000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     113000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     113000 |
      | FlxWkly1 |   07012024 |     080000 |
      | FlxWkly1 |   07012024 |     110000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     160000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     120000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     113000 |
      | FlxWkly1 |   20012024 |     080000 |
      | FlxWkly1 |   20012024 |     113000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     120000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     113000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     113000 |
      | FlxWklyN |   07012024 |     080000 |
      | FlxWklyN |   07012024 |     110000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     160000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     120000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     113000 |
      | FlxWklyN |   20012024 |     080000 |
      | FlxWklyN |   20012024 |     113000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 08:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 08:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 08:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 08:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 08:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 08:00    | 11:30    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 08:00    | 11:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 08:00    | 11:30    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_31
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     120000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     160000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     160000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   07012024 |     080000 |
      | FlxWkly1 |   07012024 |     120000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     160000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     160000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     160000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   14012024 |     080000 |
      | FlxWkly1 |   14012024 |     120000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     100000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     110000 |
      | FlxWkly1 |   17012024 |     080000 |
      | FlxWkly1 |   17012024 |     120000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     110000 |
      | FlxWkly1 |   20012024 |     080000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   21012024 |     080000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     120000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     160000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     160000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   07012024 |     080000 |
      | FlxWklyN |   07012024 |     120000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     160000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     160000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     160000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   14012024 |     080000 |
      | FlxWklyN |   14012024 |     120000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     100000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     110000 |
      | FlxWklyN |   17012024 |     080000 |
      | FlxWklyN |   17012024 |     120000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     110000 |
      | FlxWklyN |   20012024 |     080000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   21012024 |     080000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 08:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 08:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 08:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 08:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 08:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 08:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 08:00    | 10:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 08:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 08:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 08:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 08:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 08:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 08:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 08:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 08:00    | 14:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 08:00    | 12:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 08:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 08:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 08:00    | 12:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 08:00    | 10:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 08:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 08:00    | 12:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 08:00    | 11:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 08:00    | 13:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_32
  Scenario: TnA_Flexible - Weekly - From Shift Start - Fixed Limit - Leave Hour deduction from target Hours for 24 Hrs Flexible User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | DeductHrsFrTgtWO | DeductHrsFrTgtPH | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  05000 | False    |                        0600 | Calculated Shortfall Hours |                   |                            |             0600 |             0600 |             0600 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWkly1 | 06/01/2024 | 07/01/2024 |          |        1 |                |
      | FlxWklyN | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWklyN | 06/01/2024 | 07/01/2024 |          |        1 |                |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     160000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     160000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     160000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     160000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 08:00    | 12:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 08:00    | 12:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 16:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 08:00    | 12:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 16:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 08:00    | 12:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_33
  Scenario: TnA_Flexible - Weekly - From Shift Start - Weekly Target As Per = Days In A Week Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     170000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     170000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     230000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     230000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     230000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     230000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     110000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     170000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     170000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     230000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     230000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     230000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     230000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     110000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 13/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 13/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 13/01/2024 | 08:00    | 11:00    | PR       | PR       | 02:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 13/01/2024 | 08:00    | 11:00    | PR       | PR       | 02:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_34
  Scenario: TnA_Flexible - Weekly - From Shift Start - Weekly Target As Per = Days In A Week - Deduct Hrs from Target Lv Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            |             0800 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     170000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     170000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     230000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     230000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     230000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     230000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     110000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     230000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   17012024 |     080000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     230000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     230000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     230000 |
      | FlxWkly1 |   20012024 |     080000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     170000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     170000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     230000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     230000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     230000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     230000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     110000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     230000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   17012024 |     080000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     230000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     230000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     230000 |
      | FlxWklyN |   20012024 |     080000 |
      | FlxWklyN |   20012024 |     130000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 08:00    | 14:00    | PR       | 1A       | 04:00      |                  |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 13/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 16/01/2024 | 08:00    | 14:00    | PR       | 1A       | 04:00      |                  |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 20/01/2024 | 08:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 08:00    | 13:00    | PR       | 1A       | 04:00      |                  |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 13/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 16/01/2024 | 08:00    | 13:00    | PR       | 1A       | 04:00      |                  |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 20/01/2024 | 08:00    | 13:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 08:00    | 14:00    | PR       | 1A       | 04:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 13/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 16/01/2024 | 08:00    | 14:00    | PR       | 1A       | 04:00      |                              |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 20/01/2024 | 08:00    | 14:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 17:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 08:00    | 13:00    | PR       | 1A       | 04:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 13/01/2024 | 08:00    | 11:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 16/01/2024 | 08:00    | 13:00    | PR       | 1A       | 04:00      |                              |
      | 17/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 18/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 19/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 20/01/2024 | 08:00    | 13:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_35
  Scenario: TnA_Flexible - Weekly - From Shift Start - Weekly Target As Per = Days In A Week Shortfall Hours Deduction Deduct (Full Day Hrs)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0600 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     180000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     170000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     180000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     180000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     170000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     160000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     170000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     230000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     230000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     210000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     180000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     170000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     180000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     180000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     170000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     160000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     170000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     230000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     230000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     210000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     160000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 08:00    | 16:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 18:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 17:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 08:00    | 17:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 08:00    | 16:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_36
  Scenario: TnA_Flexible - Weekly - From Shift Start - Weekly Target As Per = Days In A Week - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | From Shift Start |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     120000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     220000 |
      | FlxWkly1 |   07012024 |     080000 |
      | FlxWkly1 |   07012024 |     130000 |
      | FlxWkly1 |   07012024 |     140000 |
      | FlxWkly1 |   07012024 |     230000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     120000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     210000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     220000 |
      | FlxWkly1 |   14012024 |     080000 |
      | FlxWkly1 |   14012024 |     130000 |
      | FlxWkly1 |   14012024 |     140000 |
      | FlxWkly1 |   14012024 |     230000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     080000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     080000 |
      | FlxWkly1 |   20012024 |     130000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWkly1 |   21012024 |     080000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     120000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     220000 |
      | FlxWklyN |   07012024 |     080000 |
      | FlxWklyN |   07012024 |     130000 |
      | FlxWklyN |   07012024 |     140000 |
      | FlxWklyN |   07012024 |     230000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     120000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     210000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     220000 |
      | FlxWklyN |   14012024 |     080000 |
      | FlxWklyN |   14012024 |     130000 |
      | FlxWklyN |   14012024 |     140000 |
      | FlxWklyN |   14012024 |     230000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     080000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     080000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
      | FlxWklyN |   21012024 |     080000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 08:00    | 12:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 08:00    | 21:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 08:00    | 22:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 08:00    | 23:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                              |

  @TnA_FlexibleWeekly_37
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Calculated Shortfall Hours Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End | Weekly Basis | Monday         | True            | Fixed Limit  |  06400 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     090000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     090000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     090000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     090000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     090000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     090000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     090000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     090000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     090000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     090000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     090000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     090000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     090000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     090000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     090000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     090000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 08/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 08/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 12/01/2024 | 09:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 09:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 09:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 09:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 09:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 09:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |

  @TnA_FlexibleWeekly_38
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     083000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     093000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     150000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     083000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     093000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     150000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_39
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     083000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     093000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     150000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     083000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     093000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     150000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_40
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     083000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     093000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     150000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     083000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     093000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     150000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_41
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     083000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     093000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     150000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     083000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     093000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     150000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 12:00    | 19:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |        |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |        |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 12:00    | 19:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |        |
      | 05/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |        |

  @TnA_FlexibleWeekly_42
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Grace Count (Monthly) - AplyDailyWrkLmt enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |               1 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     120000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     083000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     150000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     120000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     083000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     150000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                  |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 15:30    | 19:00    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                              |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs             |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 15:30    | 19:00    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 08:30    | 19:00    | PR       | PR       | 08:30      |                              |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs             |

  @TnA_FlexibleWeekly_43
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Deduct Hrs From Tgt - Lv enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     150000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     153000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     153000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   07012024 |     160000 |
      | FlxWkly1 |   07012024 |     190000 |
      | FlxWkly1 |   15012024 |     110000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   18012024 |     150000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     153000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     153000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     150000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     153000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     153000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   07012024 |     160000 |
      | FlxWklyN |   07012024 |     190000 |
      | FlxWklyN |   15012024 |     110000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   18012024 |     150000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     153000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     153000 |
      | FlxWklyN |   20012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_44
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     110000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     150000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     110000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     110000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     150000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   07012024 |     150000 |
      | FlxWkly1 |   07012024 |     190000 |
      | FlxWkly1 |   08012024 |     110000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     150000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     110000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     110000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     120000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWkly1 |   14012024 |     150000 |
      | FlxWkly1 |   14012024 |     190000 |
      | FlxWkly1 |   15012024 |     170000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     160000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     150000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     160000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     130000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWkly1 |   21012024 |     080000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     110000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     150000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     110000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     110000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     150000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   07012024 |     150000 |
      | FlxWklyN |   07012024 |     190000 |
      | FlxWklyN |   08012024 |     110000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     150000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     110000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     110000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     120000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
      | FlxWklyN |   14012024 |     150000 |
      | FlxWklyN |   14012024 |     190000 |
      | FlxWklyN |   15012024 |     170000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     160000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     150000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     160000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
      | FlxWklyN |   21012024 |     080000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 13:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 13:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_45
  Scenario: TnA_Flexible - Weekly - Till Shift End - Fixed Limit - Leave Hour deduction from target Hours for 24 Hrs Flexible User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | DeductHrsFrTgtWO | DeductHrsFrTgtPH | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  05000 | False    |                        0600 | Calculated Shortfall Hours |                   |                            |             0600 |             0600 |             0600 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWkly1 | 06/01/2024 | 07/01/2024 |          |        1 |                |
      | FlxWklyN | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWklyN | 06/01/2024 | 07/01/2024 |          |        1 |                |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     110000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     110000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWklyN |   01012024 |     110000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     110000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 15:00    | 19:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 15:00    | 19:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 11:00    | 19:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 15:00    | 19:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 11:00    | 19:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 15:00    | 19:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_46
  Scenario: TnA_Flexible - Weekly - Till Shift End - Weekly Target As Per = Days In A Week Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     100000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     100000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     110000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     040000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     040000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     040000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     040000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     100000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     100000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     110000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     040000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     040000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     040000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     040000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     160000 |
      | FlxWklyN |   13012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_47
  Scenario: TnA_Flexible - Weekly - Till Shift End - Weekly Target As Per = Days In A Week - Deduct Hrs from Target Lv Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1F" shift schedule
    And Delete "1F" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            |             0800 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1F      | 02:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1F" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1F      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | 1F            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | 1F            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     100000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     100000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     110000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     040000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     040000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     040000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     040000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWkly1 |   15012024 |     040000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     040000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     040000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     040000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     100000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     100000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     110000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     040000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     040000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     040000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     040000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     160000 |
      | FlxWklyN |   13012024 |     190000 |
      | FlxWklyN |   15012024 |     040000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     040000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     040000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     040000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_48
  Scenario: TnA_Flexible - Weekly - Till Shift End - Weekly Target As Per = Days In A Week Shortfall Hours Deduction Deduct (Full Day Hrs)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0600 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     100000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     100000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     110000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     100000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     040000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     040000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     060000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     110000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     100000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     100000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     110000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     100000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     040000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     040000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     060000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     110000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_49
  Scenario: TnA_Flexible - Weekly - Till Shift End - Weekly Target As Per = Days In A Week - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1F" shift schedule
    And Delete "1F" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | Till Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1F      | 02:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1F" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1F      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | 1F            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | 1F            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     150000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     050000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   07012024 |     040000 |
      | FlxWkly1 |   07012024 |     130000 |
      | FlxWkly1 |   07012024 |     140000 |
      | FlxWkly1 |   07012024 |     190000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     150000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     060000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     050000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWkly1 |   14012024 |     040000 |
      | FlxWkly1 |   14012024 |     130000 |
      | FlxWkly1 |   14012024 |     140000 |
      | FlxWkly1 |   14012024 |     190000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     080000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     080000 |
      | FlxWkly1 |   20012024 |     130000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWkly1 |   21012024 |     080000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     150000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     050000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   07012024 |     040000 |
      | FlxWklyN |   07012024 |     130000 |
      | FlxWklyN |   07012024 |     140000 |
      | FlxWklyN |   07012024 |     190000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     150000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     060000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     050000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
      | FlxWklyN |   14012024 |     040000 |
      | FlxWklyN |   14012024 |     130000 |
      | FlxWklyN |   14012024 |     140000 |
      | FlxWklyN |   14012024 |     190000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     080000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     080000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
      | FlxWklyN |   21012024 |     080000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                              |

  @TnA_FlexibleWeekly_50
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Calculated Shortfall Hours Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End | Weekly Basis | Monday         | True            | Fixed Limit  |  06400 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0400 |            0800 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWklyN |
      | FlxWkly1 |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     080000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     080000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     150000 |
      | FlxWkly1 |   13012024 |     080000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     080000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     080000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     150000 |
      | FlxWklyN |   13012024 |     080000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 09/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 12/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 08:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 08:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "13/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | AB       | AB       | 08:00      | Full Day AB:Target Shortfall |
      | 09/01/2024 | 08:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 08:00    | 15:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 13/01/2024 | 08:00    | 19:00    | PR       | PR       | 08:00      |                              |

  @TnA_FlexibleWeekly_51
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     093000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     093000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_52
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     093000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     093000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_53
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Grace Hours disable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     093000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     093000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |

  @TnA_FlexibleWeekly_54
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Grace Hours Enable - AplyDailyWrkLmt disable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     093000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     080000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     173000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     093000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     080000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     173000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 08:00    | 15:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |        |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 13:00    | 19:00    | PR       | PR       | 04:00      |        |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 02/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |        |
      | 03/01/2024 | 08:00    | 15:00    | PR       | PR       | 05:00      |        |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |        |
      | 05/01/2024 | 08:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |        |

  @TnA_FlexibleWeekly_55
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Grace Count (Monthly) - AplyDailyWrkLmt enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |               1 | Weekly Basis | Monday         | True            | Fixed Limit  |  03000 | True     |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     153000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     153000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   04012024 |     093000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     090000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWklyN |   01012024 |     153000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     153000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   04012024 |     093000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     090000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 02/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                  |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 15:30    | 19:00    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                              |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 13:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs             |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs             |
      | 02/01/2024 | 15:30    | 19:00    | AB       | AB       | 02:30      | Full Day AB:Less Grace Count |
      | 03/01/2024 | 08:00    | 15:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 04/01/2024 | 09:30    | 19:00    | PR       | PR       | 07:30      |                              |
      | 05/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs             |

  @TnA_FlexibleWeekly_56
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Deduct Hrs From Tgt - Lv enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1E" shift schedule
    And Delete "1E" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | 06:00            | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1E      | 08:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1E" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1E      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   17012024 | 17012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     150000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     153000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     153000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   07012024 |     160000 |
      | FlxWkly1 |   07012024 |     190000 |
      | FlxWkly1 |   15012024 |     110000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   18012024 |     150000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     153000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     153000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     150000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     153000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     153000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   07012024 |     160000 |
      | FlxWklyN |   07012024 |     190000 |
      | FlxWklyN |   15012024 |     110000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   18012024 |     150000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     153000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     153000 |
      | FlxWklyN |   20012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 05/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 06/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 05/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 06/01/2024 | 15:30    | 19:00    | PR       | PR       | 02:30      |                  |
      | 07/01/2024 | 16:00    | 19:00    | WO       | WO       | 02:00      |                  |
      | 15/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 17/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 18/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 19/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 20/01/2024 | 15:30    | 19:00    | PR       | AB       | 02:30      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |

  @TnA_FlexibleWeekly_57
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1E" shift schedule
    And Delete "1E" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Fixed Limit  |  03000 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1E      | 08:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1E" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1E      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     110000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     150000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     110000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     110000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     150000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   07012024 |     150000 |
      | FlxWkly1 |   07012024 |     190000 |
      | FlxWkly1 |   08012024 |     110000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     150000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     110000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     110000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     120000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWkly1 |   14012024 |     150000 |
      | FlxWkly1 |   14012024 |     190000 |
      | FlxWkly1 |   15012024 |     170000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     160000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     150000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     160000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWkly1 |   21012024 |     080000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     110000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     150000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     110000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     110000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     150000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   07012024 |     150000 |
      | FlxWklyN |   07012024 |     190000 |
      | FlxWklyN |   08012024 |     110000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     150000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     110000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     110000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     120000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
      | FlxWklyN |   14012024 |     150000 |
      | FlxWklyN |   14012024 |     190000 |
      | FlxWklyN |   15012024 |     170000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     160000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     150000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     160000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
      | FlxWklyN |   21012024 |     080000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | AB       | 05:00      | AB:Less Work Hrs |
      | 13/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | AB       | AB       | 01:00      | AB:Less Work Hrs |
      | 16/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 17/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 02/01/2024 | 15:00    | 19:00    | PR       | AB       | 03:00      | AB:Less Work Hrs |
      | 03/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 04/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 06/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 07/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 08/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                  |
      | 10/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 11/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 12/01/2024 | 12:00    | 19:00    | PR       | PR       | 05:00      |                  |
      | 13/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 14/01/2024 | 15:00    | 19:00    | WO       | WO       | 03:00      |                  |
      | 15/01/2024 | 17:00    | 19:00    | PR       | PR       | 01:00      |                  |
      | 16/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 17/01/2024 | 15:00    | 19:00    | PR       | PR       | 03:00      |                  |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                  |
      | 19/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                  |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                  |

  @TnA_FlexibleWeekly_58
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Fixed Limit - Leave Hour deduction from target Hours for 24 Hrs Flexible User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | DeductHrsFrTgtWO | DeductHrsFrTgtPH | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | True            | Fixed Limit  |  05000 | False    |                        0600 | Calculated Shortfall Hours |                   |                            |             0600 |             0600 |             0600 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create user from user configuration
      | userid   | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Change Shift via API
      | userid   | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | FlxWkly1 | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWkly1 | 06/01/2024 | 07/01/2024 |          |        1 |                |
      | FlxWklyN | 05/01/2024 | 05/01/2024 |          |          |              1 |
      | FlxWklyN | 06/01/2024 | 07/01/2024 |          |        1 |                |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   03012024 | 03012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     110000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     110000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     150000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWklyN |   01012024 |     110000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     110000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     150000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 15:00    | 19:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 03/01/2024 | 15:00    | 19:00    | PR       | 1A       | 03:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 |          |          | PH       | PH       |            |        |
      | 06/01/2024 |          |          | WO       | WO       |            |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 11:00    | 19:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 15:00    | 19:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 11:00    | 19:00    | PR       | AB       | 06:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                              |
      | 03/01/2024 | 15:00    | 19:00    | AB       | 1A       | 03:00      | 1st Half AB:Target Shortfall |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 |          |          | PH       | PH       |            |                              |
      | 06/01/2024 |          |          | WO       | WO       |            |                              |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_59
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Weekly Target As Per = Days In A Week Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1E" shift schedule
    And Delete "1E" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1E      | 04:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1E" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1E      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     100000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     100000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     110000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     040000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     040000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     040000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     040000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     080000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     100000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     100000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     110000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     040000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     040000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     040000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     040000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     080000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     160000 |
      | FlxWklyN |   13012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | PR       | PR       | 02:00      |                              |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_60
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Weekly Target As Per = Days In A Week - Deduct Hrs from Target Lv Enable Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1E" shift schedule
    And Delete "1E" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | DeductHrsFrTgtLV | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            |             0800 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1E      | 04:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1E" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1E      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   03012024 | 03012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  3 |   16012024 | 16012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     100000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     100000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     110000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     040000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     040000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     040000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     040000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     160000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWkly1 |   15012024 |     040000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     040000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     040000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     040000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     100000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     100000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     110000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     040000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     040000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     040000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     040000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     160000 |
      | FlxWklyN |   13012024 |     190000 |
      | FlxWklyN |   15012024 |     040000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     040000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     040000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     040000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                  |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                  |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                  |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |                  |
      | 07/01/2024 |          |          | WO       | WO       |            |                  |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs |
      | 14/01/2024 |          |          | WO       | WO       |            |                  |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                  |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                  |
      | 20/01/2024 | 14:00    | 19:00    | PR       | AB       | 04:00      | AB:Less Work Hrs |
      | 21/01/2024 |          |          | WO       | WO       |            |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 |          |          | 1A       | 1A       |            |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | PR       | AB       | 07:00      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 09/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 13/01/2024 | 16:00    | 19:00    | AB       | AB       | 02:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 16/01/2024 | 14:00    | 19:00    | PR       | 1A       | 04:00      |                              |
      | 17/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 18/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 19/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 20/01/2024 | 14:00    | 19:00    | PR       | PR       | 04:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_61
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Weekly Target As Per = Days In A Week Shortfall Hours Deduction Deduct (Full Day Hrs)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1E" shift schedule
    And Delete "1E" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0600 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1E      | 04:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1E" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1E      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxWkly1 | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | Saved Successfully |
      | FlxWklyN | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     090000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     100000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     090000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     090000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     100000 |
      | FlxWkly1 |   05012024 |     130000 |
      | FlxWkly1 |   05012024 |     140000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     110000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     100000 |
      | FlxWkly1 |   09012024 |     130000 |
      | FlxWkly1 |   09012024 |     140000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     040000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     040000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     060000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     110000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWklyN |   01012024 |     090000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     100000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     090000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     090000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     100000 |
      | FlxWklyN |   05012024 |     130000 |
      | FlxWklyN |   05012024 |     140000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     110000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     100000 |
      | FlxWklyN |   09012024 |     130000 |
      | FlxWklyN |   09012024 |     140000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     040000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     040000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     060000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     110000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 06/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 07/01/2024 |          |          | WO       | WO       |            |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |        |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 11:00    | 19:00    | PR       | PR       | 06:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 19:00    | PR       | AB       | 08:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 03/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 04/01/2024 | 09:00    | 19:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 10:00    | 19:00    | AB       | AB       | 07:00      | Full Day AB:Target Shortfall |
      | 06/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 10:00    | 19:00    | PR       | PR       | 07:00      |                              |
      | 10/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 11/01/2024 | 04:00    | 19:00    | PR       | PR       | 13:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 11:00    | 19:00    | AB       | AB       | 06:00      | Full Day AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |

  @TnA_FlexibleWeekly_62
  Scenario: TnA_Flexible - Weekly - From Shift Start to Shift End  - Weekly Target As Per = Days In A Week - Consider Work Hours - Lv enable with 08:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Delete "1E" shift schedule
    And Delete "1E" shift
    And Create Attendance Policy
      | PlcName  | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal   | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtDailyHrs | GraceHrs | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | ConsWrkHrsLvFlg | ConsWrkHrsLvHrs | validation         |
      | FlxWkly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Weekly Basis | Monday         | False           | Days In A Week |        0900 | False    |                        0800 | Calculated Shortfall Hours |                   |                            | True            | 08:00           | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1A      | 1A        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "1A" with Pro-rata "False"
      | LeaveID |
      | 1A      |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1E      | 04:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "1E" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1E      |               7 | true   |
    And Create user from user configuration
      | userid   | Active | ShiftSchedule | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LeaveGroup | Validation         |
      | FlxWkly1 | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               |                        4 | 1A         | Saved Successfully |
      | FlxWklyN | True   | 1E            | True      | Flexible       |            0300 |            0600 | FlxWkly1      | True      | True      | True               | N-Punch                  | 1A         | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    And Credit_Debit_Encash Leave via API
      | userid   | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | FlxWkly1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
      | FlxWklyN |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | 1A         |        | January | 2024 |          | credit | 002:00 |
    And Apply Leave Application via API
      | userid   | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | FlxWkly1 |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWkly1 |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   05012024 | 05012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   09012024 | 09012024 | 1A         |                     0 | SA        |
      | FlxWklyN |                  1 |   18012024 | 18012024 | 1A         |                     0 | SA        |
    When Set event via Event Set API
      | Userid   | event-date | event-time |
      | FlxWkly1 |   01012024 |     080000 |
      | FlxWkly1 |   01012024 |     130000 |
      | FlxWkly1 |   01012024 |     140000 |
      | FlxWkly1 |   01012024 |     190000 |
      | FlxWkly1 |   02012024 |     080000 |
      | FlxWkly1 |   02012024 |     130000 |
      | FlxWkly1 |   02012024 |     140000 |
      | FlxWkly1 |   02012024 |     190000 |
      | FlxWkly1 |   03012024 |     080000 |
      | FlxWkly1 |   03012024 |     130000 |
      | FlxWkly1 |   03012024 |     140000 |
      | FlxWkly1 |   03012024 |     190000 |
      | FlxWkly1 |   04012024 |     080000 |
      | FlxWkly1 |   04012024 |     130000 |
      | FlxWkly1 |   04012024 |     140000 |
      | FlxWkly1 |   04012024 |     190000 |
      | FlxWkly1 |   05012024 |     150000 |
      | FlxWkly1 |   05012024 |     190000 |
      | FlxWkly1 |   06012024 |     050000 |
      | FlxWkly1 |   06012024 |     130000 |
      | FlxWkly1 |   06012024 |     140000 |
      | FlxWkly1 |   06012024 |     190000 |
      | FlxWkly1 |   07012024 |     040000 |
      | FlxWkly1 |   07012024 |     130000 |
      | FlxWkly1 |   07012024 |     140000 |
      | FlxWkly1 |   07012024 |     190000 |
      | FlxWkly1 |   08012024 |     080000 |
      | FlxWkly1 |   08012024 |     130000 |
      | FlxWkly1 |   08012024 |     140000 |
      | FlxWkly1 |   08012024 |     190000 |
      | FlxWkly1 |   09012024 |     150000 |
      | FlxWkly1 |   09012024 |     190000 |
      | FlxWkly1 |   10012024 |     080000 |
      | FlxWkly1 |   10012024 |     130000 |
      | FlxWkly1 |   10012024 |     140000 |
      | FlxWkly1 |   10012024 |     190000 |
      | FlxWkly1 |   11012024 |     080000 |
      | FlxWkly1 |   11012024 |     130000 |
      | FlxWkly1 |   11012024 |     140000 |
      | FlxWkly1 |   11012024 |     190000 |
      | FlxWkly1 |   12012024 |     060000 |
      | FlxWkly1 |   12012024 |     130000 |
      | FlxWkly1 |   12012024 |     140000 |
      | FlxWkly1 |   12012024 |     190000 |
      | FlxWkly1 |   13012024 |     050000 |
      | FlxWkly1 |   13012024 |     130000 |
      | FlxWkly1 |   13012024 |     140000 |
      | FlxWkly1 |   13012024 |     190000 |
      | FlxWkly1 |   14012024 |     040000 |
      | FlxWkly1 |   14012024 |     130000 |
      | FlxWkly1 |   14012024 |     140000 |
      | FlxWkly1 |   14012024 |     190000 |
      | FlxWkly1 |   15012024 |     080000 |
      | FlxWkly1 |   15012024 |     130000 |
      | FlxWkly1 |   15012024 |     140000 |
      | FlxWkly1 |   15012024 |     190000 |
      | FlxWkly1 |   16012024 |     080000 |
      | FlxWkly1 |   16012024 |     130000 |
      | FlxWkly1 |   16012024 |     140000 |
      | FlxWkly1 |   16012024 |     190000 |
      | FlxWkly1 |   17012024 |     080000 |
      | FlxWkly1 |   17012024 |     130000 |
      | FlxWkly1 |   17012024 |     140000 |
      | FlxWkly1 |   17012024 |     190000 |
      | FlxWkly1 |   18012024 |     080000 |
      | FlxWkly1 |   18012024 |     130000 |
      | FlxWkly1 |   18012024 |     140000 |
      | FlxWkly1 |   18012024 |     190000 |
      | FlxWkly1 |   19012024 |     080000 |
      | FlxWkly1 |   19012024 |     130000 |
      | FlxWkly1 |   19012024 |     140000 |
      | FlxWkly1 |   19012024 |     190000 |
      | FlxWkly1 |   20012024 |     080000 |
      | FlxWkly1 |   20012024 |     130000 |
      | FlxWkly1 |   20012024 |     140000 |
      | FlxWkly1 |   20012024 |     190000 |
      | FlxWkly1 |   21012024 |     080000 |
      | FlxWkly1 |   21012024 |     130000 |
      | FlxWkly1 |   21012024 |     140000 |
      | FlxWkly1 |   21012024 |     190000 |
      | FlxWklyN |   01012024 |     080000 |
      | FlxWklyN |   01012024 |     130000 |
      | FlxWklyN |   01012024 |     140000 |
      | FlxWklyN |   01012024 |     190000 |
      | FlxWklyN |   02012024 |     080000 |
      | FlxWklyN |   02012024 |     130000 |
      | FlxWklyN |   02012024 |     140000 |
      | FlxWklyN |   02012024 |     190000 |
      | FlxWklyN |   03012024 |     080000 |
      | FlxWklyN |   03012024 |     130000 |
      | FlxWklyN |   03012024 |     140000 |
      | FlxWklyN |   03012024 |     190000 |
      | FlxWklyN |   04012024 |     080000 |
      | FlxWklyN |   04012024 |     130000 |
      | FlxWklyN |   04012024 |     140000 |
      | FlxWklyN |   04012024 |     190000 |
      | FlxWklyN |   05012024 |     150000 |
      | FlxWklyN |   05012024 |     190000 |
      | FlxWklyN |   06012024 |     050000 |
      | FlxWklyN |   06012024 |     130000 |
      | FlxWklyN |   06012024 |     140000 |
      | FlxWklyN |   06012024 |     190000 |
      | FlxWklyN |   07012024 |     040000 |
      | FlxWklyN |   07012024 |     130000 |
      | FlxWklyN |   07012024 |     140000 |
      | FlxWklyN |   07012024 |     190000 |
      | FlxWklyN |   08012024 |     080000 |
      | FlxWklyN |   08012024 |     130000 |
      | FlxWklyN |   08012024 |     140000 |
      | FlxWklyN |   08012024 |     190000 |
      | FlxWklyN |   09012024 |     150000 |
      | FlxWklyN |   09012024 |     190000 |
      | FlxWklyN |   10012024 |     080000 |
      | FlxWklyN |   10012024 |     130000 |
      | FlxWklyN |   10012024 |     140000 |
      | FlxWklyN |   10012024 |     190000 |
      | FlxWklyN |   11012024 |     080000 |
      | FlxWklyN |   11012024 |     130000 |
      | FlxWklyN |   11012024 |     140000 |
      | FlxWklyN |   11012024 |     190000 |
      | FlxWklyN |   12012024 |     060000 |
      | FlxWklyN |   12012024 |     130000 |
      | FlxWklyN |   12012024 |     140000 |
      | FlxWklyN |   12012024 |     190000 |
      | FlxWklyN |   13012024 |     050000 |
      | FlxWklyN |   13012024 |     130000 |
      | FlxWklyN |   13012024 |     140000 |
      | FlxWklyN |   13012024 |     190000 |
      | FlxWklyN |   14012024 |     040000 |
      | FlxWklyN |   14012024 |     130000 |
      | FlxWklyN |   14012024 |     140000 |
      | FlxWklyN |   14012024 |     190000 |
      | FlxWklyN |   15012024 |     080000 |
      | FlxWklyN |   15012024 |     130000 |
      | FlxWklyN |   15012024 |     140000 |
      | FlxWklyN |   15012024 |     190000 |
      | FlxWklyN |   16012024 |     080000 |
      | FlxWklyN |   16012024 |     130000 |
      | FlxWklyN |   16012024 |     140000 |
      | FlxWklyN |   16012024 |     190000 |
      | FlxWklyN |   17012024 |     080000 |
      | FlxWklyN |   17012024 |     130000 |
      | FlxWklyN |   17012024 |     140000 |
      | FlxWklyN |   17012024 |     190000 |
      | FlxWklyN |   18012024 |     080000 |
      | FlxWklyN |   18012024 |     130000 |
      | FlxWklyN |   18012024 |     140000 |
      | FlxWklyN |   18012024 |     190000 |
      | FlxWklyN |   19012024 |     080000 |
      | FlxWklyN |   19012024 |     130000 |
      | FlxWklyN |   19012024 |     140000 |
      | FlxWklyN |   19012024 |     190000 |
      | FlxWklyN |   20012024 |     080000 |
      | FlxWklyN |   20012024 |     130000 |
      | FlxWklyN |   20012024 |     140000 |
      | FlxWklyN |   20012024 |     190000 |
      | FlxWklyN |   21012024 |     080000 |
      | FlxWklyN |   21012024 |     130000 |
      | FlxWklyN |   21012024 |     140000 |
      | FlxWklyN |   21012024 |     190000 |
    When Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |        |
    When Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |        |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |        |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |        |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |        |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |        |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |        |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |        |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID   |
      | FlxWkly1 |
      | FlxWklyN |
    Then Daily Attendance View for userid "FlxWkly1" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                              |
    Then Daily Attendance View for userid "FlxWklyN" and period "Date" on "01/01/2024" and "21/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | 09:00      | 2nd Half AB:Target Shortfall |
      | 02/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 03/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 04/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 06/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 07/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 08/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 09/01/2024 | 15:00    | 19:00    | 1A       | 1A       | 03:00      |                              |
      | 10/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 11/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 12/01/2024 | 06:00    | 19:00    | PR       | PR       | 11:00      |                              |
      | 13/01/2024 | 05:00    | 19:00    | PR       | PR       | 12:00      |                              |
      | 14/01/2024 | 04:00    | 19:00    | WO       | WO       | 13:00      |                              |
      | 15/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 16/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 17/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 18/01/2024 | 08:00    | 19:00    | 1A       | 1A       | 09:00      |                              |
      | 19/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 20/01/2024 | 08:00    | 19:00    | PR       | PR       | 09:00      |                              |
      | 21/01/2024 | 08:00    | 19:00    | WO       | WO       | 09:00      |                              |
