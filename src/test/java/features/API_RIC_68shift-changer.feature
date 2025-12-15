@tag
Feature: 68-shift-changer - 5 Level RIC
  I want to use this template for my feature file

  @API_ShiftChg_AnyOne_1
  Scenario: API_ShiftChg_AnyOne Auth Mode behaviour of Any One Approval Policy with 5 RIC C1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 29" to "scenario 241" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 29" to "Scenario 241" result "Pass".

  @API_ShiftChg_AnyOne_2
  Scenario: API_ShiftChg_AnyOne Auth Mode behaviour of Any One Approval Policy with 5 RIC C2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 242" to "scenario 454" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 242" to "Scenario 454" result "Pass".

  @API_ShiftChg_AnyOne_3
  Scenario: API_ShiftChg_AnyOne RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 455" to "scenario 540" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 455" to "Scenario 540" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 541" to "scenario 605" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 541" to "Scenario 605" result "Pass".

  @API_ShiftChg_AnyOne_4
  Scenario: API_ShiftChg_AnyOne RIC selection changed in Approval Policy page, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 606" to "scenario 693" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 606" to "Scenario 693" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 694" to "scenario 778" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 694" to "Scenario 778" result "Pass".

  @API_ShiftChg_AnyOne_5
  Scenario: API_ShiftChg_AnyOne RIC selection changed in Approval Policy page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 779" to "scenario 866" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 779" to "Scenario 866" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 867" to "scenario 951" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 867" to "Scenario 951" result "Pass".

  @API_ShiftChg_AnyOne_6
  Scenario: API_ShiftChg_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 952" to "scenario 1057" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 952" to "Scenario 1057" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 1058" to "scenario 1162" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1058" to "Scenario 1162" result "Pass".

  @API_ShiftChg_AnyOne_7
  Scenario: API_ShiftChg_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 1163" to "scenario 1270" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1163" to "Scenario 1270" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 1271" to "scenario 1375" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1058" to "Scenario 1162" result "Pass".

  @API_ShiftChg_AnyOne_8
  Scenario: API_ShiftChg_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 1376" to "scenario 1483" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1376" to "Scenario 1483" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 1484" to "scenario 1588" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1484" to "Scenario 1588" result "Pass".

  @API_ShiftChg_AnyOne_9
  Scenario: API_ShiftChg_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 1589" to "scenario 1694" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1589" to "Scenario 1694" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 1695" to "scenario 1719" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1695" to "Scenario 1719" result "Pass".

  @API_ShiftChg_AnyOne_10
  Scenario: API_ShiftChg_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 1720" to "scenario 1827" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1720" to "Scenario 1827" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 1828" to "scenario 1932" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1828" to "Scenario 1932" result "Pass".

  @API_ShiftChg_AnyOne_11
  Scenario: API_ShiftChg_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 1933" to "scenario 2040" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 1933" to "Scenario 2040" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 2041" to "scenario 2145" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 2041" to "Scenario 2145" result "Pass".

  @API_ShiftChg_AnyOne_12
  Scenario: API_ShiftChg Authorization Mode All Sequencial in Approval Policy page Reporting Group RIC < Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 2146" to "scenario 2278" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 2146" to "Scenario 2278" result "Pass".

  @API_ShiftChg_AnyOne_13
  Scenario: API_ShiftChg Authorization Mode All Sequencial in Approval Policy page Reporting Group RIC > Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 2279" to "scenario 2304" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 2279" to "Scenario 2304" result "Pass".

  @API_ShiftChg_AnyOne_14
  Scenario: API_ShiftChg Authorization Mode All in Approval Policy page Reporting Group RIC < Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 2305" to "scenario 2437" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 2305" to "Scenario 2437" result "Pass".

  @API_ShiftChg_AnyOne_15
  Scenario: API_ShiftChg Authorization Mode All in Approval Policy page Reporting Group RIC > Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 2438" to "scenario 2570" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 2438" to "Scenario 2570" result "Pass".

  @API_ShiftChg_AnyOne_16
  Scenario: API_ShiftChg_AnyOne RIC changed in Reporting Group page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4775" to "scenario 4817" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4775" to "Scenario 4817" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 4818" to "scenario 4859" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4818" to "Scenario 4859" result "Pass".

  @API_ShiftChg_AnyOne_17
  Scenario: API_ShiftChg_AnyOne RIC changed in Reporting Group page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4860" to "scenario 4904" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4860" to "Scenario 4904" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 4905" to "scenario 4946" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4905" to "Scenario 4946" result "Pass".

  @API_ShiftChg_AnyOne_18
  Scenario: API_ShiftChg_AnyOne RIC changed in Reporting Group page, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4947" to "scenario 4991" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4947" to "Scenario 4991" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 4992" to "scenario 5033" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4992" to "Scenario 5033" result "Pass".

  @API_ShiftChg_AnyOne_19
  Scenario: API_ShiftChg_AnyOne RIC Group Add, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5476" to "scenario 5499" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5476" to "Scenario 5499" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5500" to "scenario 5541" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5500" to "Scenario 5541" result "Pass".

  @API_ShiftChg_AnyOne_20
  Scenario: API_ShiftChg_AnyOne RIC Group Add, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5542" to "scenario 5567" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5542" to "Scenario 5567" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5568" to "scenario 5590" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5568" to "Scenario 5590" result "Pass".

  @API_ShiftChg_AnyOne_21
  Scenario: API_ShiftChg_AnyOne RIC Group Add, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5591" to "scenario 5616" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5591" to "Scenario 5616" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5617" to "scenario 5639" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5617" to "Scenario 5639" result "Pass".

  @API_ShiftChg_AnyOne_22
  Scenario: API_ShiftChg_AnyOne RIC Group Remove, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5948" to "scenario 5990" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5948" to "Scenario 5990" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 5991" to "scenario 6011" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5991" to "Scenario 6011" result "Pass".

  @API_ShiftChg_AnyOne_23
  Scenario: API_ShiftChg_AnyOne RIC Group Remove, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6012" to "scenario 6056" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6012" to "Scenario 6056" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6057" to "scenario 6079" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6057" to "Scenario 6079" result "Pass".

  @API_ShiftChg_AnyOne_24
  Scenario: API_ShiftChg_AnyOne RIC Group Remove, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6080" to "scenario 6124" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6080" to "Scenario 6124" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6125" to "scenario 6147" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6125" to "Scenario 6147" result "Pass".

  @API_ShiftChg_All_25
  Scenario: API_ShiftChg_All Auth Mode behaviour of All Approval Policy with 5 RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 2571" to "scenario 3212" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 2571" to "Scenario 3212" result "Pass".

  @API_ShiftChg_All_26
  Scenario: API_ShiftChg_All RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 3213" to "scenario 3298" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3213" to "Scenario 3298" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 3299" to "scenario 3363" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3299" to "Scenario 3363" result "Pass".

  @API_ShiftChg_All_27
  Scenario: API_ShiftChg_All RIC selection changed in Approval Policy page, status= Pending 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 3364" to "scenario 3451" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3364" to "Scenario 3451" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 3452" to "scenario 3516" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3452" to "Scenario 3516" result "Pass".

  @API_ShiftChg_All_28
  Scenario: API_ShiftChg_All RIC selection changed in Approval Policy page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 3517" to "scenario 3606" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3517" to "Scenario 3606" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 3607" to "scenario 3691" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3607" to "Scenario 3691" result "Pass".

  @API_ShiftChg_All_29
  Scenario: API_ShiftChg_All RIC selection changed in Approval Policy page, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 3692" to "scenario 3781" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3692" to "Scenario 3781" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 3782" to "scenario 3866" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3782" to "Scenario 3866" result "Pass".

  @API_ShiftChg_All_30
  Scenario: API_ShiftChg_All Authorization Mode gets changed from All to All Sequencial in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 1    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 3867" to "scenario 3972" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3867" to "Scenario 3972" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 3973" to "scenario 3997" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3973" to "Scenario 3997" result "Pass".

  @API_ShiftChg_All_31
  Scenario: API_ShiftChg_All RIC changed in Reporting Group page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5034" to "scenario 5076" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5034" to "Scenario 5076" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 5077" to "scenario 5118" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5077" to "Scenario 5118" result "Pass".

  @API_ShiftChg_All_32
  Scenario: API_ShiftChg_All RIC changed in Reporting Group page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5119" to "scenario 5163" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5119" to "Scenario 5163" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 5164" to "scenario 5205" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5164" to "Scenario 5205" result "Pass".

  @API_ShiftChg_All_33
  Scenario: API_ShiftChg_All RIC changed in Reporting Group page, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5206" to "scenario 5250" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5206" to "Scenario 5250" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 5251" to "scenario 5292" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5251" to "Scenario 5292" result "Pass".

  @API_ShiftChg_All_34
  Scenario: API_ShiftChg_All RIC Group Add, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5640" to "scenario 5663" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5640" to "Scenario 5663" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5664" to "scenario 5705" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5664" to "Scenario 5705" result "Pass".

  @API_ShiftChg_All_35
  Scenario: API_ShiftChg_All RIC Group Add, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5706" to "scenario 5731" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5706" to "Scenario 5731" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5732" to "scenario 5754" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5732" to "Scenario 5754" result "Pass".

  @API_ShiftChg_All_36
  Scenario: API_ShiftChg_All RIC Group Add, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5755" to "scenario 5780" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5755" to "Scenario 5780" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5781" to "scenario 5803" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5781" to "Scenario 5803" result "Pass".

  @API_ShiftChg_All_37
  Scenario: API_ShiftChg_All RIC Group Remove, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6148" to "scenario 6190" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6148" to "Scenario 6190" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6191" to "scenario 6211" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6191" to "Scenario 6211" result "Pass".

  @API_ShiftChg_All_38
  Scenario: API_ShiftChg_All RIC Group Remove, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6212" to "scenario 6256" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6212" to "Scenario 6256" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6257" to "scenario 6279" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6257" to "Scenario 6279" result "Pass".

  @API_ShiftChg_All_39
  Scenario: API_ShiftChg_All RIC Group Remove, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6280" to "scenario 6324" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6280" to "Scenario 6324" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6325" to "scenario 6347" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6325" to "Scenario 6347" result "Pass".

  @API_ShiftChg_AllSequential_40
  Scenario: API_ShiftChg_AllSequential Auth Mode behaviour of All Sequential Approval Policy with 5 RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 3998" to "scenario 4438" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 3998" to "Scenario 4468" result "Pass".

  @API_ShiftChg_AllSequential_41
  Scenario: API_ShiftChg_AllSequential RIC selection changed in Approval Policy page, status= Pending 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4439" to "scenario 4464" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4439" to "Scenario 4464" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 4465" to "scenario 4489" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4465" to "Scenario 4489" result "Pass".

  @API_ShiftChg_AllSequential_42
  Scenario: API_ShiftChg_AllSequential RIC selection changed in Approval Policy page, status= Pending 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4490" to "scenario 4517" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4490" to "Scenario 4517" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 4518" to "scenario 4542" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4518" to "Scenario 4542" result "Pass".

  @API_ShiftChg_AllSequential_43
  Scenario: API_ShiftChg_AllSequential RIC selection changed in Approval Policy page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4543" to "scenario 4573" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4543" to "Scenario 4573" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 4574" to "scenario 4658" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4574" to "Scenario 4658" result "Pass".

  @API_ShiftChg_AllSequential_44
  Scenario: API_ShiftChg_AllSequential RIC selection changed in Approval Policy page, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 4659" to "scenario 4689" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4659" to "Scenario 4689" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 4690" to "scenario 4774" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 4690" to "Scenario 4774" result "Pass".

  @API_ShiftChg_AllSequential_45
  Scenario: API_ShiftChg_AllSequential RIC changed in Reporting Group page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5293" to "scenario 5315" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5293" to "Scenario 5315" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 5316" to "scenario 5337" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5316" to "Scenario 5337" result "Pass".

  @API_ShiftChg_AllSequential_46
  Scenario: API_ShiftChg_AllSequential RIC changed in Reporting Group page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5338" to "scenario 5364" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5338" to "Scenario 5364" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 5365" to "scenario 5406" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5365" to "Scenario 5406" result "Pass".

  @API_ShiftChg_AllSequential_47
  Scenario: API_ShiftChg_AllSequential RIC changed in Reporting Group page, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5407" to "scenario 5433" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5407" to "Scenario 5433" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR3       | APISCR4       |               |               |               |
    When Execute scenario start from "scenario 5434" to "scenario 5475" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5434" to "Scenario 5475" result "Pass".

  @API_ShiftChg_AllSequential_48
  Scenario: API_ShiftChg_AllSequential RIC Group Add, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5804" to "scenario 5827" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5804" to "Scenario 5827" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5828" to "scenario 5849" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5828" to "Scenario 5849" result "Pass".

  @API_ShiftChg_AllSequential_49
  Scenario: API_ShiftChg_AllSequential RIC Group Add, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5850" to "scenario 5875" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5850" to "Scenario 5875" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5876" to "scenario 5898" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5876" to "Scenario 5898" result "Pass".

  @API_ShiftChg_AllSequential_50
  Scenario: API_ShiftChg_AllSequential RIC Group Add, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 5899" to "scenario 5924" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5899" to "Scenario 5924" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 | APISC1         | APISC1         | Saved Successfully |
    When Execute scenario start from "scenario 5925" to "scenario 5947" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 5925" to "Scenario 5947" result "Pass".

  @API_ShiftChg_AllSequential_51
  Scenario: API_ShiftChg_AllSequential RIC Group Remove, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6348" to "scenario 6370" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6348" to "Scenario 6370" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6371" to "scenario 6391" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6371" to "Scenario 6391" result "Pass".

  @API_ShiftChg_AllSequential_52
  Scenario: API_ShiftChg_AllSequential RIC Group Remove, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6392" to "scenario 6417" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6392" to "Scenario 6417" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6418" to "scenario 6440" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6418" to "Scenario 6440" result "Pass".

  @API_ShiftChg_AllSequential_53
  Scenario: API_ShiftChg_AllSequential RIC Group Remove, status= Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       |               |               |               |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6441" to "scenario 6466" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6441" to "Scenario 6466" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APISC1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 6467" to "scenario 6489" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6467" to "Scenario 6489" result "Pass".

  @API_ShiftChg_AllSequential_54
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Shift Change Application | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6490" to "scenario 6575" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6490" to "Scenario 6575" result "Pass".

  @API_ShiftChg_AllSequential_55
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  |
      | Shift Change Application | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6576" to "scenario 6641" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6576" to "Scenario 6641" result "Pass".

  @API_ShiftChg_AllSequential_56
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  |
      | Shift Change Application | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6642" to "scenario 6667" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6642" to "Scenario 6667" result "Pass".

  @API_ShiftChg_AllSequential_57
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  |
      | Shift Change Application | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6668" to "scenario 6733" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6668" to "Scenario 6733" result "Pass".

  @API_ShiftChg_AllSequential_58
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 5
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Shift Change Application | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6734" to "scenario 6799" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6734" to "Scenario 6799" result "Pass".

  @API_ShiftChg_AllSequential_59
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 6
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APISC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  |
      | Shift Change Application | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6800" to "scenario 6825" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6800" to "Scenario 6825" result "Pass".

  @API_ShiftChg_AllSequential_60
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 7
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  |
      | Shift Change Application | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6826" to "scenario 6891" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6826" to "Scenario 6891" result "Pass".

  @API_ShiftChg_AllSequential_61
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 8
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Shift Change Application | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6892" to "scenario 6957" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6892" to "Scenario 6957" result "Pass".

  @API_ShiftChg_AllSequential_62
  Scenario: API_ShiftChg_AllSequential All policy Exception Case 9
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APISC1  |
      | APISCR1 |
      | APISCR2 |
      | APISCR3 |
      | APISCR4 |
      | APISCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APISC1    |
    And Delete Approval policy from user module
      | Name   |
      | APISC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APISC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APISC1"
      | ApplicationType          | AuthorizationMode | ReportingIn-Charge                  |
      | Shift Change Application | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APISCR1 | APISCR1 |               1 |         1 |               1 |                  1 |
      | APISCR2 | APISCR2 |               1 |         1 |               1 |                  1 |
      | APISCR3 | APISCR3 |               1 |         1 |               1 |                  1 |
      | APISCR4 | APISCR4 |               1 |         1 |               1 |                  1 |
      | APISCR5 | APISCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APISC1  | APISC1               | APISCR1       | APISCR2       | APISCR3       | APISCR4       | APISCR5       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | 1A      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
      | 1B      | 12:00     | 21:00   | 04:00   | 08:00   | 17:00      | 18:00    | true                | Saved Successfully |
    And Create Shift Schedule "1AB" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | 1A      |               7 | true   |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | ShiftSchedule | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APISC1 |                        2 | True      | 1AB           | APISC1         | APISC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APISC1  |                          1 | admin        |    1 |
      | APISCR1 |                          1 | admin        |    1 |
      | APISCR2 |                          1 | admin        |    1 |
      | APISCR3 |                          1 | admin        |    1 |
      | APISCR4 |                          1 | admin        |    1 |
      | APISCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APISC1 |
    When Execute scenario start from "scenario 6958" to "scenario 6983" in API sheet named "shift-changer".
    Then Verify API sheet named "shift-changer" and scenario start from "Scenario 6958" to "Scenario 6983" result "Pass".
