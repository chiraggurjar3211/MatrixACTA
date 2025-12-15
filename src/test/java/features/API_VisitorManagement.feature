@tag
Feature: API Visitor Management
  I want to use this template for my feature file

  #*********************************************************************************
  # 88 visitor-pre-registration
  #*********************************************************************************
  @API_88visitor-pre-registration1
  Scenario: 88-visitor-pre-registration General SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98701 |
      |        98702 |
    And Delete user via API
      | UserID  |
      | API_VP1 |
      | API_VP2 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP1 | API_VP1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP2 | API_VP2 |               1 |         1 |               1 |                  1 |                    0 |
    When Execute scenario start from "scenario 1" to "scenario 6" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 1" to "scenario 6" result "Pass".

  @API_88visitor-pre-registration2
  Scenario: 88-visitor-pre-registration Visitor Pre-Registration Restriction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98703 |
    And Delete user via API
      | UserID  |
      | API_VP3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP3 | API_VP3 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid  | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | API_VP3 |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP3 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 7" to "scenario 16" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 7" to "scenario 16" result "Pass".

  @API_88visitor-pre-registration3
  Scenario: 88-visitor-pre-registration General ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98704 |
      |        98705 |
    And Delete user via API
      | UserID  |
      | API_VP4 |
      | API_VP5 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP4 | API_VP4 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP5 | API_VP5 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP4 |                          1 | admin        |    1 |
      | API_VP5 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 17" to "scenario 71" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 17" to "scenario 71" result "Pass".

  @API_88visitor-pre-registration4
  Scenario: 88-visitor-pre-registration Location cases ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98706 |
    And Delete user via API
      | UserID  |
      | API_VP6 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP6 | API_VP6 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP6 |                          1 | admin        |    1 |
    And Create Location from Location master
      | Code  | Name  | Type       | BLECode | validation         |
      | APIl1 | APIl1 | BLE-Beacon |    9876 | Saved Successfully |
    When Execute scenario start from "scenario 72" to "scenario 92" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 72" to "scenario 92" result "Pass".

  @API_88visitor-pre-registration5
  Scenario: 88-visitor-pre-registration Visitor Details ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98707 |
      |                98708 |
      |                98709 |
      | +91()968729514496872 |
      |               987010 |
      |                98711 |
      |                98712 |
      |                98713 |
      |                98714 |
      |                98715 |
      |                98716 |
      |                98717 |
      |                98718 |
      |                98719 |
      |                98720 |
    And Delete user via API
      | UserID  |
      | API_VP7 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP7 | API_VP7 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP7 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 93" to "scenario 160" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 93" to "scenario 160" result "Pass".

  @API_88visitor-pre-registration6
  Scenario: 88-visitor-pre-registration Hostid ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98721 |
      |        98722 |
    And Delete user via API
      | UserID        |
      | Mayank123/_.@ |
      | API_VP22      |
      | API_VP23      |
      | API_VP24      |
      | API_VP25      |
    And Create User via api
      | Id            | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | Mayank123/_.@ | API_VP21 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP22      | API_VP22 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP23      | API_VP23 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP24      | API_VP24 |               1 |         1 |               1 |                  1 |                    0 |
      | API_VP25      | API_VP25 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | Mayank123/_.@ |                          1 | admin        |    1 |
      | API_VP22      |                          1 | admin        |    1 |
      | API_VP23      |                          1 | admin        |    1 |
      | API_VP24      |                          1 | admin        |    1 |
      | API_VP25      |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 161" to "scenario 168" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 161" to "scenario 168" result "Pass".

  @API_88visitor-pre-registration7
  Scenario: 88-visitor-pre-registration GET
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98726 |
    And Delete user via API
      | UserID   |
      | API_VP26 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP26 | API_VP26 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API_VP26 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 169" to "scenario 201" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 169" to "scenario 201" result "Pass".

  @API_88visitor-pre-registration8
  Scenario: 88-visitor-pre-registration General SA UPDATE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98701 |
      |        98702 |
    And Delete user via API
      | UserID  |
      | API_VP1 |
      | API_VP2 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP1 | API_VP1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP2 | API_VP2 |               1 |         1 |               1 |                  1 |                    0 |
    When Execute scenario start from "scenario 202" to "scenario 207" in API sheet named "visitor-pre-registration".
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 202" to "scenario 207" result "Pass".

  @API_88visitor-pre-registration9
  Scenario: 88-visitor-pre-registration Visitor Pre-Registration Restriction UPDATE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98703 |
    And Delete user via API
      | UserID  |
      | API_VP3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP3 | API_VP3 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid  | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | API_VP3 |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP3 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 208" to "scenario 221" in API sheet named "visitor-pre-registration".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 208" to "scenario 221" result "Pass".

  @API_88visitor-pre-registration10
  Scenario: 88-visitor-pre-registration General ESS UPDATE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98704 |
      |        98705 |
    And Delete user via API
      | UserID  |
      | API_VP4 |
      | API_VP5 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP4 | API_VP4 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP5 | API_VP5 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP4 |                          1 | admin        |    1 |
      | API_VP5 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 222" to "scenario 277" in API sheet named "visitor-pre-registration".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 222" to "scenario 277" result "Pass".

  @API_88visitor-pre-registration11
  Scenario: 88-visitor-pre-registration Location cases ESS UPDATE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98706 |
    And Delete user via API
      | UserID  |
      | API_VP6 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP6 | API_VP6 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP6 |                          1 | admin        |    1 |
    And Create Location from Location master
      | Code  | Name  | Type       | BLECode | validation         |
      | APIl1 | APIl1 | BLE-Beacon |    9876 | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 278" to "scenario 304" in API sheet named "visitor-pre-registration".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 278" to "scenario 304" result "Pass".

  @API_88visitor-pre-registration12
  Scenario: 88-visitor-pre-registration Visitor Details ESS UPDATE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98707 |
      |                98708 |
      |                98709 |
      | +91()968729514496872 |
      |                98710 |
      |                98711 |
      |                98712 |
      |                98713 |
      |                98714 |
      |                98715 |
      |                98716 |
      |                98717 |
      |                98718 |
      |                98719 |
      |                98720 |
    And Delete user via API
      | UserID  |
      | API_VP7 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP7 | API_VP7 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_VP7 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 305" to "scenario 399" in API sheet named "visitor-pre-registration".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 305" to "scenario 399" result "Pass".

  @API_88visitor-pre-registration13
  Scenario: 88-visitor-pre-registration Hostid ESS UPDATE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98721 |
      |        98722 |
    And Delete user via API
      | UserID        |
      | Mayank123/_.@ |
      | API_VP22      |
      | API_VP23      |
      | API_VP24      |
      | API_VP25      |
    And Create User via api
      | Id            | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | Mayank123/_.@ | API_VP21 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP22      | API_VP22 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP23      | API_VP23 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VP24      | API_VP24 |               1 |         1 |               1 |                  1 |                    0 |
      | API_VP25      | API_VP25 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | Mayank123/_.@ |                          1 | admin        |    1 |
      | API_VP22      |                          1 | admin        |    1 |
      | API_VP23      |                          1 | admin        |    1 |
      | API_VP24      |                          1 | admin        |    1 |
      | API_VP25      |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 400" to "scenario 411" in API sheet named "visitor-pre-registration".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 400" to "scenario 411" result "Pass".

  @API_88visitor-pre-registration14
  Scenario: 88-visitor-pre-registration General DELETE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98726 |
    And Delete user via API
      | UserID    |
      | API_VP26  |
      | API_VPR26 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VP26  | API_VP26  |               1 |         1 |               1 |                  1 |                    1 |
      | API_VPR26 | API_VPR26 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1      | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_VPR26        |        1 | API_VPR26 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | API_VP26 | API_VPR26      |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_VP26  |                          1 | admin        |    1 |
      | API_VPR26 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 434" to "scenario 440" in API sheet named "visitor-pre-registration".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "visitor-pre-registration" and scenario start from "scenario 434" to "scenario 440" result "Pass".

  #*********************************************************************************
  # 91 visitor-pre-registration-approval
  #*********************************************************************************
  @API_91visitor-pre-registration-approval1
  Scenario: 91-visitor-pre-registration-approval General SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |         9861 |
    And Delete user via API
      | UserID   |
      | API_VPA1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VPA1 | API_VPA1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API_VPA1 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 1" to "scenario 29" in API sheet named "visitor-pre-registration-approv".
    Then Verify API sheet named "visitor-pre-registration-approv" and scenario start from "scenario 1" to "scenario 29" result "Pass".

  @API_91visitor-pre-registration-approval2
  Scenario: 91-visitor-pre-registration-approval General ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |         9862 |
    And Delete user via API
      | UserID    |
      | API_VPA2  |
      | API_VPA3  |
      | API_VPAR1 |
      | API_VPAR2 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_VPAR1 | API_VPAR1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_VPAR2 | API_VPAR2 |               1 |         1 |               1 |                  1 |                    1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | API_VPRIC1 | All Sequential    | true       | true       | False      | False      | False      |                | Saved Successfully |
      | API_VPRIC2 | All               | true       | true       | False      | False      | False      | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1      | RIC2      | RIC3 | RIC4 | RIC5 | Validation         |
      | API_VPRIC1       | API_VPRIC1 | API_VPAR1 | API_VPAR2 |      |      |      | Saved Successfully |
      | API_VPRIC2       | API_VPRIC2 | API_VPAR1 | API_VPAR2 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid   | AtdEnable | ESSEnable | ReportingGroup | AuthorizedHostUser | Validation         |
      | API_VPA2 | True      | True      | API_VPRIC1     | True               | Saved Successfully |
      | API_VPA3 | True      | True      | API_VPRIC2     | True               | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_VPA2  |                          1 | admin        |    1 |
      | API_VPA3  |                          1 | admin        |    1 |
      | API_VPAR1 |                          1 | admin        |    1 |
      | API_VPAR2 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Not Required                 |
    When Execute scenario start from "scenario 30" to "scenario 54" in API sheet named "visitor-pre-registration-approv".
    Then Verify API sheet named "visitor-pre-registration-approv" and scenario start from "scenario 30" to "scenario 54" result "Pass".

  #*********************************************************************************
  # 90 additional-visitors-details
  #*********************************************************************************
  @API_90additional-visitors-details_1
  Scenario: 90-additional-visitors-details General Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |   9876543101 |
      |   9876543102 |
      |   9876543103 |
      |   9876543104 |
      |   9876543105 |
      |   9876543106 |
      |   9876543107 |
      |   9876543108 |
      |   9876543109 |
      |   9876543110 |
      |   9876543111 |
      |   9876543112 |
      |   9876543113 |
      |   9876543114 |
      |   9876543115 |
      |   9876543116 |
      |   9876543117 |
      |   9876543118 |
      |   9876543119 |
      |   9876543120 |
      |   9876543121 |
    And Delete user via API
      | UserID |
      | h1     |
      | h2     |
      | h3     |
      | h4     |
    And Create User via api
      | Id | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | h1 | h1   |               1 |         1 |               1 |                  1 |                    1 |
      | h2 | h2   |               1 |         1 |               1 |                  1 |                    1 |
      | h3 | h3   |               1 |         1 |               1 |                  1 |                    1 |
      | h4 | h4   |               1 |         1 |               1 |                  1 |                    0 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Always                       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | h1     |                          1 | admin        |    1 |
      | h2     |                          1 | admin        |    1 |
      | h3     |                          1 | admin        |    1 |
      | h4     |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 20" in API sheet named "additional-visitors-details".
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "additional-visitors-details" and scenario start from "scenario 1" to "scenario 20" result "Pass".

  @API_90_1additional-visitors-details_2
  Scenario: 90-additional-visitors-details General Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |   9876543101 |
      |   9876543102 |
      |   9876543103 |
      |   9876543104 |
      |   9876543105 |
      |   9876543106 |
      |   9876543107 |
      |   9876543108 |
      |   9876543109 |
      |   9876543110 |
      |   9876543111 |
      |   9876543112 |
      |   9876543113 |
      |   9876543114 |
      |   9876543115 |
      |   9876543116 |
      |   9876543117 |
      |   9876543118 |
      |   9876543119 |
      |   9876543120 |
      |   9876543121 |
    And Delete user via API
      | UserID |
      | h1     |
      | h2     |
      | h3     |
      | h4     |
    And Create User via api
      | Id | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | h1 | h1   |               1 |         1 |               1 |                  1 |                    1 |
      | h2 | h2   |               1 |         1 |               1 |                  1 |                    1 |
      | h3 | h3   |               1 |         1 |               1 |                  1 |                    1 |
      | h4 | h4   |               1 |         1 |               1 |                  1 |                    0 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | h1     |                          1 | admin        |    1 |
      | h2     |                          1 | admin        |    1 |
      | h3     |                          1 | admin        |    1 |
      | h4     |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 21" to "scenario 21" in API sheet named "additional-visitors-details".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "additional-visitors-details" and scenario start from "scenario 21" to "scenario 21" result "Pass".

  #*********************************************************************************
  # 98 visitor-invites-approval
  #*********************************************************************************
  @API_98_visitor-invites-approval_Sc1
  Scenario: API_98_visitor-invites-approval  - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID   |
      | API98_h1 |
      | API98_h2 |
      | API98_h3 |
      | API98_h4 |
    And Delete visitor via API
      | mobilenumber |
      |   7600000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   7600000011 | visitor76@gmail.com |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Always                       |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API98_h1 | API98_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h2 | API98_h2 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h3 | API98_h3 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h4 | API98_h4 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API98_h1 |                          1 | admin        |    1 |
      | API98_h2 |                          1 | admin        |    1 |
      | API98_h3 |                          1 | admin        |    1 |
      | API98_h4 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7600000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7600000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name   | Organization | Email               | validation                                   |
      | VIS_76 | Matrix       | visitor76@gmail.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor76@gmail.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API98_h1 |         0 |         0 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         1 |         1 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         2 |         2 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         3 |         3 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         4 |         4 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         5 |         5 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         6 |         6 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         7 |         7 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         8 |         8 |         1 |      30 | automation | Visit Created |
      | API98_h1 |         9 |         9 |         1 |      30 | automation | Visit Created |
    And Go to previous Tab
    And Execute scenario start from "scenario 1" to "scenario 10" in API sheet named "visitor-invites-approval".
    Then Verify API sheet named "visitor-invites-approval" and scenario start from "scenario 1" to "scenario 10" result "Pass".

  @API_98_visitor-invites-approval_Sc2
  Scenario: API_98_visitor-invites-approval  - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID   |
      | API98_h1 |
      | API98_h2 |
      | API98_h3 |
      | API98_h4 |
    And Delete visitor via API
      | mobilenumber |
      |   7600000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   7600000011 | visitor76@gmail.com |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Always                       |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API98_h1 | API98_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h2 | API98_h2 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h3 | API98_h3 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h4 | API98_h4 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API98_h1 |                          1 | admin        |    1 |
      | API98_h2 |                          1 | admin        |    1 |
      | API98_h3 |                          1 | admin        |    1 |
      | API98_h4 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7600000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7600000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name   | Organization | Email               | validation                                   |
      | VIS_76 | Matrix       | visitor76@gmail.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor76@gmail.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API98_h1 |        10 |        10 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        11 |        11 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        12 |        12 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        13 |        13 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        14 |        14 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        15 |        15 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        16 |        16 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        17 |        17 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        18 |        18 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        19 |        19 |         1 |      30 | automation | Visit Created |
      | API98_h1 |        24 |        24 |         1 |      30 | automation | Visit Created |
    And Go to previous Tab
    And Execute scenario start from "scenario 11" to "scenario 21" in API sheet named "visitor-invites-approval".
    Then Verify API sheet named "visitor-invites-approval" and scenario start from "scenario 11" to "scenario 21" result "Pass".

  @API_98_visitor-invites-approval_Sc3
  Scenario: API_98_visitor-invites-approval  - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID   |
      | API98_h1 |
      | API98_h2 |
      | API98_h3 |
      | API98_h4 |
    And Delete visitor via API
      | mobilenumber |
      |   7600000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   7600000011 | visitor76@gmail.com |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Always                       |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API98_h1 | API98_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h2 | API98_h2 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h3 | API98_h3 |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h4 | API98_h4 |               1 |         1 |               1 |                  1 |                    0 |
    And Create user from user configuration
      | userid   | MaxDaysBeforeAllowingVisit | MinDaysBeforeAllowingVisit | Validation         |
      | API98_h1 |                          5 |                          2 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API98_h1 |                          1 | admin        |    1 |
      | API98_h2 |                          1 | admin        |    1 |
      | API98_h3 |                          1 | admin        |    1 |
      | API98_h4 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7600000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7600000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name   | Organization | Email               | validation                                   |
      | VIS_76 | Matrix       | visitor76@gmail.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor76@gmail.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API98_h1 |         0 |         0 |         1 |      30 | automation | Visit Created |
    And Go to previous Tab
    And Execute scenario start from "scenario 22" to "scenario 22" in API sheet named "visitor-invites-approval".
    Then Verify API sheet named "visitor-invites-approval" and scenario start from "scenario 22" to "scenario 22" result "Pass".

  @API_98_visitor-invites-approval_Sc4
  Scenario: API_98_visitor-invites-approval  - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID          |
      | API98_h1        |
      | API98_h2        |
      | API98_h3        |
      | API98_h4        |
      | 123456789012345 |
    And Delete visitor via API
      | mobilenumber |
      |   7600000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   7600000011 | visitor76@gmail.com |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Always                        | Always                       |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API98_h1        | API98_h1        |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h2        | API98_h2        |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h3        | API98_h3        |               1 |         1 |               1 |                  1 |                    1 |
      | API98_h4        | API98_h4        |               1 |         1 |               1 |                  1 |                    0 |
      | 123456789012345 | 123456789012345 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | API98_h1        |                          1 | admin        |    1 |
      | API98_h2        |                          1 | admin        |    1 |
      | API98_h3        |                          1 | admin        |    1 |
      | API98_h4        |                          1 | admin        |    1 |
      | 123456789012345 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7600000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7600000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name   | Organization | Email               | validation                                   |
      | VIS_76 | Matrix       | visitor76@gmail.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor76@gmail.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API98_h1 |         0 |         0 |         1 |      30 | automation | Visit Created |
    And Go to previous Tab
    And Execute scenario start from "scenario 23" to "scenario 23" in API sheet named "visitor-invites-approval".
    Then Verify API sheet named "visitor-invites-approval" and scenario start from "scenario 23" to "scenario 23" result "Pass".

  #*********************************************************************************
  # 99 security-approval
  #*********************************************************************************
  @API_99security-approval_1
  Scenario: 99-security-approval - Host initiated Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98501 |
    And Delete user via API
      | UserID   |
      | API99_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API99_h1 | API99_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API99_h1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 24" in API sheet named "security-approval".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "security-approval" and scenario start from "scenario 1" to "scenario 24" result "Pass".

  @API_99security-approval_2
  Scenario: 99-security-approval - Host initiated Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98501 |
    And Delete user via API
      | UserID   |
      | API99_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API99_h1 | API99_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API99_h1 |                          1 | admin        |    1 |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email           | host-id  | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              2 | API99_V1     | Matrix            |     98501 | API99_1@api.com | API99_h1 | API99_h1  | Default Location   |
    And Wait for "3" min
    When Execute scenario start from "scenario 25" to "scenario 26" in API sheet named "security-approval".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "security-approval" and scenario start from "scenario 25" to "scenario 26" result "Pass".

  @API_99security-approval_3
  Scenario: 99-security-approval - Host initiated Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98501 |
    And Delete user via API
      | UserID   |
      | API99_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API99_h1 | API99_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Always                        | Not Required                 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API99_h1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 27" to "scenario 31" in API sheet named "security-approval".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "security-approval" and scenario start from "scenario 27" to "scenario 31" result "Pass".

  @API_99security-approval_4
  Scenario: 99-security-approval - Visitor initiated Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete visitor via API
      | mobilenumber |
      |        98501 |
    And Delete user via API
      | UserID   |
      | API99_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API99_h1 | API99_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API99_h1 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |       98501 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "98501"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name     | Organization | Email           | validation                                   |
      | API99_V1 | Matrix       | API99_1@api.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "API99_1@api.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API99_h1 |         0 |         0 |         5 |       7 | automation | Visit Created |
      | API99_h1 |         1 |         1 |         5 |       7 | automation | Visit Created |
      | API99_h1 |         2 |         2 |         5 |       7 | automation | Visit Created |
    And Go to previous Tab
    When Execute scenario start from "scenario 32" to "scenario 53" in API sheet named "security-approval".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "security-approval" and scenario start from "scenario 32" to "scenario 53" result "Pass".

  @API_99security-approval_5
  Scenario: 99-security-approval - Visitor initiated Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete visitor via API
      | mobilenumber |
      |        98501 |
    And Delete user via API
      | UserID   |
      | API99_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API99_h1 | API99_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API99_h1 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |       98501 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "98501"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name     | Organization | Email           | validation                                   |
      | API99_V1 | Matrix       | API99_1@api.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "API99_1@api.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API99_h1 |         0 |         0 |         1 |       2 | automation | Visit Created |
    And Go to previous Tab
    When Visitor Invites Approval API
      | user-type | verdict | StartDate | EndDate | HostID   | approvedBy |
      |         0 |       1 |         0 |       0 | API99_h1 | API99_h1   |
    And Wait for "3" min
    When Execute scenario start from "scenario 54" to "scenario 55" in API sheet named "security-approval".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "security-approval" and scenario start from "scenario 54" to "scenario 55" result "Pass".

  @API_99security-approval_6
  Scenario: 99-security-approval - Visitor initiated Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete visitor via API
      | mobilenumber |
      |        98501 |
    And Delete user via API
      | UserID   |
      | API99_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API99_h1 | API99_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Always                       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API99_h1 |                          1 | admin        |    1 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |       98501 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "98501"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name     | Organization | Email           | validation                                   |
      | API99_V1 | Matrix       | API99_1@api.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "API99_1@api.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId   | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | API99_h1 |         0 |         0 |         5 |       7 | automation | Visit Created |
    And Go to previous Tab
    When Execute scenario start from "scenario 56" to "scenario 60" in API sheet named "security-approval".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    Then Verify API sheet named "security-approval" and scenario start from "scenario 56" to "scenario 60" result "Pass".

  #*********************************************************************************
  # 100 visit-state
  #*********************************************************************************
  @API_100visit-state_1
  Scenario: 100-visit-state - Security Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98401 |
      |        98402 |
    And Delete Station Location from VMS module
      | Name      |
      | API100_S1 |
    And Delete user via API
      | UserID    |
      | API100_h1 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API100_h1 | API100_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API100_h1 |                          1 | admin        |    1 |
    And Create station location from visitor module
      | Name      | SiteName | Validation         |
      | API100_S1 | Site-1   | Saved Successfully |
    When Execute scenario start from "scenario 1" to "scenario 43" in API sheet named "visit-state".
    Then Verify API sheet named "visit-state" and scenario start from "scenario 1" to "scenario 43" result "Pass".

  @API_100visit-state_2
  Scenario: 100-visit-state - Security Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98401 |
    And Delete user via API
      | UserID    |
      | API100_h1 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API100_h1 | API100_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit | AllowEPassGenerationBeforeDuration |
      | False                           | Not Required                  | Not Required                 |                                  2 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API100_h1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 44" to "scenario 47" in API sheet named "visit-state".
    And Wait for "3" min
    When Execute scenario start from "scenario 48" to "scenario 49" in API sheet named "visit-state".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit | AllowEPassGenerationBeforeDuration |
      | False                           | Not Required                  | Not Required                 |                                    |
    Then Verify API sheet named "visit-state" and scenario start from "scenario 44" to "scenario 49" result "Pass".

  @API_100visit-state_3
  Scenario: 100-visit-state - Security Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98401 |
    And Delete user via API
      | UserID    |
      | API100_h1 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API100_h1 | API100_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API100_h1 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit | AutoProfileAssignment | MatchingLevel |
      | False                           | Not Required                  | Not Required                 | True                  | Organization  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | A100O1 | A100O1 | Saved Successfully |
    And Create user from user configuration
      | userid    | Organization | Validation         |
      | API100_h1 | A100O1       | Saved Successfully |
    When Execute scenario start from "scenario 50" to "scenario 53" in API sheet named "visit-state".
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit | AutoProfileAssignment |
      | False                           | Not Required                  | Not Required                 | False                 |
    Then Verify API sheet named "visit-state" and scenario start from "scenario 50" to "scenario 53" result "Pass".

  @API_100visit-state_4
  Scenario: 100-visit-state - Security Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98401 |
    And Delete Station Location from VMS module
      | Name      |
      | API100_S2 |
    And Delete user via API
      | UserID    |
      | API100_h1 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API100_h1 | API100_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API100_h1 |                          1 | admin        |    1 |
    And Create Visit Template "API100_S2"
      | Panel | FieldName   | Type | Mandatory | Active |
      | Visit | Vehicle No. |      | True      | True   |
    And Create station location from visitor module
      | Name      | SiteName | VisitTemplate | Validation         |
      | API100_S2 | Site-1   | API100_S2     | Saved Successfully |
    When Execute scenario start from "scenario 104" to "scenario 107" in API sheet named "visit-state".
    Then Verify API sheet named "visit-state" and scenario start from "scenario 104" to "scenario 107" result "Pass".

  @API_100visit-state_5
  Scenario: 100-visit-state - Host Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98403 |
    And Delete user via API
      | UserID    |
      | API100_h2 |
      | API100_h3 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API100_h2 | API100_h2 |               1 |         1 |               1 |                  1 |                    1 |
      | API100_h3 | API100_h3 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API100_h2 |                          1 | admin        |    1 |
      | API100_h3 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 54" to "scenario 103" in API sheet named "visit-state".
    Then Verify API sheet named "visit-state" and scenario start from "scenario 54" to "scenario 103" result "Pass".

  #*********************************************************************************
  # 93 visitor-registration
  #*********************************************************************************
  @API_93visitor-registration_1
  Scenario: 93-visitor-registration - SET GET SA Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98404 |
      |                98405 |
      | 0123456789-+()012345 |
      |                98408 |
      |                98409 |
      |                98410 |
      |                98411 |
      |                98412 |
      |                98413 |
      |                98414 |
      |                98415 |
      |                98416 |
      |                98417 |
      |                98418 |
      |                98419 |
      |                98420 |
      |                98421 |
      |                98422 |
      |                98424 |
    When Execute scenario start from "scenario 1" to "scenario 88" in API sheet named "visitor-registration".
    Then Verify API sheet named "visitor-registration" and scenario start from "scenario 1" to "scenario 88" result "Pass".

  @API_93visitor-registration_2
  Scenario: 93-visitor-registration - SET GET SA Case2 Custom Field
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98423 |
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | True   | Custom Field 1 | Textbox | False  | True      |
      | True   | Custom Field 2 | Textbox | False  | True      |
      | True   | Custom Field 3 | Textbox | False  | True      |
      | True   | Custom Field 4 | Date    | False  | True      |
      | True   | Custom Field 5 | Date    | False  | True      |
    When Execute scenario start from "scenario 89" to "scenario 117" in API sheet named "visitor-registration".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | False  | Custom Field 1 | Textbox | True   | False     |
      | False  | Custom Field 2 | Textbox | True   | False     |
      | False  | Custom Field 3 | Textbox | True   | False     |
      | False  | Custom Field 4 | Textbox | True   | False     |
      | False  | Custom Field 5 | Textbox | True   | False     |
    Then Verify API sheet named "visitor-registration" and scenario start from "scenario 89" to "scenario 117" result "Pass".

  @API_93visitor-registration_3
  Scenario: 93-visitor-registration - SET GET ESS Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98404 |
      |                98405 |
      | 0123456789-+()012345 |
      |                98408 |
      |                98409 |
      |                98410 |
      |                98411 |
      |                98412 |
      |                98413 |
      |                98414 |
      |                98415 |
      |                98416 |
      |                98417 |
      |                98418 |
      |                98419 |
      |                98420 |
      |                98421 |
      |                98422 |
      |                98424 |
    And Delete user via API
      | UserID   |
      | API93_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API93_h1 | API93_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API93_h1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 118" to "scenario 205" in API sheet named "visitor-registration".
    Then Verify API sheet named "visitor-registration" and scenario start from "scenario 118" to "scenario 205" result "Pass".

  @API_93visitor-registration_4
  Scenario: 93-visitor-registration - SET GET ESS Case2 Custom Field
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98423 |
    And Delete user via API
      | UserID   |
      | API93_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API93_h1 | API93_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API93_h1 |                          1 | admin        |    1 |
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | True   | Custom Field 1 | Textbox | False  | True      |
      | True   | Custom Field 2 | Textbox | False  | True      |
      | True   | Custom Field 3 | Textbox | False  | True      |
      | True   | Custom Field 4 | Date    | False  | True      |
      | True   | Custom Field 5 | Date    | False  | True      |
    When Execute scenario start from "scenario 206" to "scenario 234" in API sheet named "visitor-registration".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | False  | Custom Field 1 | Textbox | True   | False     |
      | False  | Custom Field 2 | Textbox | True   | False     |
      | False  | Custom Field 3 | Textbox | True   | False     |
      | False  | Custom Field 4 | Textbox | True   | False     |
      | False  | Custom Field 5 | Textbox | True   | False     |
    Then Verify API sheet named "visitor-registration" and scenario start from "scenario 206" to "scenario 234" result "Pass".

  @API_93visitor-registration_5
  Scenario: 93-visitor-registration - SET GET Visitor Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98404 |
      |                98405 |
      | 0123456789-+()012345 |
      |                98408 |
      |                98409 |
      |                98410 |
      |                98411 |
      |                98412 |
      |                98413 |
      |                98414 |
      |                98415 |
      |                98416 |
      |                98417 |
      |                98418 |
      |                98419 |
      |                98420 |
      |                98421 |
      |                98422 |
    When Execute scenario start from "scenario 235" to "scenario 306" in API sheet named "visitor-registration".
    Then Verify API sheet named "visitor-registration" and scenario start from "scenario 235" to "scenario 306" result "Pass".

  @API_93visitor-registration_6
  Scenario: 93-visitor-registration - SET GET Visitor Case2 Custom Field
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98423 |
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | True   | Custom Field 1 | Textbox | False  | True      |
      | True   | Custom Field 2 | Textbox | False  | True      |
      | True   | Custom Field 3 | Textbox | False  | True      |
      | True   | Custom Field 4 | Date    | False  | True      |
      | True   | Custom Field 5 | Date    | False  | True      |
    When Execute scenario start from "scenario 307" to "scenario 330" in API sheet named "visitor-registration".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | False  | Custom Field 1 | Textbox | True   | False     |
      | False  | Custom Field 2 | Textbox | True   | False     |
      | False  | Custom Field 3 | Textbox | True   | False     |
      | False  | Custom Field 4 | Textbox | True   | False     |
      | False  | Custom Field 5 | Textbox | True   | False     |
    Then Verify API sheet named "visitor-registration" and scenario start from "scenario 307" to "scenario 330" result "Pass".

  #*********************************************************************************
  # 97 visitor
  #*********************************************************************************
  @API_97visitor_1
  Scenario: 97-visitor - SET GET SA Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98404 |
      |                98405 |
      | 0123456789-+()012345 |
      |                98408 |
      |                98409 |
      |                98410 |
      |                98411 |
      |                98412 |
      |                98413 |
      |                98414 |
      |                98415 |
      |                98416 |
      |                98417 |
      |                98418 |
      |                98419 |
      |                98420 |
      |                98421 |
      |                98422 |
      |                98424 |
      |                98425 |
    When Execute scenario start from "scenario 1" to "scenario 138" in API sheet named "visitor".
    Then Verify API sheet named "visitor" and scenario start from "scenario 1" to "scenario 138" result "Pass".

  @API_97visitor_2
  Scenario: 97-visitor - SET GET SA Case2 Custom Field
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98423 |
    When Execute scenario start from "scenario 139" to "scenario 139" in API sheet named "visitor".
    Then Verify API sheet named "visitor" and scenario start from "scenario 139" to "scenario 139" result "Pass".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | True   | Custom Field 1 | Textbox | False  | True      |
      | True   | Custom Field 2 | Textbox | False  | True      |
      | True   | Custom Field 3 | Textbox | False  | True      |
      | True   | Custom Field 4 | Date    | False  | True      |
      | True   | Custom Field 5 | Date    | False  | True      |
    When Execute scenario start from "scenario 140" to "scenario 169" in API sheet named "visitor".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | False  | Custom Field 1 | Textbox | True   | False     |
      | False  | Custom Field 2 | Textbox | True   | False     |
      | False  | Custom Field 3 | Textbox | True   | False     |
      | False  | Custom Field 4 | Textbox | True   | False     |
      | False  | Custom Field 5 | Textbox | True   | False     |
    Then Verify API sheet named "visitor" and scenario start from "scenario 140" to "scenario 169" result "Pass".

  @API_97visitor_3
  Scenario: 97-visitor - SET GET ESS Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber         |
      |                98404 |
      |                98405 |
      | 0123456789-+()012345 |
      |                98408 |
      |                98409 |
      |                98410 |
      |                98411 |
      |                98412 |
      |                98413 |
      |                98414 |
      |                98415 |
      |                98416 |
      |                98417 |
      |                98418 |
      |                98419 |
      |                98420 |
      |                98421 |
      |                98422 |
      |                98424 |
      |                98425 |
      |                98426 |
    And Delete user via API
      | UserID   |
      | API97_h1 |
      | API97_h2 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API97_h1 | API97_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API97_h2 | API97_h2 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API97_h1 |                          1 | admin        |    1 |
      | API97_h2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 170" to "scenario 310" in API sheet named "visitor".
    Then Verify API sheet named "visitor" and scenario start from "scenario 170" to "scenario 310" result "Pass".

  @API_97visitor_4
  Scenario: 97-visitor - SET GET ESS Case2 Custom Field
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98423 |
    And Delete user via API
      | UserID   |
      | API97_h1 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API97_h1 | API97_h1 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API97_h1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 311" to "scenario 311" in API sheet named "visitor".
    Then Verify API sheet named "visitor" and scenario start from "scenario 311" to "scenario 311" result "Pass".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | True   | Custom Field 1 | Textbox | False  | True      |
      | True   | Custom Field 2 | Textbox | False  | True      |
      | True   | Custom Field 3 | Textbox | False  | True      |
      | True   | Custom Field 4 | Date    | False  | True      |
      | True   | Custom Field 5 | Date    | False  | True      |
    When Execute scenario start from "scenario 312" to "scenario 341" in API sheet named "visitor".
    And Set custom fields for "Visitors" in GP
      | Active | FieldName      | Type    | Upload | Mandatory |
      | False  | Custom Field 1 | Textbox | True   | False     |
      | False  | Custom Field 2 | Textbox | True   | False     |
      | False  | Custom Field 3 | Textbox | True   | False     |
      | False  | Custom Field 4 | Textbox | True   | False     |
      | False  | Custom Field 5 | Textbox | True   | False     |
    Then Verify API sheet named "visitor" and scenario start from "scenario 312" to "scenario 341" result "Pass".

  @API_97visitor_5
  Scenario: 97-visitor - DELETE Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |        98427 |
    And Delete user via API
      | UserID   |
      | API97_h1 |
      | API97_h2 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API97_h1 | API97_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API97_h2 | API97_h2 |               1 |         1 |               1 |                  1 |                    0 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API97_h1 |                          1 | admin        |    1 |
      | API97_h2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 342" to "scenario 351" in API sheet named "visitor".
    Then Verify API sheet named "visitor" and scenario start from "scenario 342" to "scenario 351" result "Pass".

  #*********************************************************************************
  # 95 vms-setting
  #*********************************************************************************
  @API_95vms-setting_1
  Scenario: 95-vms-setting SET GET SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | API95_h1 |
      | API95_h2 |
      | API95_h3 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API95_h1 | API95_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API95_h2 | API95_h2 |               1 |         1 |               1 |                  1 |                    0 |
      | API95_h3 | API95_h3 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API95_h1 |                          1 | admin        |    1 |
      | API95_h2 |                          1 | admin        |    1 |
      | API95_h3 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 113" in API sheet named "vms-setting".
    Then Verify API sheet named "vms-setting" and scenario start from "scenario 1" to "scenario 113" result "Pass".

  @API_95vms-setting_2
  Scenario: 95-vms-setting SET GET ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | API95_h1 |
      | API95_h2 |
      | API95_h3 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API95_h1 | API95_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API95_h2 | API95_h2 |               1 |         1 |               1 |                  1 |                    0 |
      | API95_h3 | API95_h3 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | API95_h1 |                          1 | admin        |    1 |
      | API95_h2 |                          1 | admin        |    1 |
      | API95_h3 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 114" to "scenario 231" in API sheet named "vms-setting".
    Then Verify API sheet named "vms-setting" and scenario start from "scenario 114" to "scenario 231" result "Pass".

  #*********************************************************************************
  # 111 Invite_Visitor
  #*********************************************************************************
  @API_111Invite_Visitor_Sc1
  Scenario: 111-Invite_Visitor_Sc1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API111_h1 |
      | API111_h2 |
      | API111_h4 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API111_h1 | API111_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API111_h2 | API111_h2 |               1 |         1 |               1 |                  1 |                    1 |
      | API111_h4 | API111_h4 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Location from Location master
      | Code  | Name  | Type       | BLEName | validation         |
      | bleD1 | bleD1 | BLE-Device | bleD1   | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API111_h1 |                          1 | admin        |    1 |
      | API111_h2 |                          1 | admin        |    1 |
      | API111_h4 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 368" in API sheet named "invite-visitor".
    Then Verify API sheet named "invite-visitor" and scenario start from "scenario 1" to "scenario 368" result "Pass".

  @API_111Invite_Visitor_Sc2
  Scenario: 111-Invite_Visitor_Sc2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API111_h1 |
      | API111_h2 |
      | API111_h4 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API111_h1 | API111_h1 |               1 |         1 |               1 |                  1 |                    1 |
      | API111_h2 | API111_h2 |               1 |         1 |               1 |                  1 |                    1 |
      | API111_h4 | API111_h4 |               1 |         1 |               1 |                  1 |                    0 |
    And Create user from user configuration
      | userid    | MaxDaysBeforeAllowingVisit | MinDaysBeforeAllowingVisit | Validation         |
      | API111_h1 |                          5 |                          2 | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API111_h1 |                          1 | admin        |    1 |
      | API111_h2 |                          1 | admin        |    1 |
      | API111_h4 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 369" to "scenario 386" in API sheet named "invite-visitor".
    Then Verify API sheet named "invite-visitor" and scenario start from "scenario 369" to "scenario 386" result "Pass".

  #*********************************************************************************
  # 110 visitor-profile
  #*********************************************************************************
  @API_110visitor-profile_1
  Scenario: API_110visitor-profile GET SET DELETE Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor profile via API
      | id          |
      | API110_VP4  |
      | API110_VP9  |
      | API110_VP10 |
    And Delete Device from Device Configuration
      | DeviceName        |
      | api110ArgoFacePD1 |
      | api110IO800PD2    |
      | api110Panel200_1  |
    And Add Device from device module
      | DeviceType | PanelName        | PanelDoorType | DeviceName        | MACAddress        | IPAddress       |
      | Panel200   |                  |               | api110Panel200_1  | 11:12:14:11:12:15 |                 |
      | PanelDoor  | api110Panel200_1 | ARGO FACE     | api110ArgoFacePD1 | 10:11:14:10:11:16 | 191.193.191.193 |
      | PanelDoor  | api110Panel200_1 | ARC IO 800    | api110IO800PD2    | 10:11:14:10:11:17 | 191.193.191.194 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName        | Validation         |
      | api110d1        | api110ArgoFacePD1 | Saved Successfully |
      | api110d2        | api110ArgoFacePD1 | Saved Successfully |
    And Add Smart Access Route
      | Name | smartAccessRouteActive | sequencedRouteActive | restrictions | resetOnStartLevel | deviceName        |
      | S1   | True                   | True                 |              |                   | api110ArgoFacePD1 |
    When Execute scenario start from "scenario 1" to "scenario 518" in API sheet named "visitor-profile".
    Then Verify API sheet named "visitor-profile" and scenario start from "scenario 1" to "scenario 518" result "Pass".
