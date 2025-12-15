@API_ShiftSchedule
Feature: shift-changer
  I want to use this template for my feature file

  #*********************************************************************************
  # 66 shift-changer
  #*********************************************************************************
  @SSAPI_1
  Scenario: shift-changer API - Get, Set, Delete
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | SSAPIUr1  |
      | SSAPIUr2  |
      | SSAPIUr3  |
      | SSAPIUr4  |
      | SSAPIUr5  |
      | SSAPIUr6  |
      | SSAPIUr7  |
      | SSAPIRic1 |
    And Delete "BE" shift schedule
    And Delete "BE" shift
    And Delete "BF" shift
    And Delete "BJ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | BE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | BF      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | Saved Successfully |
      | BJ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "BE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | BE      |               7 | true   |
      | BF      |               7 | false  |
    And Configure Off Day Configuration in Shift Schedule "BE"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SSAPIRic1 | SSAPIRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1      | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | SSAPIRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup    | JoiningDate | LeavingDate | AtdEnable | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SSAPIUr1 | True   | API_ReportingGrp1 |             |             | True      | BE            | BE         | True      | True      | True      | True               | Saved Successfully |
      | SSAPIUr2 | True   | API_ReportingGrp1 |             |             | True      | BE            | BE         | True      | True      | True      | True               | Saved Successfully |
      | SSAPIUr3 | True   |                   |          -3 |           0 | True      | BE            | BE         | True      | True      | True      | True               | Saved Successfully |
      | SSAPIUr4 | True   | API_ReportingGrp1 |             |             |           | BE            | BE         | True      | True      | True      | True               | Saved Successfully |
      | SSAPIUr5 | True   | API_ReportingGrp1 |             |             | True      | BE            | BE         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | SSAPIUr1 |
      | SSAPIUr2 |
      | SSAPIUr3 |
      | SSAPIUr4 |
      | SSAPIUr5 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | SSAPIUr1 |
      | SSAPIUr2 |
      | SSAPIUr3 |
      | SSAPIUr4 |
      | SSAPIUr5 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID   |
      | SSAPIUr1 |
      | SSAPIUr2 |
      | SSAPIUr3 |
      | SSAPIUr4 |
      | SSAPIUr5 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | SSAPIUr1 |
      | SSAPIUr2 |
      | SSAPIUr3 |
      | SSAPIUr4 |
      | SSAPIUr5 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | SSAPIUr1 |
      | SSAPIUr2 |
      | SSAPIUr3 |
      | SSAPIUr4 |
      | SSAPIUr5 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID   |
      | SSAPIUr1 |
      | SSAPIUr2 |
      | SSAPIUr3 |
      | SSAPIUr4 |
      | SSAPIUr5 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | SSAPIUr1  |                          1 | admin        |    1 |
      | SSAPIUr2  |                          1 | admin        |    1 |
      | SSAPIUr3  |                          1 | admin        |    1 |
      | SSAPIUr4  |                          1 | admin        |    1 |
      | SSAPIUr5  |                          1 | admin        |    1 |
      | SSAPIRic1 |                          1 | admin        |    1 |
    When Execute scenario start from "Scenario 1" to "Scenario 28" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1" to "Scenario 28" result "Pass".
