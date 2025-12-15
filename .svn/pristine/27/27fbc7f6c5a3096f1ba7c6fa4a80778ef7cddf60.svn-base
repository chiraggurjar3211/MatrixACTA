@fleaxibleuser
Feature: Fleaxible User

  @TnA_Flexible_1
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  22000 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_2
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - No Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  22000 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     080000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     200000 |
      | FlxMnthly1 |   02012024 |     080000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     200000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     080000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     200000 |
      | FlxMnthly1 |   09012024 |     080000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     200000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     080000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     200000 |
      | FlxMnthly1 |   16012024 |     080000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     200000 |
      | FlxMnthly1 |   17012024 |     080000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     200000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     080000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     200000 |
      | FlxMnthlyN |   02012024 |     080000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     200000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     080000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     200000 |
      | FlxMnthlyN |   09012024 |     080000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     200000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     080000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     200000 |
      | FlxMnthlyN |   16012024 |     080000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     200000 |
      | FlxMnthlyN |   17012024 |     080000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     200000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 02/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 09/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 16/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 17/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 02/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 09/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 16/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 17/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 02/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |        |
      | 06/01/2024 |          |          | PR       | PR       |            |        |
      | 08/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 09/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |        |
      | 15/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 16/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 17/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |        |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 02/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |        |
      | 06/01/2024 |          |          | PR       | PR       |            |        |
      | 08/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 09/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 05:00      |        |
      | 15/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 16/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 17/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |        |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |        |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |

  @TnA_Flexible_3
  Scenario: TnA_Flexible - Monthly - From Shift Start - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  22000 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_4
  Scenario: TnA_Flexible - Monthly - Till Shift End - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  22000 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_5
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  22000 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_6
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | AB       | AB       | 07:50      | Full Day AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | AB       | AB       | 07:50      | Full Day AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_7
  Scenario: TnA_Flexible - Monthly - Till Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | AB       | AB       | 07:50      | Full Day AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | AB       | AB       | 07:50      | Full Day AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_8
  Scenario: TnA_Flexible - Monthly - From Shift Start - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | AB       | 07:50      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | AB       | 07:50      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_9
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs- Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | AB       | 07:50      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | AB       | 07:50      | 2nd Half AB:Target Shortfall |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | AB       | AB       | 07:40      | Full Day AB:Target Shortfall |
      | 26/01/2024 | 09:00    | 17:30    | AB       | AB       | 07:30      | Full Day AB:Target Shortfall |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_10
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs- Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - No Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01022024 |     080000 |
      | FlxMnthly1 |   01022024 |     130000 |
      | FlxMnthly1 |   01022024 |     140000 |
      | FlxMnthly1 |   01022024 |     230000 |
      | FlxMnthly1 |   02022024 |     070000 |
      | FlxMnthly1 |   02022024 |     130000 |
      | FlxMnthly1 |   02022024 |     140000 |
      | FlxMnthly1 |   02022024 |     230000 |
      | FlxMnthly1 |   03022024 |     070000 |
      | FlxMnthly1 |   03022024 |     130000 |
      | FlxMnthly1 |   03022024 |     140000 |
      | FlxMnthly1 |   03022024 |     230000 |
      | FlxMnthly1 |   04022024 |     093000 |
      | FlxMnthly1 |   04022024 |     130000 |
      | FlxMnthly1 |   04022024 |     140000 |
      | FlxMnthly1 |   04022024 |     180000 |
      | FlxMnthly1 |   05022024 |     090000 |
      | FlxMnthly1 |   05022024 |     130000 |
      | FlxMnthly1 |   05022024 |     140000 |
      | FlxMnthly1 |   05022024 |     173000 |
      | FlxMnthly1 |   06022024 |     080000 |
      | FlxMnthly1 |   06022024 |     130000 |
      | FlxMnthly1 |   06022024 |     140000 |
      | FlxMnthly1 |   06022024 |     180000 |
      | FlxMnthly1 |   07022024 |     090000 |
      | FlxMnthly1 |   07022024 |     130000 |
      | FlxMnthly1 |   07022024 |     140000 |
      | FlxMnthly1 |   07022024 |     173000 |
      | FlxMnthly1 |   08022024 |     083000 |
      | FlxMnthly1 |   08022024 |     130000 |
      | FlxMnthly1 |   08022024 |     140000 |
      | FlxMnthly1 |   08022024 |     180000 |
      | FlxMnthly1 |   09022024 |     093000 |
      | FlxMnthly1 |   09022024 |     130000 |
      | FlxMnthly1 |   09022024 |     140000 |
      | FlxMnthly1 |   09022024 |     183000 |
      | FlxMnthly1 |   11022024 |     080000 |
      | FlxMnthly1 |   11022024 |     130000 |
      | FlxMnthly1 |   11022024 |     140000 |
      | FlxMnthly1 |   11022024 |     163000 |
      | FlxMnthly1 |   12022024 |     090000 |
      | FlxMnthly1 |   12022024 |     130000 |
      | FlxMnthly1 |   12022024 |     140000 |
      | FlxMnthly1 |   12022024 |     180000 |
      | FlxMnthly1 |   13022024 |     083000 |
      | FlxMnthly1 |   13022024 |     130000 |
      | FlxMnthly1 |   13022024 |     140000 |
      | FlxMnthly1 |   13022024 |     181000 |
      | FlxMnthly1 |   14022024 |     093000 |
      | FlxMnthly1 |   14022024 |     130000 |
      | FlxMnthly1 |   14022024 |     140000 |
      | FlxMnthly1 |   14022024 |     182000 |
      | FlxMnthly1 |   15022024 |     090000 |
      | FlxMnthly1 |   15022024 |     130000 |
      | FlxMnthly1 |   15022024 |     140000 |
      | FlxMnthly1 |   15022024 |     175000 |
      | FlxMnthly1 |   16022024 |     080000 |
      | FlxMnthly1 |   16022024 |     130000 |
      | FlxMnthly1 |   16022024 |     140000 |
      | FlxMnthly1 |   16022024 |     180000 |
      | FlxMnthly1 |   18022024 |     083000 |
      | FlxMnthly1 |   18022024 |     130000 |
      | FlxMnthly1 |   18022024 |     140000 |
      | FlxMnthly1 |   18022024 |     180000 |
      | FlxMnthly1 |   19022024 |     093000 |
      | FlxMnthly1 |   19022024 |     130000 |
      | FlxMnthly1 |   19022024 |     140000 |
      | FlxMnthly1 |   19022024 |     180000 |
      | FlxMnthly1 |   20022024 |     070000 |
      | FlxMnthly1 |   20022024 |     130000 |
      | FlxMnthly1 |   20022024 |     140000 |
      | FlxMnthly1 |   20022024 |     230000 |
      | FlxMnthly1 |   21022024 |     080000 |
      | FlxMnthly1 |   21022024 |     130000 |
      | FlxMnthly1 |   21022024 |     140000 |
      | FlxMnthly1 |   21022024 |     180000 |
      | FlxMnthly1 |   22022024 |     070000 |
      | FlxMnthly1 |   22022024 |     130000 |
      | FlxMnthly1 |   22022024 |     140000 |
      | FlxMnthly1 |   22022024 |     230000 |
      | FlxMnthly1 |   23022024 |     083000 |
      | FlxMnthly1 |   23022024 |     130000 |
      | FlxMnthly1 |   23022024 |     140000 |
      | FlxMnthly1 |   23022024 |     180000 |
      | FlxMnthly1 |   24022024 |     070000 |
      | FlxMnthly1 |   24022024 |     130000 |
      | FlxMnthly1 |   24022024 |     140000 |
      | FlxMnthly1 |   24022024 |     230000 |
      | FlxMnthly1 |   25022024 |     090000 |
      | FlxMnthly1 |   25022024 |     130000 |
      | FlxMnthly1 |   25022024 |     140000 |
      | FlxMnthly1 |   25022024 |     180000 |
      | FlxMnthly1 |   26022024 |     080000 |
      | FlxMnthly1 |   26022024 |     130000 |
      | FlxMnthly1 |   26022024 |     140000 |
      | FlxMnthly1 |   26022024 |     180000 |
      | FlxMnthly1 |   27022024 |     090000 |
      | FlxMnthly1 |   27022024 |     130000 |
      | FlxMnthly1 |   27022024 |     140000 |
      | FlxMnthly1 |   27022024 |     180000 |
      | FlxMnthly1 |   28022024 |     083000 |
      | FlxMnthly1 |   28022024 |     130000 |
      | FlxMnthly1 |   28022024 |     140000 |
      | FlxMnthly1 |   28022024 |     180000 |
      | FlxMnthly1 |   29022024 |     070000 |
      | FlxMnthly1 |   29022024 |     130000 |
      | FlxMnthly1 |   29022024 |     140000 |
      | FlxMnthly1 |   29022024 |     230000 |
      | FlxMnthlyN |   01022024 |     080000 |
      | FlxMnthlyN |   01022024 |     130000 |
      | FlxMnthlyN |   01022024 |     140000 |
      | FlxMnthlyN |   01022024 |     230000 |
      | FlxMnthlyN |   02022024 |     070000 |
      | FlxMnthlyN |   02022024 |     130000 |
      | FlxMnthlyN |   02022024 |     140000 |
      | FlxMnthlyN |   02022024 |     230000 |
      | FlxMnthlyN |   03022024 |     070000 |
      | FlxMnthlyN |   03022024 |     130000 |
      | FlxMnthlyN |   03022024 |     140000 |
      | FlxMnthlyN |   03022024 |     230000 |
      | FlxMnthlyN |   04022024 |     093000 |
      | FlxMnthlyN |   04022024 |     130000 |
      | FlxMnthlyN |   04022024 |     140000 |
      | FlxMnthlyN |   04022024 |     180000 |
      | FlxMnthlyN |   05022024 |     090000 |
      | FlxMnthlyN |   05022024 |     130000 |
      | FlxMnthlyN |   05022024 |     140000 |
      | FlxMnthlyN |   05022024 |     173000 |
      | FlxMnthlyN |   06022024 |     080000 |
      | FlxMnthlyN |   06022024 |     130000 |
      | FlxMnthlyN |   06022024 |     140000 |
      | FlxMnthlyN |   06022024 |     180000 |
      | FlxMnthlyN |   07022024 |     090000 |
      | FlxMnthlyN |   07022024 |     130000 |
      | FlxMnthlyN |   07022024 |     140000 |
      | FlxMnthlyN |   07022024 |     173000 |
      | FlxMnthlyN |   08022024 |     083000 |
      | FlxMnthlyN |   08022024 |     130000 |
      | FlxMnthlyN |   08022024 |     140000 |
      | FlxMnthlyN |   08022024 |     180000 |
      | FlxMnthlyN |   09022024 |     093000 |
      | FlxMnthlyN |   09022024 |     130000 |
      | FlxMnthlyN |   09022024 |     140000 |
      | FlxMnthlyN |   09022024 |     183000 |
      | FlxMnthlyN |   11022024 |     080000 |
      | FlxMnthlyN |   11022024 |     130000 |
      | FlxMnthlyN |   11022024 |     140000 |
      | FlxMnthlyN |   11022024 |     163000 |
      | FlxMnthlyN |   12022024 |     090000 |
      | FlxMnthlyN |   12022024 |     130000 |
      | FlxMnthlyN |   12022024 |     140000 |
      | FlxMnthlyN |   12022024 |     180000 |
      | FlxMnthlyN |   13022024 |     083000 |
      | FlxMnthlyN |   13022024 |     130000 |
      | FlxMnthlyN |   13022024 |     140000 |
      | FlxMnthlyN |   13022024 |     181000 |
      | FlxMnthlyN |   14022024 |     093000 |
      | FlxMnthlyN |   14022024 |     130000 |
      | FlxMnthlyN |   14022024 |     140000 |
      | FlxMnthlyN |   14022024 |     182000 |
      | FlxMnthlyN |   15022024 |     090000 |
      | FlxMnthlyN |   15022024 |     130000 |
      | FlxMnthlyN |   15022024 |     140000 |
      | FlxMnthlyN |   15022024 |     175000 |
      | FlxMnthlyN |   16022024 |     080000 |
      | FlxMnthlyN |   16022024 |     130000 |
      | FlxMnthlyN |   16022024 |     140000 |
      | FlxMnthlyN |   16022024 |     180000 |
      | FlxMnthlyN |   18022024 |     083000 |
      | FlxMnthlyN |   18022024 |     130000 |
      | FlxMnthlyN |   18022024 |     140000 |
      | FlxMnthlyN |   18022024 |     180000 |
      | FlxMnthlyN |   19022024 |     093000 |
      | FlxMnthlyN |   19022024 |     130000 |
      | FlxMnthlyN |   19022024 |     140000 |
      | FlxMnthlyN |   19022024 |     180000 |
      | FlxMnthlyN |   20022024 |     070000 |
      | FlxMnthlyN |   20022024 |     130000 |
      | FlxMnthlyN |   20022024 |     140000 |
      | FlxMnthlyN |   20022024 |     230000 |
      | FlxMnthlyN |   21022024 |     080000 |
      | FlxMnthlyN |   21022024 |     130000 |
      | FlxMnthlyN |   21022024 |     140000 |
      | FlxMnthlyN |   21022024 |     180000 |
      | FlxMnthlyN |   22022024 |     070000 |
      | FlxMnthlyN |   22022024 |     130000 |
      | FlxMnthlyN |   22022024 |     140000 |
      | FlxMnthlyN |   22022024 |     230000 |
      | FlxMnthlyN |   23022024 |     083000 |
      | FlxMnthlyN |   23022024 |     130000 |
      | FlxMnthlyN |   23022024 |     140000 |
      | FlxMnthlyN |   23022024 |     180000 |
      | FlxMnthlyN |   24022024 |     070000 |
      | FlxMnthlyN |   24022024 |     130000 |
      | FlxMnthlyN |   24022024 |     140000 |
      | FlxMnthlyN |   24022024 |     230000 |
      | FlxMnthlyN |   25022024 |     090000 |
      | FlxMnthlyN |   25022024 |     130000 |
      | FlxMnthlyN |   25022024 |     140000 |
      | FlxMnthlyN |   25022024 |     180000 |
      | FlxMnthlyN |   26022024 |     080000 |
      | FlxMnthlyN |   26022024 |     130000 |
      | FlxMnthlyN |   26022024 |     140000 |
      | FlxMnthlyN |   26022024 |     180000 |
      | FlxMnthlyN |   27022024 |     090000 |
      | FlxMnthlyN |   27022024 |     130000 |
      | FlxMnthlyN |   27022024 |     140000 |
      | FlxMnthlyN |   27022024 |     180000 |
      | FlxMnthlyN |   28022024 |     083000 |
      | FlxMnthlyN |   28022024 |     130000 |
      | FlxMnthlyN |   28022024 |     140000 |
      | FlxMnthlyN |   28022024 |     180000 |
      | FlxMnthlyN |   29022024 |     070000 |
      | FlxMnthlyN |   29022024 |     130000 |
      | FlxMnthlyN |   29022024 |     140000 |
      | FlxMnthlyN |   29022024 |     230000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                      |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 06/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 08/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 09/02/2024 | 09:30    | 18:30    | PR       | PR       | 08:00      |                      |
      | 10/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |                      |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:40      |                      |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |                      |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                      |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 17/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |                      |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                      |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |                      |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                      |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 06/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 08/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 09/02/2024 | 09:30    | 18:30    | PR       | PR       | 08:00      |                      |
      | 10/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |                      |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:40      |                      |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |                      |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                      |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 17/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |                      |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                      |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |        |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 09/02/2024 | 09:30    | 18:30    | PR       | PR       | 08:00      |        |
      | 10/02/2024 |          |          | PR       | PR       |            |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |        |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:40      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |        |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |        |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 17/02/2024 |          |          | PR       | PR       |            |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 14:00      |        |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 09/02/2024 | 09:30    | 18:30    | PR       | PR       | 08:00      |        |
      | 10/02/2024 |          |          | PR       | PR       |            |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |        |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:40      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |        |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |        |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 17/02/2024 |          |          | PR       | PR       |            |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 15:00      |        |

  @TnA_Flexible_11
  Scenario: TnA_Flexible - Monthly - From Shift Start - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - No Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01022024 |     080000 |
      | FlxMnthly1 |   01022024 |     130000 |
      | FlxMnthly1 |   01022024 |     140000 |
      | FlxMnthly1 |   01022024 |     230000 |
      | FlxMnthly1 |   02022024 |     070000 |
      | FlxMnthly1 |   02022024 |     130000 |
      | FlxMnthly1 |   02022024 |     140000 |
      | FlxMnthly1 |   02022024 |     230000 |
      | FlxMnthly1 |   03022024 |     070000 |
      | FlxMnthly1 |   03022024 |     130000 |
      | FlxMnthly1 |   03022024 |     140000 |
      | FlxMnthly1 |   03022024 |     230000 |
      | FlxMnthly1 |   04022024 |     093000 |
      | FlxMnthly1 |   04022024 |     130000 |
      | FlxMnthly1 |   04022024 |     140000 |
      | FlxMnthly1 |   04022024 |     180000 |
      | FlxMnthly1 |   05022024 |     090000 |
      | FlxMnthly1 |   05022024 |     130000 |
      | FlxMnthly1 |   05022024 |     140000 |
      | FlxMnthly1 |   05022024 |     173000 |
      | FlxMnthly1 |   06022024 |     070000 |
      | FlxMnthly1 |   06022024 |     130000 |
      | FlxMnthly1 |   06022024 |     140000 |
      | FlxMnthly1 |   06022024 |     230000 |
      | FlxMnthly1 |   07022024 |     090000 |
      | FlxMnthly1 |   07022024 |     130000 |
      | FlxMnthly1 |   07022024 |     140000 |
      | FlxMnthly1 |   07022024 |     173000 |
      | FlxMnthly1 |   08022024 |     083000 |
      | FlxMnthly1 |   08022024 |     130000 |
      | FlxMnthly1 |   08022024 |     140000 |
      | FlxMnthly1 |   08022024 |     230000 |
      | FlxMnthly1 |   09022024 |     093000 |
      | FlxMnthly1 |   09022024 |     130000 |
      | FlxMnthly1 |   09022024 |     140000 |
      | FlxMnthly1 |   09022024 |     233000 |
      | FlxMnthly1 |   10022024 |     070000 |
      | FlxMnthly1 |   10022024 |     130000 |
      | FlxMnthly1 |   10022024 |     140000 |
      | FlxMnthly1 |   10022024 |     170000 |
      | FlxMnthly1 |   11022024 |     080000 |
      | FlxMnthly1 |   11022024 |     130000 |
      | FlxMnthly1 |   11022024 |     140000 |
      | FlxMnthly1 |   11022024 |     163000 |
      | FlxMnthly1 |   12022024 |     090000 |
      | FlxMnthly1 |   12022024 |     130000 |
      | FlxMnthly1 |   12022024 |     140000 |
      | FlxMnthly1 |   12022024 |     180000 |
      | FlxMnthly1 |   13022024 |     083000 |
      | FlxMnthly1 |   13022024 |     130000 |
      | FlxMnthly1 |   13022024 |     140000 |
      | FlxMnthly1 |   13022024 |     181000 |
      | FlxMnthly1 |   14022024 |     093000 |
      | FlxMnthly1 |   14022024 |     130000 |
      | FlxMnthly1 |   14022024 |     140000 |
      | FlxMnthly1 |   14022024 |     182000 |
      | FlxMnthly1 |   15022024 |     090000 |
      | FlxMnthly1 |   15022024 |     130000 |
      | FlxMnthly1 |   15022024 |     140000 |
      | FlxMnthly1 |   15022024 |     175000 |
      | FlxMnthly1 |   16022024 |     080000 |
      | FlxMnthly1 |   16022024 |     130000 |
      | FlxMnthly1 |   16022024 |     140000 |
      | FlxMnthly1 |   16022024 |     180000 |
      | FlxMnthly1 |   17022024 |     070000 |
      | FlxMnthly1 |   17022024 |     130000 |
      | FlxMnthly1 |   17022024 |     140000 |
      | FlxMnthly1 |   17022024 |     170000 |
      | FlxMnthly1 |   18022024 |     083000 |
      | FlxMnthly1 |   18022024 |     130000 |
      | FlxMnthly1 |   18022024 |     140000 |
      | FlxMnthly1 |   18022024 |     180000 |
      | FlxMnthly1 |   19022024 |     093000 |
      | FlxMnthly1 |   19022024 |     130000 |
      | FlxMnthly1 |   19022024 |     140000 |
      | FlxMnthly1 |   19022024 |     180000 |
      | FlxMnthly1 |   20022024 |     070000 |
      | FlxMnthly1 |   20022024 |     130000 |
      | FlxMnthly1 |   20022024 |     140000 |
      | FlxMnthly1 |   20022024 |     230000 |
      | FlxMnthly1 |   21022024 |     080000 |
      | FlxMnthly1 |   21022024 |     130000 |
      | FlxMnthly1 |   21022024 |     140000 |
      | FlxMnthly1 |   21022024 |     180000 |
      | FlxMnthly1 |   22022024 |     070000 |
      | FlxMnthly1 |   22022024 |     130000 |
      | FlxMnthly1 |   22022024 |     140000 |
      | FlxMnthly1 |   22022024 |     230000 |
      | FlxMnthly1 |   23022024 |     083000 |
      | FlxMnthly1 |   23022024 |     130000 |
      | FlxMnthly1 |   23022024 |     140000 |
      | FlxMnthly1 |   23022024 |     180000 |
      | FlxMnthly1 |   24022024 |     070000 |
      | FlxMnthly1 |   24022024 |     130000 |
      | FlxMnthly1 |   24022024 |     140000 |
      | FlxMnthly1 |   24022024 |     230000 |
      | FlxMnthly1 |   25022024 |     090000 |
      | FlxMnthly1 |   25022024 |     130000 |
      | FlxMnthly1 |   25022024 |     140000 |
      | FlxMnthly1 |   25022024 |     180000 |
      | FlxMnthly1 |   26022024 |     080000 |
      | FlxMnthly1 |   26022024 |     130000 |
      | FlxMnthly1 |   26022024 |     140000 |
      | FlxMnthly1 |   26022024 |     180000 |
      | FlxMnthly1 |   27022024 |     090000 |
      | FlxMnthly1 |   27022024 |     130000 |
      | FlxMnthly1 |   27022024 |     140000 |
      | FlxMnthly1 |   27022024 |     180000 |
      | FlxMnthly1 |   28022024 |     083000 |
      | FlxMnthly1 |   28022024 |     130000 |
      | FlxMnthly1 |   28022024 |     140000 |
      | FlxMnthly1 |   28022024 |     180000 |
      | FlxMnthly1 |   29022024 |     070000 |
      | FlxMnthly1 |   29022024 |     130000 |
      | FlxMnthly1 |   29022024 |     140000 |
      | FlxMnthly1 |   29022024 |     230000 |
      | FlxMnthlyN |   01022024 |     080000 |
      | FlxMnthlyN |   01022024 |     130000 |
      | FlxMnthlyN |   01022024 |     140000 |
      | FlxMnthlyN |   01022024 |     230000 |
      | FlxMnthlyN |   02022024 |     070000 |
      | FlxMnthlyN |   02022024 |     130000 |
      | FlxMnthlyN |   02022024 |     140000 |
      | FlxMnthlyN |   02022024 |     230000 |
      | FlxMnthlyN |   03022024 |     070000 |
      | FlxMnthlyN |   03022024 |     130000 |
      | FlxMnthlyN |   03022024 |     140000 |
      | FlxMnthlyN |   03022024 |     230000 |
      | FlxMnthlyN |   04022024 |     093000 |
      | FlxMnthlyN |   04022024 |     130000 |
      | FlxMnthlyN |   04022024 |     140000 |
      | FlxMnthlyN |   04022024 |     180000 |
      | FlxMnthlyN |   05022024 |     090000 |
      | FlxMnthlyN |   05022024 |     130000 |
      | FlxMnthlyN |   05022024 |     140000 |
      | FlxMnthlyN |   05022024 |     173000 |
      | FlxMnthlyN |   06022024 |     070000 |
      | FlxMnthlyN |   06022024 |     130000 |
      | FlxMnthlyN |   06022024 |     140000 |
      | FlxMnthlyN |   06022024 |     230000 |
      | FlxMnthlyN |   07022024 |     090000 |
      | FlxMnthlyN |   07022024 |     130000 |
      | FlxMnthlyN |   07022024 |     140000 |
      | FlxMnthlyN |   07022024 |     173000 |
      | FlxMnthlyN |   08022024 |     083000 |
      | FlxMnthlyN |   08022024 |     130000 |
      | FlxMnthlyN |   08022024 |     140000 |
      | FlxMnthlyN |   08022024 |     230000 |
      | FlxMnthlyN |   09022024 |     093000 |
      | FlxMnthlyN |   09022024 |     130000 |
      | FlxMnthlyN |   09022024 |     140000 |
      | FlxMnthlyN |   09022024 |     233000 |
      | FlxMnthlyN |   10022024 |     070000 |
      | FlxMnthlyN |   10022024 |     130000 |
      | FlxMnthlyN |   10022024 |     140000 |
      | FlxMnthlyN |   10022024 |     170000 |
      | FlxMnthlyN |   11022024 |     080000 |
      | FlxMnthlyN |   11022024 |     130000 |
      | FlxMnthlyN |   11022024 |     140000 |
      | FlxMnthlyN |   11022024 |     163000 |
      | FlxMnthlyN |   12022024 |     090000 |
      | FlxMnthlyN |   12022024 |     130000 |
      | FlxMnthlyN |   12022024 |     140000 |
      | FlxMnthlyN |   12022024 |     180000 |
      | FlxMnthlyN |   13022024 |     083000 |
      | FlxMnthlyN |   13022024 |     130000 |
      | FlxMnthlyN |   13022024 |     140000 |
      | FlxMnthlyN |   13022024 |     181000 |
      | FlxMnthlyN |   14022024 |     093000 |
      | FlxMnthlyN |   14022024 |     130000 |
      | FlxMnthlyN |   14022024 |     140000 |
      | FlxMnthlyN |   14022024 |     182000 |
      | FlxMnthlyN |   15022024 |     090000 |
      | FlxMnthlyN |   15022024 |     130000 |
      | FlxMnthlyN |   15022024 |     140000 |
      | FlxMnthlyN |   15022024 |     175000 |
      | FlxMnthlyN |   16022024 |     080000 |
      | FlxMnthlyN |   16022024 |     130000 |
      | FlxMnthlyN |   16022024 |     140000 |
      | FlxMnthlyN |   16022024 |     180000 |
      | FlxMnthlyN |   17022024 |     070000 |
      | FlxMnthlyN |   17022024 |     130000 |
      | FlxMnthlyN |   17022024 |     140000 |
      | FlxMnthlyN |   17022024 |     170000 |
      | FlxMnthlyN |   18022024 |     083000 |
      | FlxMnthlyN |   18022024 |     130000 |
      | FlxMnthlyN |   18022024 |     140000 |
      | FlxMnthlyN |   18022024 |     180000 |
      | FlxMnthlyN |   19022024 |     093000 |
      | FlxMnthlyN |   19022024 |     130000 |
      | FlxMnthlyN |   19022024 |     140000 |
      | FlxMnthlyN |   19022024 |     180000 |
      | FlxMnthlyN |   20022024 |     070000 |
      | FlxMnthlyN |   20022024 |     130000 |
      | FlxMnthlyN |   20022024 |     140000 |
      | FlxMnthlyN |   20022024 |     230000 |
      | FlxMnthlyN |   21022024 |     080000 |
      | FlxMnthlyN |   21022024 |     130000 |
      | FlxMnthlyN |   21022024 |     140000 |
      | FlxMnthlyN |   21022024 |     180000 |
      | FlxMnthlyN |   22022024 |     070000 |
      | FlxMnthlyN |   22022024 |     130000 |
      | FlxMnthlyN |   22022024 |     140000 |
      | FlxMnthlyN |   22022024 |     230000 |
      | FlxMnthlyN |   23022024 |     083000 |
      | FlxMnthlyN |   23022024 |     130000 |
      | FlxMnthlyN |   23022024 |     140000 |
      | FlxMnthlyN |   23022024 |     180000 |
      | FlxMnthlyN |   24022024 |     070000 |
      | FlxMnthlyN |   24022024 |     130000 |
      | FlxMnthlyN |   24022024 |     140000 |
      | FlxMnthlyN |   24022024 |     230000 |
      | FlxMnthlyN |   25022024 |     090000 |
      | FlxMnthlyN |   25022024 |     130000 |
      | FlxMnthlyN |   25022024 |     140000 |
      | FlxMnthlyN |   25022024 |     180000 |
      | FlxMnthlyN |   26022024 |     080000 |
      | FlxMnthlyN |   26022024 |     130000 |
      | FlxMnthlyN |   26022024 |     140000 |
      | FlxMnthlyN |   26022024 |     180000 |
      | FlxMnthlyN |   27022024 |     090000 |
      | FlxMnthlyN |   27022024 |     130000 |
      | FlxMnthlyN |   27022024 |     140000 |
      | FlxMnthlyN |   27022024 |     180000 |
      | FlxMnthlyN |   28022024 |     083000 |
      | FlxMnthlyN |   28022024 |     130000 |
      | FlxMnthlyN |   28022024 |     140000 |
      | FlxMnthlyN |   28022024 |     180000 |
      | FlxMnthlyN |   29022024 |     070000 |
      | FlxMnthlyN |   29022024 |     130000 |
      | FlxMnthlyN |   29022024 |     140000 |
      | FlxMnthlyN |   29022024 |     230000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                  |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 13:00      |                  |
      | 09/02/2024 | 09:30    | 23:30    | PR       | PR       | 13:00      |                  |
      | 10/02/2024 | 07:00    | 17:00    | PR       | AB       | 07:00      | AB:Less Work Hrs |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |                  |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:10      |                  |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |                  |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                  |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 17/02/2024 | 07:00    | 17:00    | PR       | AB       | 07:00      | AB:Less Work Hrs |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |                  |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                  |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |                  |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                  |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |                  |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                  |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 06/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                  |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 13:00      |                  |
      | 09/02/2024 | 09:30    | 23:30    | PR       | PR       | 13:00      |                  |
      | 10/02/2024 | 07:00    | 17:00    | PR       | AB       | 07:00      | AB:Less Work Hrs |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |                  |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:10      |                  |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |                  |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |                  |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 17/02/2024 | 07:00    | 17:00    | PR       | AB       | 07:00      | AB:Less Work Hrs |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |                  |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                  |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |                  |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                  |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                  |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |                  |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |                  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 13:00      |        |
      | 09/02/2024 | 09:30    | 23:30    | PR       | PR       | 13:00      |        |
      | 10/02/2024 | 07:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |        |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:10      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |        |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |        |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 17/02/2024 | 07:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 08:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 02/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 03/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 13:00      |        |
      | 09/02/2024 | 09:30    | 23:30    | PR       | PR       | 13:00      |        |
      | 10/02/2024 | 07:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |        |
      | 12/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/02/2024 | 08:30    | 18:10    | PR       | PR       | 08:10      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:50      |        |
      | 15/02/2024 | 09:00    | 17:50    | PR       | PR       | 07:50      |        |
      | 16/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 17/02/2024 | 07:00    | 17:00    | PR       | PR       | 07:00      |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 27/02/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 13:00      |        |

  @TnA_Flexible_12
  Scenario: TnA_Flexible - Monthly - Till Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - No Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01022024 |     060000 |
      | FlxMnthly1 |   01022024 |     130000 |
      | FlxMnthly1 |   01022024 |     140000 |
      | FlxMnthly1 |   01022024 |     230000 |
      | FlxMnthly1 |   02022024 |     060000 |
      | FlxMnthly1 |   02022024 |     130000 |
      | FlxMnthly1 |   02022024 |     140000 |
      | FlxMnthly1 |   02022024 |     230000 |
      | FlxMnthly1 |   03022024 |     060000 |
      | FlxMnthly1 |   03022024 |     130000 |
      | FlxMnthly1 |   03022024 |     140000 |
      | FlxMnthly1 |   03022024 |     230000 |
      | FlxMnthly1 |   04022024 |     093000 |
      | FlxMnthly1 |   04022024 |     130000 |
      | FlxMnthly1 |   04022024 |     140000 |
      | FlxMnthly1 |   04022024 |     180000 |
      | FlxMnthly1 |   05022024 |     090000 |
      | FlxMnthly1 |   05022024 |     130000 |
      | FlxMnthly1 |   05022024 |     140000 |
      | FlxMnthly1 |   05022024 |     173000 |
      | FlxMnthly1 |   06022024 |     050000 |
      | FlxMnthly1 |   06022024 |     130000 |
      | FlxMnthly1 |   06022024 |     140000 |
      | FlxMnthly1 |   06022024 |     230000 |
      | FlxMnthly1 |   07022024 |     090000 |
      | FlxMnthly1 |   07022024 |     130000 |
      | FlxMnthly1 |   07022024 |     140000 |
      | FlxMnthly1 |   07022024 |     173000 |
      | FlxMnthly1 |   08022024 |     083000 |
      | FlxMnthly1 |   08022024 |     130000 |
      | FlxMnthly1 |   08022024 |     140000 |
      | FlxMnthly1 |   08022024 |     230000 |
      | FlxMnthly1 |   10022024 |     070000 |
      | FlxMnthly1 |   10022024 |     130000 |
      | FlxMnthly1 |   10022024 |     140000 |
      | FlxMnthly1 |   10022024 |     170000 |
      | FlxMnthly1 |   11022024 |     080000 |
      | FlxMnthly1 |   11022024 |     130000 |
      | FlxMnthly1 |   11022024 |     140000 |
      | FlxMnthly1 |   11022024 |     163000 |
      | FlxMnthly1 |   12022024 |     050000 |
      | FlxMnthly1 |   12022024 |     130000 |
      | FlxMnthly1 |   12022024 |     140000 |
      | FlxMnthly1 |   12022024 |     180000 |
      | FlxMnthly1 |   13022024 |     050000 |
      | FlxMnthly1 |   13022024 |     130000 |
      | FlxMnthly1 |   13022024 |     140000 |
      | FlxMnthly1 |   13022024 |     181000 |
      | FlxMnthly1 |   14022024 |     093000 |
      | FlxMnthly1 |   14022024 |     130000 |
      | FlxMnthly1 |   14022024 |     140000 |
      | FlxMnthly1 |   14022024 |     182000 |
      | FlxMnthly1 |   15022024 |     050000 |
      | FlxMnthly1 |   15022024 |     130000 |
      | FlxMnthly1 |   15022024 |     140000 |
      | FlxMnthly1 |   15022024 |     175000 |
      | FlxMnthly1 |   16022024 |     050000 |
      | FlxMnthly1 |   16022024 |     130000 |
      | FlxMnthly1 |   16022024 |     140000 |
      | FlxMnthly1 |   16022024 |     180000 |
      | FlxMnthly1 |   17022024 |     070000 |
      | FlxMnthly1 |   17022024 |     130000 |
      | FlxMnthly1 |   17022024 |     140000 |
      | FlxMnthly1 |   17022024 |     170000 |
      | FlxMnthly1 |   18022024 |     083000 |
      | FlxMnthly1 |   18022024 |     130000 |
      | FlxMnthly1 |   18022024 |     140000 |
      | FlxMnthly1 |   18022024 |     180000 |
      | FlxMnthly1 |   19022024 |     093000 |
      | FlxMnthly1 |   19022024 |     130000 |
      | FlxMnthly1 |   19022024 |     140000 |
      | FlxMnthly1 |   19022024 |     180000 |
      | FlxMnthly1 |   20022024 |     070000 |
      | FlxMnthly1 |   20022024 |     130000 |
      | FlxMnthly1 |   20022024 |     140000 |
      | FlxMnthly1 |   20022024 |     230000 |
      | FlxMnthly1 |   21022024 |     080000 |
      | FlxMnthly1 |   21022024 |     130000 |
      | FlxMnthly1 |   21022024 |     140000 |
      | FlxMnthly1 |   21022024 |     180000 |
      | FlxMnthly1 |   22022024 |     070000 |
      | FlxMnthly1 |   22022024 |     130000 |
      | FlxMnthly1 |   22022024 |     140000 |
      | FlxMnthly1 |   22022024 |     230000 |
      | FlxMnthly1 |   23022024 |     083000 |
      | FlxMnthly1 |   23022024 |     130000 |
      | FlxMnthly1 |   23022024 |     140000 |
      | FlxMnthly1 |   23022024 |     180000 |
      | FlxMnthly1 |   24022024 |     070000 |
      | FlxMnthly1 |   24022024 |     130000 |
      | FlxMnthly1 |   24022024 |     140000 |
      | FlxMnthly1 |   24022024 |     230000 |
      | FlxMnthly1 |   25022024 |     090000 |
      | FlxMnthly1 |   25022024 |     130000 |
      | FlxMnthly1 |   25022024 |     140000 |
      | FlxMnthly1 |   25022024 |     180000 |
      | FlxMnthly1 |   26022024 |     060000 |
      | FlxMnthly1 |   26022024 |     130000 |
      | FlxMnthly1 |   26022024 |     140000 |
      | FlxMnthly1 |   26022024 |     180000 |
      | FlxMnthly1 |   27022024 |     060000 |
      | FlxMnthly1 |   27022024 |     130000 |
      | FlxMnthly1 |   27022024 |     140000 |
      | FlxMnthly1 |   27022024 |     180000 |
      | FlxMnthly1 |   28022024 |     060000 |
      | FlxMnthly1 |   28022024 |     130000 |
      | FlxMnthly1 |   28022024 |     140000 |
      | FlxMnthly1 |   28022024 |     180000 |
      | FlxMnthly1 |   29022024 |     070000 |
      | FlxMnthly1 |   29022024 |     130000 |
      | FlxMnthly1 |   29022024 |     140000 |
      | FlxMnthly1 |   29022024 |     230000 |
      | FlxMnthlyN |   01022024 |     060000 |
      | FlxMnthlyN |   01022024 |     130000 |
      | FlxMnthlyN |   01022024 |     140000 |
      | FlxMnthlyN |   01022024 |     230000 |
      | FlxMnthlyN |   02022024 |     060000 |
      | FlxMnthlyN |   02022024 |     130000 |
      | FlxMnthlyN |   02022024 |     140000 |
      | FlxMnthlyN |   02022024 |     230000 |
      | FlxMnthlyN |   03022024 |     060000 |
      | FlxMnthlyN |   03022024 |     130000 |
      | FlxMnthlyN |   03022024 |     140000 |
      | FlxMnthlyN |   03022024 |     230000 |
      | FlxMnthlyN |   04022024 |     093000 |
      | FlxMnthlyN |   04022024 |     130000 |
      | FlxMnthlyN |   04022024 |     140000 |
      | FlxMnthlyN |   04022024 |     180000 |
      | FlxMnthlyN |   05022024 |     090000 |
      | FlxMnthlyN |   05022024 |     130000 |
      | FlxMnthlyN |   05022024 |     140000 |
      | FlxMnthlyN |   05022024 |     173000 |
      | FlxMnthlyN |   06022024 |     050000 |
      | FlxMnthlyN |   06022024 |     130000 |
      | FlxMnthlyN |   06022024 |     140000 |
      | FlxMnthlyN |   06022024 |     230000 |
      | FlxMnthlyN |   07022024 |     090000 |
      | FlxMnthlyN |   07022024 |     130000 |
      | FlxMnthlyN |   07022024 |     140000 |
      | FlxMnthlyN |   07022024 |     173000 |
      | FlxMnthlyN |   08022024 |     083000 |
      | FlxMnthlyN |   08022024 |     130000 |
      | FlxMnthlyN |   08022024 |     140000 |
      | FlxMnthlyN |   08022024 |     230000 |
      | FlxMnthlyN |   10022024 |     070000 |
      | FlxMnthlyN |   10022024 |     130000 |
      | FlxMnthlyN |   10022024 |     140000 |
      | FlxMnthlyN |   10022024 |     170000 |
      | FlxMnthlyN |   11022024 |     080000 |
      | FlxMnthlyN |   11022024 |     130000 |
      | FlxMnthlyN |   11022024 |     140000 |
      | FlxMnthlyN |   11022024 |     163000 |
      | FlxMnthlyN |   12022024 |     050000 |
      | FlxMnthlyN |   12022024 |     130000 |
      | FlxMnthlyN |   12022024 |     140000 |
      | FlxMnthlyN |   12022024 |     180000 |
      | FlxMnthlyN |   13022024 |     050000 |
      | FlxMnthlyN |   13022024 |     130000 |
      | FlxMnthlyN |   13022024 |     140000 |
      | FlxMnthlyN |   13022024 |     181000 |
      | FlxMnthlyN |   14022024 |     093000 |
      | FlxMnthlyN |   14022024 |     130000 |
      | FlxMnthlyN |   14022024 |     140000 |
      | FlxMnthlyN |   14022024 |     182000 |
      | FlxMnthlyN |   15022024 |     050000 |
      | FlxMnthlyN |   15022024 |     130000 |
      | FlxMnthlyN |   15022024 |     140000 |
      | FlxMnthlyN |   15022024 |     175000 |
      | FlxMnthlyN |   16022024 |     050000 |
      | FlxMnthlyN |   16022024 |     130000 |
      | FlxMnthlyN |   16022024 |     140000 |
      | FlxMnthlyN |   16022024 |     180000 |
      | FlxMnthlyN |   17022024 |     070000 |
      | FlxMnthlyN |   17022024 |     130000 |
      | FlxMnthlyN |   17022024 |     140000 |
      | FlxMnthlyN |   17022024 |     170000 |
      | FlxMnthlyN |   18022024 |     083000 |
      | FlxMnthlyN |   18022024 |     130000 |
      | FlxMnthlyN |   18022024 |     140000 |
      | FlxMnthlyN |   18022024 |     180000 |
      | FlxMnthlyN |   19022024 |     093000 |
      | FlxMnthlyN |   19022024 |     130000 |
      | FlxMnthlyN |   19022024 |     140000 |
      | FlxMnthlyN |   19022024 |     180000 |
      | FlxMnthlyN |   20022024 |     070000 |
      | FlxMnthlyN |   20022024 |     130000 |
      | FlxMnthlyN |   20022024 |     140000 |
      | FlxMnthlyN |   20022024 |     230000 |
      | FlxMnthlyN |   21022024 |     080000 |
      | FlxMnthlyN |   21022024 |     130000 |
      | FlxMnthlyN |   21022024 |     140000 |
      | FlxMnthlyN |   21022024 |     180000 |
      | FlxMnthlyN |   22022024 |     070000 |
      | FlxMnthlyN |   22022024 |     130000 |
      | FlxMnthlyN |   22022024 |     140000 |
      | FlxMnthlyN |   22022024 |     230000 |
      | FlxMnthlyN |   23022024 |     083000 |
      | FlxMnthlyN |   23022024 |     130000 |
      | FlxMnthlyN |   23022024 |     140000 |
      | FlxMnthlyN |   23022024 |     180000 |
      | FlxMnthlyN |   24022024 |     070000 |
      | FlxMnthlyN |   24022024 |     130000 |
      | FlxMnthlyN |   24022024 |     140000 |
      | FlxMnthlyN |   24022024 |     230000 |
      | FlxMnthlyN |   25022024 |     090000 |
      | FlxMnthlyN |   25022024 |     130000 |
      | FlxMnthlyN |   25022024 |     140000 |
      | FlxMnthlyN |   25022024 |     180000 |
      | FlxMnthlyN |   26022024 |     060000 |
      | FlxMnthlyN |   26022024 |     130000 |
      | FlxMnthlyN |   26022024 |     140000 |
      | FlxMnthlyN |   26022024 |     180000 |
      | FlxMnthlyN |   27022024 |     060000 |
      | FlxMnthlyN |   27022024 |     130000 |
      | FlxMnthlyN |   27022024 |     140000 |
      | FlxMnthlyN |   27022024 |     180000 |
      | FlxMnthlyN |   28022024 |     060000 |
      | FlxMnthlyN |   28022024 |     130000 |
      | FlxMnthlyN |   28022024 |     140000 |
      | FlxMnthlyN |   28022024 |     180000 |
      | FlxMnthlyN |   29022024 |     070000 |
      | FlxMnthlyN |   29022024 |     130000 |
      | FlxMnthlyN |   29022024 |     140000 |
      | FlxMnthlyN |   29022024 |     230000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |                      |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |                      |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |                      |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                      |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 12:00      |                      |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:30      |                      |
      | 09/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 10/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |                      |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |                      |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |                      |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 12:00      |                      |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |                      |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 11:50      |                      |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |                      |
      | 17/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |                      |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |                      |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                      |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |                      |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |                      |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |                      |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |                      |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |                      |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |                      |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                      |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 12:00      |                      |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:30      |                      |
      | 09/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 10/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |                      |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |                      |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |                      |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 12:00      |                      |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |                      |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 11:50      |                      |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |                      |
      | 17/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |                      |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |                      |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |                      |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |                      |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                      |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |                      |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |                      |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |                      |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |        |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |        |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 12:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:30      |        |
      | 09/02/2024 |          |          | PR       | PR       |            |        |
      | 10/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |        |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |        |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 12:00      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |        |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 11:50      |        |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |        |
      | 17/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |        |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |        |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |        |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |        |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 11:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 12:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:30      |        |
      | 09/02/2024 |          |          | PR       | PR       |            |        |
      | 10/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 07:30      |        |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |        |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 12:00      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |        |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 11:50      |        |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 12:00      |        |
      | 17/02/2024 | 07:00    | 17:00    | PR       | PR       | 09:00      |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:30      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 09:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:30      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |        |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |        |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 11:00      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 10:00      |        |

  @TnA_Flexible_13
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00 - No Shortfall Case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0600 | False    | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01022024 |     060000 |
      | FlxMnthly1 |   01022024 |     130000 |
      | FlxMnthly1 |   01022024 |     140000 |
      | FlxMnthly1 |   01022024 |     230000 |
      | FlxMnthly1 |   02022024 |     060000 |
      | FlxMnthly1 |   02022024 |     130000 |
      | FlxMnthly1 |   02022024 |     140000 |
      | FlxMnthly1 |   02022024 |     230000 |
      | FlxMnthly1 |   03022024 |     060000 |
      | FlxMnthly1 |   03022024 |     130000 |
      | FlxMnthly1 |   03022024 |     140000 |
      | FlxMnthly1 |   03022024 |     230000 |
      | FlxMnthly1 |   04022024 |     093000 |
      | FlxMnthly1 |   04022024 |     130000 |
      | FlxMnthly1 |   04022024 |     140000 |
      | FlxMnthly1 |   04022024 |     180000 |
      | FlxMnthly1 |   05022024 |     090000 |
      | FlxMnthly1 |   05022024 |     130000 |
      | FlxMnthly1 |   05022024 |     140000 |
      | FlxMnthly1 |   05022024 |     173000 |
      | FlxMnthly1 |   06022024 |     050000 |
      | FlxMnthly1 |   06022024 |     130000 |
      | FlxMnthly1 |   06022024 |     140000 |
      | FlxMnthly1 |   06022024 |     230000 |
      | FlxMnthly1 |   07022024 |     090000 |
      | FlxMnthly1 |   07022024 |     130000 |
      | FlxMnthly1 |   07022024 |     140000 |
      | FlxMnthly1 |   07022024 |     173000 |
      | FlxMnthly1 |   08022024 |     083000 |
      | FlxMnthly1 |   08022024 |     130000 |
      | FlxMnthly1 |   08022024 |     140000 |
      | FlxMnthly1 |   08022024 |     230000 |
      | FlxMnthly1 |   10022024 |     070000 |
      | FlxMnthly1 |   10022024 |     130000 |
      | FlxMnthly1 |   10022024 |     140000 |
      | FlxMnthly1 |   10022024 |     180000 |
      | FlxMnthly1 |   11022024 |     080000 |
      | FlxMnthly1 |   11022024 |     130000 |
      | FlxMnthly1 |   11022024 |     140000 |
      | FlxMnthly1 |   11022024 |     163000 |
      | FlxMnthly1 |   12022024 |     050000 |
      | FlxMnthly1 |   12022024 |     130000 |
      | FlxMnthly1 |   12022024 |     140000 |
      | FlxMnthly1 |   12022024 |     180000 |
      | FlxMnthly1 |   13022024 |     050000 |
      | FlxMnthly1 |   13022024 |     130000 |
      | FlxMnthly1 |   13022024 |     140000 |
      | FlxMnthly1 |   13022024 |     181000 |
      | FlxMnthly1 |   14022024 |     093000 |
      | FlxMnthly1 |   14022024 |     130000 |
      | FlxMnthly1 |   14022024 |     140000 |
      | FlxMnthly1 |   14022024 |     182000 |
      | FlxMnthly1 |   15022024 |     050000 |
      | FlxMnthly1 |   15022024 |     130000 |
      | FlxMnthly1 |   15022024 |     140000 |
      | FlxMnthly1 |   15022024 |     175000 |
      | FlxMnthly1 |   16022024 |     050000 |
      | FlxMnthly1 |   16022024 |     130000 |
      | FlxMnthly1 |   16022024 |     140000 |
      | FlxMnthly1 |   16022024 |     180000 |
      | FlxMnthly1 |   17022024 |     070000 |
      | FlxMnthly1 |   17022024 |     130000 |
      | FlxMnthly1 |   17022024 |     140000 |
      | FlxMnthly1 |   17022024 |     172000 |
      | FlxMnthly1 |   18022024 |     083000 |
      | FlxMnthly1 |   18022024 |     130000 |
      | FlxMnthly1 |   18022024 |     140000 |
      | FlxMnthly1 |   18022024 |     180000 |
      | FlxMnthly1 |   19022024 |     093000 |
      | FlxMnthly1 |   19022024 |     130000 |
      | FlxMnthly1 |   19022024 |     140000 |
      | FlxMnthly1 |   19022024 |     180000 |
      | FlxMnthly1 |   20022024 |     070000 |
      | FlxMnthly1 |   20022024 |     130000 |
      | FlxMnthly1 |   20022024 |     140000 |
      | FlxMnthly1 |   20022024 |     230000 |
      | FlxMnthly1 |   21022024 |     080000 |
      | FlxMnthly1 |   21022024 |     130000 |
      | FlxMnthly1 |   21022024 |     140000 |
      | FlxMnthly1 |   21022024 |     180000 |
      | FlxMnthly1 |   22022024 |     070000 |
      | FlxMnthly1 |   22022024 |     130000 |
      | FlxMnthly1 |   22022024 |     140000 |
      | FlxMnthly1 |   22022024 |     230000 |
      | FlxMnthly1 |   23022024 |     083000 |
      | FlxMnthly1 |   23022024 |     130000 |
      | FlxMnthly1 |   23022024 |     140000 |
      | FlxMnthly1 |   23022024 |     180000 |
      | FlxMnthly1 |   24022024 |     070000 |
      | FlxMnthly1 |   24022024 |     130000 |
      | FlxMnthly1 |   24022024 |     140000 |
      | FlxMnthly1 |   24022024 |     230000 |
      | FlxMnthly1 |   25022024 |     090000 |
      | FlxMnthly1 |   25022024 |     130000 |
      | FlxMnthly1 |   25022024 |     140000 |
      | FlxMnthly1 |   25022024 |     180000 |
      | FlxMnthly1 |   26022024 |     060000 |
      | FlxMnthly1 |   26022024 |     130000 |
      | FlxMnthly1 |   26022024 |     140000 |
      | FlxMnthly1 |   26022024 |     180000 |
      | FlxMnthly1 |   27022024 |     060000 |
      | FlxMnthly1 |   27022024 |     130000 |
      | FlxMnthly1 |   27022024 |     140000 |
      | FlxMnthly1 |   27022024 |     180000 |
      | FlxMnthly1 |   28022024 |     060000 |
      | FlxMnthly1 |   28022024 |     130000 |
      | FlxMnthly1 |   28022024 |     140000 |
      | FlxMnthly1 |   28022024 |     180000 |
      | FlxMnthly1 |   29022024 |     070000 |
      | FlxMnthly1 |   29022024 |     130000 |
      | FlxMnthly1 |   29022024 |     140000 |
      | FlxMnthly1 |   29022024 |     230000 |
      | FlxMnthlyN |   01022024 |     060000 |
      | FlxMnthlyN |   01022024 |     130000 |
      | FlxMnthlyN |   01022024 |     140000 |
      | FlxMnthlyN |   01022024 |     230000 |
      | FlxMnthlyN |   02022024 |     060000 |
      | FlxMnthlyN |   02022024 |     130000 |
      | FlxMnthlyN |   02022024 |     140000 |
      | FlxMnthlyN |   02022024 |     230000 |
      | FlxMnthlyN |   03022024 |     060000 |
      | FlxMnthlyN |   03022024 |     130000 |
      | FlxMnthlyN |   03022024 |     140000 |
      | FlxMnthlyN |   03022024 |     230000 |
      | FlxMnthlyN |   04022024 |     093000 |
      | FlxMnthlyN |   04022024 |     130000 |
      | FlxMnthlyN |   04022024 |     140000 |
      | FlxMnthlyN |   04022024 |     180000 |
      | FlxMnthlyN |   05022024 |     090000 |
      | FlxMnthlyN |   05022024 |     130000 |
      | FlxMnthlyN |   05022024 |     140000 |
      | FlxMnthlyN |   05022024 |     173000 |
      | FlxMnthlyN |   06022024 |     050000 |
      | FlxMnthlyN |   06022024 |     130000 |
      | FlxMnthlyN |   06022024 |     140000 |
      | FlxMnthlyN |   06022024 |     230000 |
      | FlxMnthlyN |   07022024 |     090000 |
      | FlxMnthlyN |   07022024 |     130000 |
      | FlxMnthlyN |   07022024 |     140000 |
      | FlxMnthlyN |   07022024 |     173000 |
      | FlxMnthlyN |   08022024 |     083000 |
      | FlxMnthlyN |   08022024 |     130000 |
      | FlxMnthlyN |   08022024 |     140000 |
      | FlxMnthlyN |   08022024 |     230000 |
      | FlxMnthlyN |   10022024 |     070000 |
      | FlxMnthlyN |   10022024 |     130000 |
      | FlxMnthlyN |   10022024 |     140000 |
      | FlxMnthlyN |   10022024 |     180000 |
      | FlxMnthlyN |   11022024 |     080000 |
      | FlxMnthlyN |   11022024 |     130000 |
      | FlxMnthlyN |   11022024 |     140000 |
      | FlxMnthlyN |   11022024 |     163000 |
      | FlxMnthlyN |   12022024 |     050000 |
      | FlxMnthlyN |   12022024 |     130000 |
      | FlxMnthlyN |   12022024 |     140000 |
      | FlxMnthlyN |   12022024 |     180000 |
      | FlxMnthlyN |   13022024 |     050000 |
      | FlxMnthlyN |   13022024 |     130000 |
      | FlxMnthlyN |   13022024 |     140000 |
      | FlxMnthlyN |   13022024 |     181000 |
      | FlxMnthlyN |   14022024 |     093000 |
      | FlxMnthlyN |   14022024 |     130000 |
      | FlxMnthlyN |   14022024 |     140000 |
      | FlxMnthlyN |   14022024 |     182000 |
      | FlxMnthlyN |   15022024 |     050000 |
      | FlxMnthlyN |   15022024 |     130000 |
      | FlxMnthlyN |   15022024 |     140000 |
      | FlxMnthlyN |   15022024 |     175000 |
      | FlxMnthlyN |   16022024 |     050000 |
      | FlxMnthlyN |   16022024 |     130000 |
      | FlxMnthlyN |   16022024 |     140000 |
      | FlxMnthlyN |   16022024 |     180000 |
      | FlxMnthlyN |   17022024 |     070000 |
      | FlxMnthlyN |   17022024 |     130000 |
      | FlxMnthlyN |   17022024 |     140000 |
      | FlxMnthlyN |   17022024 |     172000 |
      | FlxMnthlyN |   18022024 |     083000 |
      | FlxMnthlyN |   18022024 |     130000 |
      | FlxMnthlyN |   18022024 |     140000 |
      | FlxMnthlyN |   18022024 |     180000 |
      | FlxMnthlyN |   19022024 |     093000 |
      | FlxMnthlyN |   19022024 |     130000 |
      | FlxMnthlyN |   19022024 |     140000 |
      | FlxMnthlyN |   19022024 |     180000 |
      | FlxMnthlyN |   20022024 |     070000 |
      | FlxMnthlyN |   20022024 |     130000 |
      | FlxMnthlyN |   20022024 |     140000 |
      | FlxMnthlyN |   20022024 |     230000 |
      | FlxMnthlyN |   21022024 |     080000 |
      | FlxMnthlyN |   21022024 |     130000 |
      | FlxMnthlyN |   21022024 |     140000 |
      | FlxMnthlyN |   21022024 |     180000 |
      | FlxMnthlyN |   22022024 |     070000 |
      | FlxMnthlyN |   22022024 |     130000 |
      | FlxMnthlyN |   22022024 |     140000 |
      | FlxMnthlyN |   22022024 |     230000 |
      | FlxMnthlyN |   23022024 |     083000 |
      | FlxMnthlyN |   23022024 |     130000 |
      | FlxMnthlyN |   23022024 |     140000 |
      | FlxMnthlyN |   23022024 |     180000 |
      | FlxMnthlyN |   24022024 |     070000 |
      | FlxMnthlyN |   24022024 |     130000 |
      | FlxMnthlyN |   24022024 |     140000 |
      | FlxMnthlyN |   24022024 |     230000 |
      | FlxMnthlyN |   25022024 |     090000 |
      | FlxMnthlyN |   25022024 |     130000 |
      | FlxMnthlyN |   25022024 |     140000 |
      | FlxMnthlyN |   25022024 |     180000 |
      | FlxMnthlyN |   26022024 |     060000 |
      | FlxMnthlyN |   26022024 |     130000 |
      | FlxMnthlyN |   26022024 |     140000 |
      | FlxMnthlyN |   26022024 |     180000 |
      | FlxMnthlyN |   27022024 |     060000 |
      | FlxMnthlyN |   27022024 |     130000 |
      | FlxMnthlyN |   27022024 |     140000 |
      | FlxMnthlyN |   27022024 |     180000 |
      | FlxMnthlyN |   28022024 |     060000 |
      | FlxMnthlyN |   28022024 |     130000 |
      | FlxMnthlyN |   28022024 |     140000 |
      | FlxMnthlyN |   28022024 |     180000 |
      | FlxMnthlyN |   29022024 |     070000 |
      | FlxMnthlyN |   29022024 |     130000 |
      | FlxMnthlyN |   29022024 |     140000 |
      | FlxMnthlyN |   29022024 |     230000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                      |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:00      |                      |
      | 09/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 10/02/2024 | 07:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |                      |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 08:00      |                      |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |                      |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 07:50      |                      |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/02/2024 | 07:00    | 17:20    | PR       | AB       | 07:20      | AB:Less Work Hrs     |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |                      |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                      |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |                      |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:00      |                      |
      | 09/02/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 10/02/2024 | 07:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |                      |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 08:00      |                      |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |                      |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 07:50      |                      |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/02/2024 | 07:00    | 17:20    | PR       | AB       | 07:20      | AB:Less Work Hrs     |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |                      |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |                      |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:00      |        |
      | 09/02/2024 |          |          | PR       | PR       |            |        |
      | 10/02/2024 | 07:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |        |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 08:00      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |        |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 07:50      |        |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 17/02/2024 | 07:00    | 17:20    | PR       | PR       | 07:20      |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/02/2024" and "29/02/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 02/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 03/02/2024 | 06:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 04/02/2024 | 09:30    | 18:00    | WO       | WO       | 07:30      |        |
      | 05/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 06/02/2024 | 05:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 07/02/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 08/02/2024 | 08:30    | 23:00    | PR       | PR       | 08:00      |        |
      | 09/02/2024 |          |          | PR       | PR       |            |        |
      | 10/02/2024 | 07:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 11/02/2024 | 08:00    | 16:30    | WO       | WO       | 06:30      |        |
      | 12/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/02/2024 | 05:00    | 18:10    | PR       | PR       | 08:00      |        |
      | 14/02/2024 | 09:30    | 18:20    | PR       | PR       | 07:30      |        |
      | 15/02/2024 | 05:00    | 17:50    | PR       | PR       | 07:50      |        |
      | 16/02/2024 | 05:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 17/02/2024 | 07:00    | 17:20    | PR       | PR       | 07:20      |        |
      | 18/02/2024 | 08:30    | 18:00    | WO       | WO       | 08:00      |        |
      | 19/02/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 20/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 21/02/2024 | 08:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 22/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 23/02/2024 | 08:30    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |
      | 25/02/2024 | 09:00    | 18:00    | WO       | WO       | 08:00      |        |
      | 26/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 27/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/02/2024 | 06:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 29/02/2024 | 07:00    | 23:00    | PR       | PR       | 08:00      |        |

  @TnA_Flexible_14
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_15
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_16
  Scenario: TnA_Flexible - Monthly - Till Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | AB       | 07:30      | 2nd Half AB:Target Shortfall |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_17
  Scenario: TnA_Flexible - Monthly - From Shift Start - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_18
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 |          |          | WO       | WO       |            |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 |          |          | WO       | WO       |            |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_19
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Days In A Week - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 05:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_20
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Days In A Week - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_21
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ConsWrkHrsAbInFlg | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | ShrtfallHrsDeductFullDayHrs | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 | False             | False           | False           | False           | False             |                        0800 | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   18012024 |     180000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   18012024 |     180000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_22
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_23
  Scenario: TnA_Flexible - Monthly - From Shift Start - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_24
  Scenario: TnA_Flexible - Monthly - Till Shift End - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_25
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Fixed Limit - with Daily Grace Limit & Grace Count - Custom ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor     | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Custom Shortfall Hours |             00400 |                       0400 | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_26
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Fixed Limit - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_27
  Scenario: TnA_Flexible - Monthly - Till Shift End - Fixed Limit - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_28
  Scenario: TnA_Flexible - Monthly - From Shift Start - Fixed Limit - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_29
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Fixed Limit - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Fixed Limit  |  24800 |             | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_30
  Scenario: TnA_Flexible - Monthly - Flexible for 24 Hrs - Days In A Week - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Flexible for 24 Hrs |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 11:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_31
  Scenario: TnA_Flexible - Monthly - From Shift Start - Days In A Week - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 10:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_32
  Scenario: TnA_Flexible - Monthly - Till Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs   | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | Till Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 09:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 06:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |

  @TnA_Flexible_33
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0800 | False    |             0800 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                              |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark                       |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                              |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                              |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                              |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available         |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                              |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs             |
      | 14/01/2024 |          |          | WO       | WO       |            |                              |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 18/01/2024 | 09:00    | 14:00    | AB       | AB       | 04:00      | 1st Half AB:Target Shortfall |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 21/01/2024 |          |          | WO       | WO       |            |                              |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                              |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                              |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 28/01/2024 |          |          | WO       | WO       |            |                              |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                              |

  @TnA_Flexible_34
  Scenario: TnA_Flexible - Monthly - From Shift Start to Shift End - Days In A Week - with Daily Grace Limit & Grace Count - Calculated ShortFall - Grace 004:00 & HalfDay 04:00
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | ConsDailyHrs                  | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal    | FirstDayOfWeek | AplyDailyWrkLmt | WklyTgtAsPer   | TgtHrs | TgtDailyHrs | GraceHrs | DeductHrsFrTgtWO | ShrtfallHrsDeductFullDayHrs | ConsWrkHrsAbInFlg | ConsWrkHrsAbInHrs | ConsWrkHrsLvFlg | ConsWrkHrsWoFlg | ConsWrkHrsPhFlg | ConsWrkHrsFbRdFlg | FlxAbRuleMarkAbFor         | GrcForShrtfallHrs | FlxAbRuleMarkHalfAbForEvry | validation         |
      | FlxMnthly1 |                4 | From Shift Start to Shift End |                   30 |              30 | Monthly Basis |                | False           | Days In A Week |        |        0600 | False    |             0600 |                        0800 | True              |              0000 | False           | False           | False           | False             | Calculated Shortfall Hours |                   |                            | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | AtdMarkingType | FlexibleHalfDay | FlexibleFullDay | AttendancePlc | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | FlxMnthly1 | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               |                        4 | Saved Successfully |
      | FlxMnthlyN | True   | True      | Flexible       |            0400 |            0800 | FlxMnthly1    | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | FlxMnthly1 |   01012024 |     090000 |
      | FlxMnthly1 |   01012024 |     130000 |
      | FlxMnthly1 |   01012024 |     140000 |
      | FlxMnthly1 |   01012024 |     180000 |
      | FlxMnthly1 |   02012024 |     090000 |
      | FlxMnthly1 |   02012024 |     130000 |
      | FlxMnthly1 |   02012024 |     140000 |
      | FlxMnthly1 |   02012024 |     180000 |
      | FlxMnthly1 |   03012024 |     093000 |
      | FlxMnthly1 |   03012024 |     130000 |
      | FlxMnthly1 |   03012024 |     140000 |
      | FlxMnthly1 |   03012024 |     180000 |
      | FlxMnthly1 |   04012024 |     080000 |
      | FlxMnthly1 |   04012024 |     130000 |
      | FlxMnthly1 |   04012024 |     140000 |
      | FlxMnthly1 |   04012024 |     200000 |
      | FlxMnthly1 |   05012024 |     091000 |
      | FlxMnthly1 |   05012024 |     130000 |
      | FlxMnthly1 |   05012024 |     140000 |
      | FlxMnthly1 |   05012024 |     180000 |
      | FlxMnthly1 |   07012024 |     080000 |
      | FlxMnthly1 |   07012024 |     140000 |
      | FlxMnthly1 |   08012024 |     090000 |
      | FlxMnthly1 |   08012024 |     130000 |
      | FlxMnthly1 |   08012024 |     140000 |
      | FlxMnthly1 |   08012024 |     180000 |
      | FlxMnthly1 |   09012024 |     090000 |
      | FlxMnthly1 |   09012024 |     130000 |
      | FlxMnthly1 |   09012024 |     140000 |
      | FlxMnthly1 |   09012024 |     180000 |
      | FlxMnthly1 |   10012024 |     090000 |
      | FlxMnthly1 |   10012024 |     130000 |
      | FlxMnthly1 |   10012024 |     140000 |
      | FlxMnthly1 |   10012024 |     180000 |
      | FlxMnthly1 |   11012024 |     090000 |
      | FlxMnthly1 |   11012024 |     130000 |
      | FlxMnthly1 |   11012024 |     140000 |
      | FlxMnthly1 |   11012024 |     180000 |
      | FlxMnthly1 |   12012024 |     090000 |
      | FlxMnthly1 |   12012024 |     130000 |
      | FlxMnthly1 |   12012024 |     140000 |
      | FlxMnthly1 |   12012024 |     180000 |
      | FlxMnthly1 |   13012024 |     090000 |
      | FlxMnthly1 |   13012024 |     140000 |
      | FlxMnthly1 |   15012024 |     090000 |
      | FlxMnthly1 |   15012024 |     130000 |
      | FlxMnthly1 |   15012024 |     140000 |
      | FlxMnthly1 |   15012024 |     180000 |
      | FlxMnthly1 |   16012024 |     090000 |
      | FlxMnthly1 |   16012024 |     130000 |
      | FlxMnthly1 |   16012024 |     140000 |
      | FlxMnthly1 |   16012024 |     180000 |
      | FlxMnthly1 |   17012024 |     090000 |
      | FlxMnthly1 |   17012024 |     130000 |
      | FlxMnthly1 |   17012024 |     140000 |
      | FlxMnthly1 |   17012024 |     180000 |
      | FlxMnthly1 |   18012024 |     090000 |
      | FlxMnthly1 |   18012024 |     130000 |
      | FlxMnthly1 |   18012024 |     140000 |
      | FlxMnthly1 |   19012024 |     090000 |
      | FlxMnthly1 |   19012024 |     130000 |
      | FlxMnthly1 |   19012024 |     140000 |
      | FlxMnthly1 |   19012024 |     180000 |
      | FlxMnthly1 |   20012024 |     090000 |
      | FlxMnthly1 |   20012024 |     130000 |
      | FlxMnthly1 |   20012024 |     140000 |
      | FlxMnthly1 |   20012024 |     180000 |
      | FlxMnthly1 |   22012024 |     090000 |
      | FlxMnthly1 |   22012024 |     130000 |
      | FlxMnthly1 |   22012024 |     140000 |
      | FlxMnthly1 |   22012024 |     180000 |
      | FlxMnthly1 |   23012024 |     090000 |
      | FlxMnthly1 |   23012024 |     130000 |
      | FlxMnthly1 |   23012024 |     140000 |
      | FlxMnthly1 |   23012024 |     180000 |
      | FlxMnthly1 |   24012024 |     090000 |
      | FlxMnthly1 |   24012024 |     130000 |
      | FlxMnthly1 |   24012024 |     140000 |
      | FlxMnthly1 |   24012024 |     180000 |
      | FlxMnthly1 |   25012024 |     092000 |
      | FlxMnthly1 |   25012024 |     130000 |
      | FlxMnthly1 |   25012024 |     140000 |
      | FlxMnthly1 |   25012024 |     180000 |
      | FlxMnthly1 |   26012024 |     090000 |
      | FlxMnthly1 |   26012024 |     130000 |
      | FlxMnthly1 |   26012024 |     140000 |
      | FlxMnthly1 |   26012024 |     173000 |
      | FlxMnthly1 |   27012024 |     090000 |
      | FlxMnthly1 |   27012024 |     130000 |
      | FlxMnthly1 |   27012024 |     140000 |
      | FlxMnthly1 |   27012024 |     180000 |
      | FlxMnthly1 |   29012024 |     090000 |
      | FlxMnthly1 |   29012024 |     130000 |
      | FlxMnthly1 |   29012024 |     140000 |
      | FlxMnthly1 |   29012024 |     180000 |
      | FlxMnthly1 |   30012024 |     090000 |
      | FlxMnthly1 |   30012024 |     130000 |
      | FlxMnthly1 |   30012024 |     140000 |
      | FlxMnthly1 |   30012024 |     180000 |
      | FlxMnthly1 |   31012024 |     090000 |
      | FlxMnthly1 |   31012024 |     130000 |
      | FlxMnthly1 |   31012024 |     140000 |
      | FlxMnthly1 |   31012024 |     180000 |
      | FlxMnthlyN |   01012024 |     090000 |
      | FlxMnthlyN |   01012024 |     130000 |
      | FlxMnthlyN |   01012024 |     140000 |
      | FlxMnthlyN |   01012024 |     180000 |
      | FlxMnthlyN |   02012024 |     090000 |
      | FlxMnthlyN |   02012024 |     130000 |
      | FlxMnthlyN |   02012024 |     140000 |
      | FlxMnthlyN |   02012024 |     180000 |
      | FlxMnthlyN |   03012024 |     093000 |
      | FlxMnthlyN |   03012024 |     130000 |
      | FlxMnthlyN |   03012024 |     140000 |
      | FlxMnthlyN |   03012024 |     180000 |
      | FlxMnthlyN |   04012024 |     080000 |
      | FlxMnthlyN |   04012024 |     130000 |
      | FlxMnthlyN |   04012024 |     140000 |
      | FlxMnthlyN |   04012024 |     200000 |
      | FlxMnthlyN |   05012024 |     091000 |
      | FlxMnthlyN |   05012024 |     130000 |
      | FlxMnthlyN |   05012024 |     140000 |
      | FlxMnthlyN |   05012024 |     180000 |
      | FlxMnthlyN |   07012024 |     080000 |
      | FlxMnthlyN |   07012024 |     140000 |
      | FlxMnthlyN |   08012024 |     090000 |
      | FlxMnthlyN |   08012024 |     130000 |
      | FlxMnthlyN |   08012024 |     140000 |
      | FlxMnthlyN |   08012024 |     180000 |
      | FlxMnthlyN |   09012024 |     090000 |
      | FlxMnthlyN |   09012024 |     130000 |
      | FlxMnthlyN |   09012024 |     140000 |
      | FlxMnthlyN |   09012024 |     180000 |
      | FlxMnthlyN |   10012024 |     090000 |
      | FlxMnthlyN |   10012024 |     130000 |
      | FlxMnthlyN |   10012024 |     140000 |
      | FlxMnthlyN |   10012024 |     180000 |
      | FlxMnthlyN |   11012024 |     090000 |
      | FlxMnthlyN |   11012024 |     130000 |
      | FlxMnthlyN |   11012024 |     140000 |
      | FlxMnthlyN |   11012024 |     180000 |
      | FlxMnthlyN |   12012024 |     090000 |
      | FlxMnthlyN |   12012024 |     130000 |
      | FlxMnthlyN |   12012024 |     140000 |
      | FlxMnthlyN |   12012024 |     180000 |
      | FlxMnthlyN |   13012024 |     090000 |
      | FlxMnthlyN |   13012024 |     140000 |
      | FlxMnthlyN |   15012024 |     090000 |
      | FlxMnthlyN |   15012024 |     130000 |
      | FlxMnthlyN |   15012024 |     140000 |
      | FlxMnthlyN |   15012024 |     180000 |
      | FlxMnthlyN |   16012024 |     090000 |
      | FlxMnthlyN |   16012024 |     130000 |
      | FlxMnthlyN |   16012024 |     140000 |
      | FlxMnthlyN |   16012024 |     180000 |
      | FlxMnthlyN |   17012024 |     090000 |
      | FlxMnthlyN |   17012024 |     130000 |
      | FlxMnthlyN |   17012024 |     140000 |
      | FlxMnthlyN |   17012024 |     180000 |
      | FlxMnthlyN |   18012024 |     090000 |
      | FlxMnthlyN |   18012024 |     130000 |
      | FlxMnthlyN |   18012024 |     140000 |
      | FlxMnthlyN |   19012024 |     090000 |
      | FlxMnthlyN |   19012024 |     130000 |
      | FlxMnthlyN |   19012024 |     140000 |
      | FlxMnthlyN |   19012024 |     180000 |
      | FlxMnthlyN |   20012024 |     090000 |
      | FlxMnthlyN |   20012024 |     130000 |
      | FlxMnthlyN |   20012024 |     140000 |
      | FlxMnthlyN |   20012024 |     180000 |
      | FlxMnthlyN |   22012024 |     090000 |
      | FlxMnthlyN |   22012024 |     130000 |
      | FlxMnthlyN |   22012024 |     140000 |
      | FlxMnthlyN |   22012024 |     180000 |
      | FlxMnthlyN |   23012024 |     090000 |
      | FlxMnthlyN |   23012024 |     130000 |
      | FlxMnthlyN |   23012024 |     140000 |
      | FlxMnthlyN |   23012024 |     180000 |
      | FlxMnthlyN |   24012024 |     090000 |
      | FlxMnthlyN |   24012024 |     130000 |
      | FlxMnthlyN |   24012024 |     140000 |
      | FlxMnthlyN |   24012024 |     180000 |
      | FlxMnthlyN |   25012024 |     092000 |
      | FlxMnthlyN |   25012024 |     130000 |
      | FlxMnthlyN |   25012024 |     140000 |
      | FlxMnthlyN |   25012024 |     180000 |
      | FlxMnthlyN |   26012024 |     090000 |
      | FlxMnthlyN |   26012024 |     130000 |
      | FlxMnthlyN |   26012024 |     140000 |
      | FlxMnthlyN |   26012024 |     173000 |
      | FlxMnthlyN |   27012024 |     090000 |
      | FlxMnthlyN |   27012024 |     130000 |
      | FlxMnthlyN |   27012024 |     140000 |
      | FlxMnthlyN |   27012024 |     180000 |
      | FlxMnthlyN |   29012024 |     090000 |
      | FlxMnthlyN |   29012024 |     130000 |
      | FlxMnthlyN |   29012024 |     140000 |
      | FlxMnthlyN |   29012024 |     180000 |
      | FlxMnthlyN |   30012024 |     090000 |
      | FlxMnthlyN |   30012024 |     130000 |
      | FlxMnthlyN |   30012024 |     140000 |
      | FlxMnthlyN |   30012024 |     180000 |
      | FlxMnthlyN |   31012024 |     090000 |
      | FlxMnthlyN |   31012024 |     130000 |
      | FlxMnthlyN |   31012024 |     140000 |
      | FlxMnthlyN |   31012024 |     180000 |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | IN       | 04:00      |                      |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark               |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |                      |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |                      |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |                      |
      | 06/01/2024 |          |          | AB       | AB       |            | No Punches Available |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |                      |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 13/01/2024 | 09:00    | 14:00    | PR       | AB       | 05:00      | AB:Less Work Hrs     |
      | 14/01/2024 |          |          | WO       | WO       |            |                      |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 18/01/2024 | 09:00    | 14:00    | PR       | AB       | 04:00      | AB:Less Work Hrs     |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 21/01/2024 |          |          | WO       | WO       |            |                      |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |                      |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |                      |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 28/01/2024 |          |          | WO       | WO       |            |                      |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |                      |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | FlxMnthly1 |
      | FlxMnthlyN |
    Then Daily Attendance View for userid "FlxMnthly1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |        |
      | 06/01/2024 |          |          | PR       | PR       |            |        |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 04:00      |        |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 18/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |        |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 21/01/2024 |          |          | WO       | WO       |            |        |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |        |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/01/2024 |          |          | WO       | WO       |            |        |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
    And Daily Attendance View for userid "FlxMnthlyN" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 02/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 03/01/2024 | 09:30    | 18:00    | PR       | PR       | 07:30      |        |
      | 04/01/2024 | 08:00    | 20:00    | PR       | PR       | 08:00      |        |
      | 05/01/2024 | 09:10    | 18:00    | PR       | PR       | 07:50      |        |
      | 06/01/2024 |          |          | PR       | PR       |            |        |
      | 07/01/2024 | 08:00    | 14:00    | WO       | WO       | 05:00      |        |
      | 08/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 09/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 10/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 11/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 12/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 13/01/2024 | 09:00    | 14:00    | PR       | PR       | 05:00      |        |
      | 14/01/2024 |          |          | WO       | WO       |            |        |
      | 15/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 16/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 17/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 18/01/2024 | 09:00    | 14:00    | PR       | PR       | 04:00      |        |
      | 19/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 20/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 21/01/2024 |          |          | WO       | WO       |            |        |
      | 22/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 23/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 24/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 25/01/2024 | 09:20    | 18:00    | PR       | PR       | 07:40      |        |
      | 26/01/2024 | 09:00    | 17:30    | PR       | PR       | 07:30      |        |
      | 27/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 28/01/2024 |          |          | WO       | WO       |            |        |
      | 29/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 30/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
      | 31/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      |        |
