@T&A
Feature: Shift-Wise Management
  I want to use this template for my feature file

  @SWM_1
  Scenario: View Shift-Wise Management data of all columns
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SWM_Rported1   |
      | SWM_PLv1       |
      | SWM_HrlPLv1    |
      | SWM_WO1        |
      | SWM_Hld1       |
      | SWM_NtRported1 |
    And Delete "AT" shift schedule
    And Delete "AT" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AT      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AT" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AT      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AT"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | EZ      | EZ        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 |                 | Saved Successfully |
      | FA      | FA        | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            | Saved Successfully |
    And Create Leave Group "EZ" with Pro-rata "False"
      | LeaveID |
      | EZ      |
      | FA      |
    And Create user from user configuration
      | userid         | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | OvertimePlc | ShiftSchedule | HolidaySchedule | Validation         |
      | SWM_Rported1   | True   |            | True      |                        4 | True      | True      | True      | True               |             | AT            |                 | Saved Successfully |
      | SWM_PLv1       | True   | EZ         | True      |                        4 | True      | True      | True      | True               |             | AT            |                 | Saved Successfully |
      | SWM_HrlPLv1    | True   | EZ         | True      |                        4 | True      | True      | True      | True               |             | AT            |                 | Saved Successfully |
      | SWM_WO1        | True   |            | True      |                        4 | True      | True      | True      | True               |             | AT            |                 | Saved Successfully |
      | SWM_Hld1       | True   |            | True      |                        4 | True      | True      | True      | True               |             | AT            |                 | Saved Successfully |
      | SWM_NtRported1 | True   |            | True      |                        4 | True      | True      | True      | True               |             | AT            |                 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID         |
      | SWM_Rported1   |
      | SWM_PLv1       |
      | SWM_HrlPLv1    |
      | SWM_WO1        |
      | SWM_Hld1       |
      | SWM_NtRported1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | SWM_Rported1   |
      | SWM_PLv1       |
      | SWM_HrlPLv1    |
      | SWM_WO1        |
      | SWM_Hld1       |
      | SWM_NtRported1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID         |
      | SWM_Rported1   |
      | SWM_PLv1       |
      | SWM_HrlPLv1    |
      | SWM_WO1        |
      | SWM_Hld1       |
      | SWM_NtRported1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID         |
      | SWM_Rported1   |
      | SWM_PLv1       |
      | SWM_HrlPLv1    |
      | SWM_WO1        |
      | SWM_Hld1       |
      | SWM_NtRported1 |
    When Change Shift via API
      | userid   | FromDt | ToDt | shift-id | week-off | public-holiday |
      | SWM_WO1  |      0 |    0 |          |        1 |                |
      | SWM_Hld1 |      0 |    0 |          |          |              1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | SWM_PLv1    |          0 |           0 |                 |                 |    5 |          |                | EZ         |      0 |     0 |    0 |          | credit |        |
      | SWM_HrlPLv1 |          0 |           0 |                 |                 |      |          |                | FA         |      0 |     0 |    0 |          | credit | 010:00 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | SWM_Rported1 |          0 |     090000 |
      | SWM_Rported1 |          0 |     130000 |
      | SWM_Rported1 |          0 |     140000 |
      | SWM_Rported1 |          0 |     180000 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | SWM_PLv1    |                          1 | admin        |    1 |
      | SWM_HrlPLv1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid      | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy   |
      | SWM_PLv1    |                  1 |          0 |        0 | EZ         |                     1 |                 |                   |                 | SWM_PLv1    |
      | SWM_HrlPLv1 |                  4 |          0 |        0 | FA         |                     1 |               0 | 09:00             | 18:00           | SWM_HrlPLv1 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid      | Start-date | end-date |
      |        1 | ApprovedRequest | sa    | SWM_PLv1    |          0 |        0 |
      |        1 | ApprovedRequest | sa    | SWM_HrlPLv1 |          0 |        0 |
    Then View Shift-Wise Management data
      | AttendanceDate | FilterUsers | ID | Shift ID | Name | Assigned | Scheduled | On Leave/Tour | On Week-Off | On Holiday | Reported | Not Yet Reported |
      |              0 | All         |    | AT       | AT   |        6 |         3 |             2 |           1 |          1 |        1 |                1 |
 