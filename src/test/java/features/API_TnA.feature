@tag
Feature: API Automation - Time Attendance Module
  I want to use this template for my feature file

  #*********************************************************************************
  # 40 attendance-correction & 51 attendance-correction-approval
  #*********************************************************************************
  @API_40-51AtdCorAppAppr1
  Scenario: 40-attendance-correction-51-attendance-correction-approval - General Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | API_AtdCor1 |
    And Create User via api
      | Id          | name        |
      | API_AtdCor1 | API_AtdCor1 |
    When Execute scenario start from "scenario 1" to "scenario 3" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 1" to "scenario 3" result "Pass".

  @API_40-51AtdCorAppAppr2
  Scenario: 40-attendance-correction-51-attendance-correction-approval - Attendance Correction Restrictions
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | AtdCorrSLvOffRestApplyTo | AtdCorrSLvOffRestMinDays | AtdCorrSLvOffRestMaxDays | AtdCorrSLvOffRestSpecPeriod | AtdCorrSLvOffRestType           | AtdCorrSLvOffRestPeriod | AtdCorrSLvOffRestPeriodCnt | validation         |
      | API_AtdCor2 |                2 | Attendance Correction    |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | API_AtdCor3 |                2 | Attendance Correction    |                          |                          | True                        | Restrict w.r.t Joining Date     | Days                    |                          2 | Saved Successfully |
      | API_AtdCor4 |                2 | Attendance Correction    |                          |                          | True                        | Restrict till Confirmation Date |                         |                            | Saved Successfully |
    And Create user from user configuration
      | userid      | JoiningDate | ConfirmationDate | AtdEnable | MaxPunchesToBeConsidered | AttendancePlc | ESSEnable | Validation         |
      | API_AtdCor2 |             |                  | True      |                        2 | API_AtdCor2   | True      | Saved Successfully |
      | API_AtdCor3 |          -4 |                  | True      |                        2 | API_AtdCor3   | True      | Saved Successfully |
      | API_AtdCor4 |          -4 |               -1 | True      |                        2 | API_AtdCor4   | True      | Saved Successfully |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | API_AtdCor2 |                          1 | admin        |    1 |
      | API_AtdCor3 |                          1 | admin        |    1 |
      | API_AtdCor4 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor4 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    When Execute scenario start from "scenario 4" to "scenario 23" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 4" to "scenario 23" result "Pass".

  @API_40-51AtdCorAppAppr3
  Scenario: 40-attendance-correction-51-attendance-correction-approval - General Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_AtdCor5    |
      | API_AtdCor6    |
      | API_AtdCor7    |
      | API_AtdCor8    |
      | API_AtdCor9    |
      | API_AtdCor10   |
      | API_AtdCor11   |
      | API_AtdCor12   |
      | API_AtdCor14   |
      | API_AtdCorRIC1 |
      | API_AtdCorRIC3 |
      | API_AtdCorRIC4 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_AtdCor5    | API_AtdCor5    |               1 |         1 |
      | API_AtdCor6    | API_AtdCor6    |               1 |         1 |
      | API_AtdCor7    | API_AtdCor7    |               1 |         1 |
      | API_AtdCor8    | API_AtdCor8    |               1 |         1 |
      | API_AtdCor9    | API_AtdCor9    |               1 |         1 |
      | API_AtdCor10   | API_AtdCor10   |               1 |         1 |
      | API_AtdCor11   | API_AtdCor11   |               1 |         1 |
      | API_AtdCor12   | API_AtdCor12   |               1 |         1 |
      | API_AtdCor14   | API_AtdCor14   |               1 |         1 |
      | API_AtdCorRIC1 | API_AtdCorRIC1 |               1 |         1 |
      | API_AtdCorRIC3 | API_AtdCorRIC3 |               1 |         1 |
      | API_AtdCorRIC4 | API_AtdCorRIC4 |               1 |         1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_AtdCor5    |                          1 | admin        |    1 |
      | API_AtdCor6    |                          1 | admin        |    1 |
      | API_AtdCor7    |                          1 | admin        |    1 |
      | API_AtdCor8    |                          1 | admin        |    1 |
      | API_AtdCor9    |                          1 | admin        |    1 |
      | API_AtdCor10   |                          1 | admin        |    1 |
      | API_AtdCor11   |                          1 | admin        |    1 |
      | API_AtdCor12   |                          1 | admin        |    1 |
      | API_AtdCor14   |                          1 | admin        |    1 |
      | API_AtdCorRIC1 |                          1 | admin        |    1 |
      | API_AtdCorRIC3 |                          1 | admin        |    1 |
      | API_AtdCorRIC4 |                          1 | admin        |    1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | API_AtdCorRIC3 | All Sequential    | true       | true       | False      | False      | False      | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName     | RIC1           | RIC2           | RIC3 | RIC4 | RIC5 | Validation         |
      | API_AtdCorRIC1   |                | API_AtdCorRIC1 |                |      |      |      | Saved Successfully |
      | API_AtdCorRIC3   | API_AtdCorRIC3 | API_AtdCorRIC3 | API_AtdCorRIC4 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid       | MaxPunchesToBeConsidered | ReportingGroup | Validation         |
      | API_AtdCor5  |                        2 |                | Saved Successfully |
      | API_AtdCor6  |                        2 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor7  |                        4 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor8  |                        6 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor9  |                        8 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor10 |                       10 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor11 |                       12 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor12 | N-Punch                  | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor14 |                        2 | API_AtdCorRIC3 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    When Execute scenario start from "scenario 24" to "scenario 127" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 24" to "scenario 127" result "Pass".

  @API_40-51AtdCorAppAppr4
  Scenario: 40-attendance-correction-51-attendance-correction-approval - Break Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | API_AtdCor13 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_AtdCor13   | API_AtdCor13   |               1 |         1 |
      | API_AtdCorRIC2 | API_AtdCorRIC2 |               1 |         1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_AtdCor13   |                          1 | admin        |    1 |
      | API_AtdCorRIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_AtdCorRIC2   |        1 | API_AtdCorRIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid       | MaxPunchesToBeConsidered | ReportingGroup | Validation         |
      | API_AtdCor13 |                        4 | API_AtdCorRIC2 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    When Execute scenario start from "scenario 128" to "scenario 157" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 128" to "scenario 157" result "Pass".

  #*********************************************************************************
  # 52 short-leave-entry & 53 short-leave-authorization
  #*********************************************************************************
  @API_52-53ShLvOfApp1
  Scenario: 52-short-leave-entry-53-short-leave-authorization - General Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_ShLvOfApp1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_ShLvOfApp1 | API_ShLvOfApp1 |               1 |         1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp1 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp1 |
    When Set event via Event Set API
      | Userid         | event-date | event-time |
      | API_ShLvOfApp1 |          0 |     100000 |
      | API_ShLvOfApp1 |          0 |     180000 |
    When Execute scenario start from "scenario 1" to "scenario 3" in API sheet named "short-leave-entry".
    Then Verify API sheet named "short-leave-entry" and scenario start from "scenario 1" to "scenario 3" result "Pass".

  @API_52-53ShLvOfApp2
  Scenario: 52-short-leave-entry-53-short-leave-authorization - Restrictions
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | AtdCorrSLvOffRestApplyTo    | AtdCorrSLvOffRestMinDays | AtdCorrSLvOffRestMaxDays | AtdCorrSLvOffRestSpecPeriod | AtdCorrSLvOffRestType           | AtdCorrSLvOffRestPeriod | AtdCorrSLvOffRestPeriodCnt | validation         |
      | API_ShLvOfApp2 |                2 | Short Leave/Official In-Out |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | API_ShLvOfApp3 |                2 | Short Leave/Official In-Out |                          |                          | True                        | Restrict w.r.t Joining Date     | Days                    |                          2 | Saved Successfully |
      | API_ShLvOfApp4 |                2 | Short Leave/Official In-Out |                          |                          | True                        | Restrict till Confirmation Date |                         |                            | Saved Successfully |
    And Create user from user configuration
      | userid         | JoiningDate | ConfirmationDate | AtdEnable | MaxPunchesToBeConsidered | AttendancePlc  | ESSEnable | Validation         |
      | API_ShLvOfApp2 |             |                  | True      |                        2 | API_ShLvOfApp2 | True      | Saved Successfully |
      | API_ShLvOfApp3 |          -4 |                  | True      |                        2 | API_ShLvOfApp3 | True      | Saved Successfully |
      | API_ShLvOfApp4 |          -4 |               -1 | True      |                        2 | API_ShLvOfApp4 | True      | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_ShLvOfApp2 |                          1 | admin        |    1 |
      | API_ShLvOfApp3 |                          1 | admin        |    1 |
      | API_ShLvOfApp4 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    When Set event via Event Set API
      | Userid         | event-date | event-time |
      | API_ShLvOfApp2 |         -1 |     100000 |
      | API_ShLvOfApp2 |         -1 |     180000 |
      | API_ShLvOfApp2 |         -2 |     100000 |
      | API_ShLvOfApp2 |         -2 |     180000 |
      | API_ShLvOfApp2 |         -6 |     100000 |
      | API_ShLvOfApp2 |         -6 |     180000 |
      | API_ShLvOfApp2 |         -5 |     100000 |
      | API_ShLvOfApp2 |         -5 |     180000 |
      | API_ShLvOfApp3 |         -3 |     100000 |
      | API_ShLvOfApp3 |         -3 |     180000 |
      | API_ShLvOfApp3 |         -2 |     100000 |
      | API_ShLvOfApp3 |         -2 |     180000 |
      | API_ShLvOfApp4 |         -2 |     100000 |
      | API_ShLvOfApp4 |         -2 |     180000 |
      | API_ShLvOfApp4 |         -1 |     100000 |
      | API_ShLvOfApp4 |         -1 |     180000 |
      | API_ShLvOfApp4 |          0 |     100000 |
      | API_ShLvOfApp4 |          0 |     180000 |
      | API_ShLvOfApp4 |          1 |     100000 |
      | API_ShLvOfApp4 |          1 |     180000 |
    When Execute scenario start from "scenario 4" to "scenario 22" in API sheet named "short-leave-entry".
    Then Verify API sheet named "short-leave-entry" and scenario start from "scenario 4" to "scenario 22" result "Pass".

  @API_52-53ShLvOfApp3
  Scenario: 52-short-leave-entry-53-short-leave-authorization - General Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
      | API_ShLvOfAppR1 |
      | API_ShLvOfAppR3 |
      | API_ShLvOfAppR4 |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login |
      | API_ShLvOfApp6  | API_ShLvOfApp6  |               1 |         1 |
      | API_ShLvOfApp7  | API_ShLvOfApp7  |               1 |         1 |
      | API_ShLvOfApp8  | API_ShLvOfApp8  |               1 |         1 |
      | API_ShLvOfApp9  | API_ShLvOfApp9  |               1 |         1 |
      | API_ShLvOfApp10 | API_ShLvOfApp10 |               1 |         1 |
      | API_ShLvOfApp11 | API_ShLvOfApp11 |               1 |         1 |
      | API_ShLvOfApp12 | API_ShLvOfApp12 |               1 |         1 |
      | API_ShLvOfApp14 | API_ShLvOfApp14 |               1 |         1 |
      | API_ShLvOfAppR1 | API_ShLvOfAppR1 |               1 |         1 |
      | API_ShLvOfAppR3 | API_ShLvOfAppR3 |               1 |         1 |
      | API_ShLvOfAppR4 | API_ShLvOfAppR4 |               1 |         1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | API_ShLvOfApp6  |                          1 | admin        |    1 |
      | API_ShLvOfApp7  |                          1 | admin        |    1 |
      | API_ShLvOfApp8  |                          1 | admin        |    1 |
      | API_ShLvOfApp9  |                          1 | admin        |    1 |
      | API_ShLvOfApp10 |                          1 | admin        |    1 |
      | API_ShLvOfApp11 |                          1 | admin        |    1 |
      | API_ShLvOfApp12 |                          1 | admin        |    1 |
      | API_ShLvOfApp14 |                          1 | admin        |    1 |
      | API_ShLvOfAppR1 |                          1 | admin        |    1 |
      | API_ShLvOfAppR3 |                          1 | admin        |    1 |
      | API_ShLvOfAppR4 |                          1 | admin        |    1 |
    And Create In/Out Reasons
      | Reason | Type | Validation         |
      | API_R1 | IN   | Saved Successfully |
      | API_R2 | OUT  | Saved Successfully |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | API_ShLvOfAppR3 | All Sequential    | true       | true       | False      | False      | False      | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName      | RIC1            | RIC2            | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ShLvOfAppR1  |                 | API_ShLvOfAppR1 |                 |      |      |      | Saved Successfully |
      | API_ShLvOfAppR3  | API_ShLvOfAppR3 | API_ShLvOfAppR3 | API_ShLvOfAppR4 |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | OffiInOutAuthReq | validation         |
      | API_ShLvOfApp |                2 | True          | True             | Saved Successfully |
    And Create user from user configuration
      | userid          | MaxPunchesToBeConsidered | AttendancePlc | ReportingGroup  | Validation         |
      | API_ShLvOfApp6  |                        2 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp7  |                        4 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp8  |                        6 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp9  |                        8 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp10 |                       10 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp11 |                       12 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp12 | N-Punch                  | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp14 |                        2 | API_ShLvOfApp | API_ShLvOfAppR3 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    When Execute scenario start from "scenario 23" to "scenario 269" in API sheet named "short-leave-entry".
    Then Verify API sheet named "short-leave-entry" and scenario start from "scenario 23" to "scenario 269" result "Pass".

  #*********************************************************************************
  # 54 attendance-authorization
  #*********************************************************************************
  @API_54AtdAuth1
  Scenario: 54-attendance-authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | API_AtdAuth1  |
      | API_AtdAuth2  |
      | API_AtdAuth3  |
      | API_AtdAuth4  |
      | API_AtdAuthR1 |
      | API_AtdAuthR2 |
      | API_AtdAuthR3 |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login |
      | API_AtdAuthR1 | API_AtdAuthR1 |               1 |         1 |
      | API_AtdAuthR2 | API_AtdAuthR2 |               1 |         1 |
      | API_AtdAuthR3 | API_AtdAuthR3 |               1 |         1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName    | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | API_AtdAuthR2 | All Sequential    | true       | true       | False      | False      | False      |                | Saved Successfully |
      | API_AtdAuthR3 | All               | true       | true       | False      | False      | False      | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName    | RIC1          | RIC2          | RIC3 | RIC4 | RIC5 | Validation         |
      | API_AtdAuthR1    |               | API_AtdAuthR1 |               |      |      |      | Saved Successfully |
      | API_AtdAuthR2    | API_AtdAuthR2 | API_AtdAuthR2 | API_AtdAuthR3 |      |      |      | Saved Successfully |
      | API_AtdAuthR3    | API_AtdAuthR3 | API_AtdAuthR2 | API_AtdAuthR3 |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DailyAtdAuthReq | validation         |
      | API_AtdAuth1 |                2 | True            | Saved Successfully |
    And Create user from user configuration
      | userid       | MaxPunchesToBeConsidered | AtdEnable | AttendancePlc | ReportingGroup | ESSEnable | Validation         |
      | API_AtdAuth1 |                        4 | True      | API_AtdAuth1  | API_AtdAuthR1  | True      | Saved Successfully |
      | API_AtdAuth2 |                        4 | True      | API_AtdAuth1  | API_AtdAuthR2  | True      | Saved Successfully |
      | API_AtdAuth3 |                        4 | True      | API_AtdAuth1  | API_AtdAuthR3  | True      | Saved Successfully |
      | API_AtdAuth4 |                        4 | True      | API_AtdAuth1  |                | True      | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | API_AtdAuth1  |                          1 | admin        |    1 |
      | API_AtdAuth2  |                          1 | admin        |    1 |
      | API_AtdAuth3  |                          1 | admin        |    1 |
      | API_AtdAuthR1 |                          1 | admin        |    1 |
      | API_AtdAuthR2 |                          1 | admin        |    1 |
      | API_AtdAuthR3 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | API_AtdAuth4 |          0 |     090000 |
      | API_AtdAuth4 |          0 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdAuth4 |
    When Execute scenario start from "scenario 1" to "scenario 36" in API sheet named "attendance-authorization".
    Then Verify API sheet named "attendance-authorization" and scenario start from "scenario 1" to "scenario 36" result "Pass".

  #*********************************************************************************
  # 55 ot-coff-authorization
  #*********************************************************************************
  @API_55OtCoffAuth1
  Scenario: 55-ot-coff-authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_OtCoAuth1  |
      | API_OtCoAuth2  |
      | API_OtCoAuth3  |
      | API_OtCoAuth4  |
      | API_OtCoAuth5  |
      | API_OtCoAuth6  |
      | API_OtCoAuth7  |
      | API_OtCoAuth8  |
      | API_OtCoAuthR1 |
      | API_OtCoAuthR2 |
      | API_OtCoAuthR3 |
    And Delete Overtime Policy from TnA module
      | Name          |
      | API_OtCoAuth1 |
      | API_OtCoAuth2 |
      | API_OtCoAuth3 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_OtCoAuthR1 | API_OtCoAuthR1 |               1 |         1 |
      | API_OtCoAuthR2 | API_OtCoAuthR2 |               1 |         1 |
      | API_OtCoAuthR3 | API_OtCoAuthR3 |               1 |         1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | API_OtCoAuthR2 | All Sequential    | true       | true       | False      | False      | False      |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName     | RIC1           | RIC2           | RIC3 | RIC4 | RIC5 | Validation         |
      | API_OtCoAuthR1   |                | API_OtCoAuthR1 |                |      |      |      | Saved Successfully |
      | API_OtCoAuthR2   | API_OtCoAuthR2 | API_OtCoAuthR2 | API_OtCoAuthR3 |      |      |      | Saved Successfully |
    And Create NetWork Hours Policy "API_OtCoAuth1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | API_OtCoAuth1 | API_OtCoAuth1  | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
      | API_OtCoAuth2 | API_OtCoAuth1  | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
      | API_OtCoAuth3 | API_OtCoAuth1  | True              | True               | True      |         | true           |            |                 | All         | Monthly        | true                 | False               | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "API_OtCoAuth1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    1000 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    1000 |      0000 | OT3        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "API_OtCoAuth2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT4        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT5        |   1.00 | Check All      |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "API_OtCoAuth3"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          00000 |        99900 |     00000 | OT1        |   1.00 |
    And Create user from user configuration
      | userid        | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc   | ReportingGroup | ESSEnable | Validation         |
      | API_OtCoAuth1 |                        4 | False     |                   |               | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth2 |                        4 | True      | None              | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth3 |                        4 | True      | Only Overtime     | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth4 |                        4 | True      | Only C-OFF        | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth5 |                        4 | True      | Both              | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth6 |                        4 | True      | Both              | API_OtCoAuth1 | API_OtCoAuthR2 | True      | Saved Successfully |
      | API_OtCoAuth7 |                        4 | True      | Both              | API_OtCoAuth2 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth8 |                        4 | True      | Both              | API_OtCoAuth3 | API_OtCoAuthR1 | True      | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_OtCoAuthR1 |                          1 | admin        |    1 |
      | API_OtCoAuthR2 |                          1 | admin        |    1 |
      | API_OtCoAuthR3 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | API_OtCoAuth1 |
      | API_OtCoAuth2 |
      | API_OtCoAuth3 |
      | API_OtCoAuth4 |
      | API_OtCoAuth5 |
      | API_OtCoAuth6 |
      | API_OtCoAuth7 |
      | API_OtCoAuth8 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID        |
      | API_OtCoAuth1 |
      | API_OtCoAuth2 |
      | API_OtCoAuth3 |
      | API_OtCoAuth4 |
      | API_OtCoAuth5 |
      | API_OtCoAuth6 |
      | API_OtCoAuth7 |
      | API_OtCoAuth8 |
    When Execute scenario start from "scenario 1" to "scenario 117" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "scenario 1" to "scenario 117" result "Pass".

  #*********************************************************************************
  # 65 monthly-process
  #*********************************************************************************
  @API_65monthly-process1
  Scenario: 65-monthly-process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_MP1 |
      | API_MP2 |
      | API_MP3 |
      | API_MP4 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | Organization_code |
      | API_MP1 | API_MP1 |               1 |         1 |               1 |                  1 |                   |
      | API_MP2 | API_MP2 |               1 |         1 |               1 |                  1 |                   |
      | API_MP3 | API_MP3 |               1 |         1 |               1 |                  1 |                   |
      | API_MP4 | API_MP4 |               1 |         1 |               1 |                  1 |                   |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | API_MP1 |
      | API_MP2 |
      | API_MP3 |
      | API_MP4 |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "0" and Year = "0"
      | UserID  |
      | API_MP3 |
      | API_MP4 |
    When Execute scenario start from "scenario 1" to "scenario 23" in API sheet named "monthly-process".
    Then Verify API sheet named "monthly-process" and scenario start from "scenario 1" to "scenario 23" result "Pass".

  #*********************************************************************************
  # 111 overtime-application & 112 overtime-approval
  #*********************************************************************************
  @112OTAppAuth1
  Scenario: Overtime Application and Approval - Get, Set, Update, Delete
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
      | APIOTRIC1      |
      | APIOTRIC2      |
    And Delete "BH" shift schedule
    And Delete "BH" shift
    And Delete Overtime Policy from TnA module
      | Name      |
      | APIOTPlc1 |
      | APIOTPlc2 |
      | APIOTPlc3 |
      | APIOTPlc4 |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName    | EnblOTCal | DailyOT                     | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | APIOTPlc1 | OverTime Policy-1 | True      | ALL                         | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
      | APIOTPlc2 | OverTime Policy-1 | false     |                             |            |                 |                       |            |              |               |                  |               | Saved Successfully |
      | APIOTPlc3 | OverTime Policy-1 | true      | ALL                         | Daily 1    | true            |                       |            |              |               |                  |               | Saved Successfully |
      | APIOTPlc4 | OverTime Policy-1 | true      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | APIAtdPlc1 |                4 | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | BH      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | BI      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | BL      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "BH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BH      |               7 |
    And Create Shift Schedule "BI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BI      |               1 |
      | BL      |               1 |
    And Configure Off Day Configuration in Shift Schedule "BH"
      | OffDay1 |
      | None    |
    And Configure Off Day Configuration in Shift Schedule "BI"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOTRIC1 | APIOTRIC1 |               1 |         1 |               1 |                  1 |
      | APIOTRIC2 | APIOTRIC2 |               1 |         1 |               1 |                  1 |
      | APIOTRIC3 | APIOTRIC3 |               1 |         1 |               1 |                  1 |
      | APIOTRIC4 | APIOTRIC4 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOTAllAprPlc1 | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName      | RIC1      | RIC2      | RIC3 | RIC4 | RIC5 | Validation         |
      | APIOTRGrp1       | AnyOne          | APIOTRIC1 |           |      |      |      | Saved Successfully |
      | APIOTRGrp2       | AnyOne          | APIOTRIC2 |           |      |      |      | Saved Successfully |
      | APIOTRGrp3       | APIOTAllAprPlc1 | APIOTRIC3 | APIOTRIC4 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid         | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_OTAppAppr1 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr2 | True   | APIOTRGrp2     | false     |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr3 | True   | APIOTRGrp1     | True      |                        4 | Only C-OFF        | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr4 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc2   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr5 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc3   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr6 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc4   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr7 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BI            | BI         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr8 | True   | APIOTRGrp3     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_OTAppAppr1 |                          1 | admin        |    1 |
      | API_OTAppAppr2 |                          1 | admin        |    1 |
      | API_OTAppAppr3 |                          1 | admin        |    1 |
      | API_OTAppAppr4 |                          1 | admin        |    1 |
      | API_OTAppAppr5 |                          1 | admin        |    1 |
      | API_OTAppAppr6 |                          1 | admin        |    1 |
      | API_OTAppAppr7 |                          1 | admin        |    1 |
      | API_OTAppAppr8 |                          1 | admin        |    1 |
      | APIOTRIC1      |                          1 | admin        |    1 |
      | APIOTRIC2      |                          1 | admin        |    1 |
      | APIOTRIC3      |                          1 | admin        |    1 |
      | APIOTRIC4      |                          1 | admin        |    1 |
    And Change Shift via API
      | userid         | FromDt | ToDt | shift-id | week-off | public-holiday |
      | API_OTAppAppr6 |      1 |    1 |          |          |              1 |
      | API_OTAppAppr6 |      2 |    2 |          |        1 |                |
    When Execute scenario start from "scenario 1" to "scenario 96" in API sheet named "overtime-application".
    Then Verify API sheet named "overtime-application" and scenario start from "scenario 1" to "scenario 96" result "Pass".

  #*********************************************************************************
  # 106 event-authorization
  #*********************************************************************************
  @106APIEventAuth1
  Scenario: Event Authorization - get, set
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | APIEAUr1  |
      | APIEAUr2  |
      | APIEAUr3  |
      | APIEAUr4  |
      | APIEARic1 |
      | APIEARic2 |
      | APIEARic3 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | HK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "HK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | HK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "HK"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | APIEAAtdPlc1 |                4 | true         | false                             | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIEARic1 | APIEARic1 |               1 |         1 |               1 |                  1 |
      | APIEARic2 | APIEARic2 |               1 |         1 |               1 |                  1 |
      | APIEARic3 | APIEARic3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName    | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIAllAprPlc1 | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName    | RIC1      | RIC2      | RIC3 | RIC4 | RIC5 | Validation         |
      | APIEA_RGrp1      | AnyOne        | APIEARic1 |           |      |      |      | Saved Successfully |
      | APIEA_RGrp2      | APIAllAprPlc1 | APIEARic2 | APIEARic3 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | APIEAUr1 | True   | APIEA_RGrp1    | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | APIEAUr2 | True   |                | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | APIEAUr3 | True   | APIEA_RGrp2    | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | APIEAUr4 | True   | APIEA_RGrp1    | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | APIEAUr1  |                          1 | admin        |    1 |
      | APIEAUr2  |                          1 | admin        |    1 |
      | APIEAUr3  |                          1 | admin        |    1 |
      | APIEAUr4  |                          1 | admin        |    1 |
      | APIEARic1 |                          1 | admin        |    1 |
      | APIEARic2 |                          1 | admin        |    1 |
      | APIEARic3 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid   | event-date | event-time | In-out |
      | APIEAUr1 |         -1 |     090000 |      0 |
      | APIEAUr1 |         -2 |     090000 |      0 |
      | APIEAUr3 |         -1 |     090000 |      0 |
      | APIEAUr4 |         -1 |     090000 |      0 |
    When Execute scenario start from "Scenario 1" to "Scenario 33" in API sheet named "event-authorization".
    Then Verify API sheet named "event-authorization" and scenario start from "Scenario 1" to "Scenario 33" result "Pass".
