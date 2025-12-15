@tag
Feature: Title of your feature
  I want to use this template for my feature file

  #*********************************************************************************
  # 118 health-declaration
  #*********************************************************************************
  @118APIHD1
  Scenario: Health Declaration for Temperature Unit = Fahrenheit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | APIHDUser1 |
      | APIHDUser2 |
      | APIHDRIC1  |
      | APIHDRIC2  |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And Update ESS Role Rights "Default Rights" from ESS Role Rights page
      | Menu             | Enable |
      | Health Records   | true   |
      | Self Declaration | true   |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       | punch-api |
      | APIHDUser1 | APIHDUser1 |               1 |         1 |               1 |                  1 |    9011111112 | apihduser1@gmail.com |         1 |
      | APIHDUser2 | APIHDUser2 |               1 |         1 |               1 |                  1 |    9011111113 | apihduser2@gmail.com |         1 |
      | APIHDRIC2  | APIHDRIC2  |               1 |         1 |               1 |                  1 |               |                      |         1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | APIHDUser1 |                          1 | admin        |    1 |
      | APIHDUser2 |                          1 | admin        |    1 |
      | APIHDRIC2  |                          1 | admin        |    1 |
    When Execute scenario start from "Scenario 1" to "Scenario 50" in API sheet named "health-declaration".
    Then Verify API sheet named "health-declaration" and scenario start from "Scenario 1" to "Scenario 50" result "Pass".

  @118APIHD2
  Scenario: Health Declaration for Self Declaration = false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | APIHDUser1 |
      | APIHDUser2 |
      | APIHDRIC1  |
      | APIHDRIC2  |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And Update ESS Role Rights "Default Rights" from ESS Role Rights page
      | Menu             | Enable |
      | Health Records   | true   |
      | Self Declaration | false  |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       | punch-api |
      | APIHDUser1 | APIHDUser1 |               1 |         1 |               1 |                  1 |    9011111112 | apihduser1@gmail.com |         1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | APIHDUser1 |                          1 | admin        |    1 |
    When Execute scenario start from "Scenario 51" to "Scenario 51" in API sheet named "health-declaration".
    Then Verify API sheet named "health-declaration" and scenario start from "Scenario 51" to "Scenario 51" result "Pass".

  @118APIHD3
  Scenario: Health Declaration for Temperature Unit = Celsius
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | APIHDUser1 |
      | APIHDUser2 |
      | APIHDRIC2  |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit     | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Celsius (°C) |          36.5 | True           | Any one           | Saved Successfully |
    And Update ESS Role Rights "Default Rights" from ESS Role Rights page
      | Menu             | Enable |
      | Health Records   | true   |
      | Self Declaration | true   |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       | punch-api |
      | APIHDUser1 | APIHDUser1 |               1 |         1 |               1 |                  1 |    9011111112 | apihduser1@gmail.com |         1 |
      | APIHDUser2 | APIHDUser2 |               1 |         1 |               1 |                  1 |    9011111112 | apihduser1@gmail.com |         1 |
      | APIHDRIC2  | APIHDRIC2  |               1 |         1 |               1 |                  1 |               |                      |         1 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | APIHDUser1 |                          1 | admin        |    1 |
      | APIHDUser2 |                          1 | admin        |    1 |
      | APIHDRIC2  |                          1 | admin        |    1 |
    When Execute scenario start from "Scenario 52" to "Scenario 64" in API sheet named "health-declaration".
    Then Verify API sheet named "health-declaration" and scenario start from "Scenario 52" to "Scenario 64" result "Pass".

  #*********************************************************************************
  # 10 user
  #*********************************************************************************
  @API_10user
  Scenario: 10-user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Set custom fields for "Users" in GP
      | Active | FieldName | Type    | Upload | Mandatory |
      | True   |           | Textbox | True   | False     |
      | True   |           | Date    | True   | False     |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1      | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_UserRIC1     | AnyOne     | API_10_U1 |      |      |      |      | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 1" to "scenario 1" in API sheet named "user".
    Then Verify API sheet named "user" and scenario start from "scenario 1" to "scenario 1" result "Pass".

  @API_10user_Sc2
  Scenario: 10-user_Sc2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Set User Parameters in GP
      | DateofBirthMandatory | BirthAge |
      | True                 |     18,0 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 2" to "scenario 2" in API sheet named "user".
    And Set User Parameters in GP
      | DateofBirthMandatory | BirthAge |
      | False                |          |
    Then Verify API sheet named "user" and scenario start from "scenario 2" to "scenario 2" result "Pass".

  @API_10user_Sc3
  Scenario: 10-user_Sc3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Set User Parameters in GP
      | AadhaarNoMandatory |
      | True               |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 3" to "scenario 3" in API sheet named "user".
    And Set User Parameters in GP
      | AadhaarNoMandatory |
      | False              |
    Then Verify API sheet named "user" and scenario start from "scenario 3" to "scenario 3" result "Pass".

  @API_10user_Sc4
  Scenario: 10-user_Sc4 ----> Always Fail in COSEC VYOM due to Active directory is not supported in VYOM
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Login Parameters in GP
      | LoginViaActiveDirectory | ActiveDirectoryServerAddress | ActiveDirectoryDomainName |
      | True                    | 192.168.126.126,126          | Matrix                    |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 4" to "scenario 4" in API sheet named "user".
    And Set Login Parameters in GP
      | LoginViaActiveDirectory | ActiveDirectoryServerAddress | ActiveDirectoryDomainName |
      | False                   |                              |                           |
    Then Verify API sheet named "user" and scenario start from "scenario 4" to "scenario 4" result "Pass".

  @API_10user_Sc5
  Scenario: 10-user_Sc5
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Create Bus Route from TnA Module
      | Name | busRouteActive |
      | B1   | True           |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 5" to "scenario 5" in API sheet named "user".
    Then Verify API sheet named "user" and scenario start from "scenario 5" to "scenario 5" result "Pass".

  @API_10user_Sc6
  Scenario: 10-user_Sc6
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_1 | ARC IO 800    | AcsProflIO800PD2    | 10:11:12:10:11:17 | 191.191.191.194 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | d1              | AcsProflArgoFacePD1 | Saved Successfully |
      | d2              | AcsProflArgoFacePD1 | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 6" to "scenario 6" in API sheet named "user".
    Then Verify API sheet named "user" and scenario start from "scenario 6" to "scenario 6" result "Pass".

  @API_10user_Sc7
  Scenario: 10-user_Sc7
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Add Smart Access Route
      | Name | smartAccessRouteActive | sequencedRouteActive | restrictions | resetOnStartLevel | deviceID |
      | S1   | True                   | True                 |              |                   |        1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 7" to "scenario 7" in API sheet named "user".
    Then Verify API sheet named "user" and scenario start from "scenario 7" to "scenario 7" result "Pass".

  @API_10user_Sc8
  Scenario: 10-user_Sc8
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | API_10_U1 |
      | API_10_U2 |
    And Create User via api
      | Id        | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | API_10_U1 | APIUser1 |               1 |         1 |               1 |                  1 |                    1 |
      | API_10_U2 | APIUser2 |               1 |         1 |               1 |                  1 |                    1 |
    And Create Week Off Group
      | WOName | OffDay1 | validation         |
      | WG1    | Sunday  | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | API_10_U1 |                          1 | admin        |    1 |
      | API_10_U2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 8" to "scenario 8" in API sheet named "user".
    Then Verify API sheet named "user" and scenario start from "scenario 8" to "scenario 8" result "Pass".

  #*********************************************************************************
  # 129 reporting-group
  #*********************************************************************************
  @API_129reporting-group1
  Scenario: 129-reporting-group - SET GET UPDATE DELETE
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | APIRIC          |
      | APIRIC1         |
      | APIRIC2         |
      | Api/_1.@:RicMV1 |
      | Api/_1.@:RicMV2 |
      | Api/_1.@:RicMV3 |
      | Api/_1.@:RicMV4 |
      | Api/_1.@:RicMV5 |
      | Api/_1.@:RicMV6 |
    And Delete Reporting Group via API
      | GroupName                      |
      | May ank()[]_-.1234567812345678 |
      | RG502                          |
      | RG503                          |
      | RG504                          |
      | RG505                          |
      | RG506                          |
      | RG507                          |
      | RG508                          |
      | May ank()[]_-.1234567812345679 |
      | RG602                          |
      | RG603                          |
      | RG604                          |
      | RG605                          |
      | RG606                          |
      | RG607                          |
      | RG608                          |
      | RG609                          |
      | RG610                          |
      | rg9998update                   |
      | rg9999                         |
    And Delete Approval policy from user module
      | Name                           |
      | MMMMMMMMMMMMMMMMMMMM()_-][.123 |
      | MMMMMMMMMMMMMMMMMMMM()_-][.124 |
    And Create Approval Policy from Approval Policy page
      | PolicyName                     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | MMMMMMMMMMMMMMMMMMMM()_-][.123 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
      | MMMMMMMMMMMMMMMMMMMM()_-][.124 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 1" to "scenario 252" in API sheet named "reporting-group".
    Then Verify API sheet named "reporting-group" and scenario start from "Scenario 1" to "Scenario 252" result "Pass".
