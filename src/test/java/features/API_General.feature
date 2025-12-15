@tag
Feature: API Automation - General APIs
  I want to use this template for my feature file

  #*********************************************************************************
  # 24 events
  #*********************************************************************************
  @API_24EvtSet1
  Scenario: 24-events - Event Set - All Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | API_Evt1 |
      | API_Evt2 |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | punch-api |
      | API_Evt1 | API_Evt1 |               1 |         1 |         1 |
      | API_Evt2 | API_Evt2 |               1 |         1 |         0 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API_Evt1 |                          1 | admin        |    1 |
      | API_Evt2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 324" in API sheet named "eventsSET".
    Then Verify API sheet named "eventsSET" and scenario start from "scenario 1" to "scenario 324" result "Pass".

  @API_24EvtSet2
  Scenario: 24-events - Event Set - ESS parameteres in GP Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | API_Evt3 |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | punch-api |
      | API_Evt3 | API_Evt3 |               1 |         1 |         1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API_Evt3 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 325" to "scenario 364" in API sheet named "eventsSET".
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit | TempThreshold | Validation         |
      | False      |          |               | Saved Successfully |
    Then Verify API sheet named "eventsSET" and scenario start from "scenario 325" to "scenario 364" result "Pass".

  #*********************************************************************************
  # 61 generate-password
  #*********************************************************************************
  @API_61generate-password1
  Scenario: 61-generate-password
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | API_GtPwd1 |
    And Create user from user configuration
      | userid     | AtdEnable | ESSEnable | BirthDate  | Validation         |
      | API_GtPwd1 | True      | True      | 16/07/1999 | Saved Successfully |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | API_GtPwd1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 16" in API sheet named "generate-password".
    Then Verify API sheet named "generate-password" and scenario start from "scenario 1" to "scenario 16" result "Pass".

  #*********************************************************************************
  # 62 change-password
  #*********************************************************************************
  @API_62change-password1
  Scenario: 62-change-password
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | API_ChPwd1 |
    And Create user from user configuration
      | userid     | AtdEnable | ESSEnable | BirthDate  | Validation         |
      | API_ChPwd1 | True      | True      | 16/07/1999 | Saved Successfully |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | API_ChPwd1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 27" in API sheet named "change-password".
    Then Verify API sheet named "change-password" and scenario start from "scenario 1" to "scenario 27" result "Pass".

  @API_62change-password2
  Scenario: 62-change-password OTP Authentication
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | API_ChPwd2 |
    And Create user from user configuration
      | userid     | AtdEnable | ESSEnable | BirthDate  | Validation         |
      | API_ChPwd2 | True      | True      | 16/07/1999 | Saved Successfully |
    And Set OTP Authentication For Setting Password "True" in GP
    When Execute scenario start from "scenario 28" to "scenario 30" in API sheet named "change-password".
    And Set OTP Authentication For Setting Password "False" in GP
    Then Verify API sheet named "change-password" and scenario start from "scenario 28" to "scenario 30" result "Pass".

  @API_62change-password3
  Scenario: 62-change-password Minimum Char and Medium level
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | API_ChPwd3 |
    And Create user from user configuration
      | userid     | AtdEnable | ESSEnable | BirthDate  | Validation         |
      | API_ChPwd3 | True      | True      | 16/07/1999 | Saved Successfully |
    And Set Minimum Required Characters "6" and Security Level "Medium" in GP for ESS
    When Execute scenario start from "scenario 31" to "scenario 34" in API sheet named "change-password".
    And Set Minimum Required Characters "5" and Security Level "Low" in GP for ESS
    Then Verify API sheet named "change-password" and scenario start from "scenario 31" to "scenario 34" result "Pass".

  @API_62change-password4
  Scenario: 62-change-password Minimum Char and High level
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | API_ChPwd4 |
    And Create user from user configuration
      | userid     | AtdEnable | ESSEnable | BirthDate  | Validation         |
      | API_ChPwd4 | True      | True      | 16/07/1999 | Saved Successfully |
    And Set Minimum Required Characters "6" and Security Level "High" in GP for ESS
    When Execute scenario start from "scenario 35" to "scenario 40" in API sheet named "change-password".
    And Set Minimum Required Characters "5" and Security Level "Low" in GP for ESS
    Then Verify API sheet named "change-password" and scenario start from "scenario 35" to "scenario 40" result "Pass".

  @API_62change-password5
  Scenario: 62-change-password Minimum Char and High level
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | API_ChPwd5 |
    And Create user from user configuration
      | userid     | AtdEnable | ESSEnable | BirthDate  | Validation         |
      | API_ChPwd5 | True      | True      | 16/07/1999 | Saved Successfully |
    And Set Deny Password Reuse "True" and Reuse Count For ESS Users "1" in GP
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | API_ChPwd5 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 41" to "scenario 43" in API sheet named "change-password".
    And Set Deny Password Reuse "False" and Reuse Count For ESS Users "1" in GP
    Then Verify API sheet named "change-password" and scenario start from "scenario 41" to "scenario 43" result "Pass".
