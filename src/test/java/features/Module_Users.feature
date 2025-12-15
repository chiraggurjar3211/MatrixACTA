@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @TestCase01
  Scenario: Create user and delete user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
       And Set SMS Configuration
    And Set Email Configuration
    When Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email          |
      | User01 | User01 |               1 |         1 |               1 |                  1 |    9898981231 | akshay.zankat@gmail.com |
    Then Delete user from user configuration page
      | UserID |
      | User01 |

  @TestCase02
  Scenario: Set password reset ESS password and try to login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User02 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email | job-assignment-type |
      | User02 | User02 |         1 |               1 |    9898981232 | ak@gmail.com   |                     |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | User02 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Reset ESS Password from user configuration
      | userid | Validation                  |
      | User02 | Password Reset Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation   |
      | User02   | admin    | Set Password |

  @TestCase03
  Scenario: Add user in blacklist from user configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User03 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email | job-assignment-type |
      | User03 | User03 |         1 |               1 |    9898981233 | aks@gmail.com  |                     |
    When Add user into blacklist from user configuration
      | userid | ReasonForBlacklist | Validation                 |
      | User03 | None               | User has been Blacklisted. |
    Then Verify User in User Configuration Page
      | UserID | Status                 |
      | User03 | Inactive (Blacklisted) |

  @TestCase04
  Scenario: Check in black list usergrid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User04 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email   | job-assignment-type |
      | User04 | User04 |         1 |               1 |    9898981234 | akshay@gmail.com |                     |
    When Add user into blacklist from user configuration
      | userid | ReasonForBlacklist | Validation                 |
      | User04 | None               | User has been Blacklisted. |
    Then Verify user in the Blacklist Users page
      | UserId |
      | User04 |

  @TestCase05
  Scenario: Restore user from blacklist and active user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User05 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email | job-assignment-type |
      | User05 | User05 |         1 |               1 |    9898981235 | ak1@gmail.com  |                     |
    And Add user into blacklist from user configuration
      | userid | ReasonForBlacklist | Validation                 |
      | User05 | None               | User has been Blacklisted. |
    And Restore user from Blacklist User page
      | UserID |
      | User05 |
    When Restored user displayed in the Restored User page
      | UserID |
      | User05 |
    Then Verify User in User Configuration Page
      | UserID | Status   |
      | User05 | Inactive |

  @TestCase06
  Scenario: Active user after restore from blacklist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User06 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email | job-assignment-type |
      | User06 | User06 |         1 |               1 |    9898981236 | ak2@gmail.com  |                     |
    And Add user into blacklist from user configuration
      | userid | ReasonForBlacklist | Validation                 |
      | User06 | None               | User has been Blacklisted. |
    And Restore user from Blacklist User page
      | UserID |
      | User06 |
    When Create user from user configuration
      | userid | Active | Validation         |
      | User06 | true   | Saved Successfully |
    Then Verify User in User Configuration Page
      | UserID | Status |
      | User06 | Active |

  @TestCase07
  Scenario: Generate Attendance Event via API
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User07 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   | punch-api |
      | User07 | User07 |         1 |               1 |                  1 |    9898981237 | test01@gmail.com |         1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | User07 |
    When Set event via Event Set API
      | Userid | event-date | event-time | Event-type |
      | User07 |          0 |     100000 |          0 |
    Then Verify user events for user "User07" and date from "0" to "0" in user configuration
      | event-date | event-time | EventType         |
      |          0 |       1000 | Attendance Events |

  @TestCase08
  Scenario: Generate Access Control Event via API
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User08 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   | punch-api |
      | User08 | User08 |         1 |               1 |                  1 |    9898981238 | test08@gmail.com |         1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | User08 |
    When Set event via Event Set API
      | Userid | event-date | event-time | Event-type |
      | User08 |          0 |     100000 |          1 |
    Then Verify user events for user "User08" and date from "0" to "0" in user configuration
      | event-date | event-time | EventType      |
      |          0 |       1000 | Access Control |

  @TestCase09
  Scenario: User - Module Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Active01 |
      | TAM01    |
      | ACM01    |
      | FVM01    |
      | CMM01    |
      | JPC01    |
      | ESS01    |
      | FR01     |
    And Create User via api
      | Id       | name     | Active |
      | Active01 | Active01 |      1 |
      | TAM01    | TAM01    |      1 |
      | ACM01    | ACM01    |      1 |
      | FVM01    | FVM01    |      1 |
      | CMM01    | CMM01    |      1 |
      | JPC01    | JPC01    |      1 |
      | ESS01    | ESS01    |      1 |
      | FR01     | FR01     |      1 |
    When Set User - Module Configuration
      | UserID   | Module | Value |
      | Active01 | Active | true  |
      | TAM01    | TAM    | true  |
      | ACM01    | ACM    | true  |
      | FVM01    | FVM    | true  |
      | CMM01    | CMM    | true  |
      | JPC01    | JPC    | true  |
      | ESS01    | ESS    | true  |
      | FR01     | FR     | true  |
    Then Verify User in User Configuration Page
      | UserID   | Status | EnableAccount | EnableAttendanceCalculation | EnableAdvanceAccessControl | CafeteriaEnable | JobCosting | EnableFVM | EnableFaceRecognition |
      | Active01 | Active |               |                             |                            |                 |            |           |                       |
      | TAM01    |        |               | True                        |                            |                 |            |           |                       |
      | ACM01    |        |               |                             | True                       |                 |            |           |                       |
      | FVM01    |        |               |                             |                            |                 |            | True      |                       |
      | CMM01    |        |               |                             |                            | True            |            |           |                       |
      | JPC01    |        |               |                             |                            |                 | Enabled    |           |                       |
      | ESS01    |        | True          |                             |                            |                 |            |           |                       |
      | FR01     |        |               |                             |                            |                 |            |           | True                  |

  @TestCase10
  Scenario: Download File - File Type= Sample file
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Download File from Import Data page
      | FileType    |
      | Sample file |

  @TestCase010
  Scenario: Download File - File Type= Detailed user sheet
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | User01 | User01 |               1 |         1 |               1 |                  1 |    9898981239 | ak4@gmail.com  |
    And Download File from Import Data page
      | FileType            |
      | Detailed user sheet |

  @TestCase11
  Scenario Outline: Users all fields filled in sheet and import
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | UM_U1  |
      | UM_U2  |
      | UM_U3  |
      | UM_U4  |
    When Import Data "User"
      | UserID | UserName | Full Name | OrganizationID | BranchID | DepartmentID | SectionID | CategoryID | GradeID | DesignationID | Custom Group 1ID | Custom Group 2ID | Custom Group 3ID | ScheduleGroupID | StartShift |
      | UM_U1  | UM_U1    | UM_U1     | ORG1           | BRC1     | DPT1         | SEC1      | CTG1       | GRD1    | DSG1          | CG1              | CG2              | CG3              | Schedule Group  | GS         |
      | UM_U2  | UM_U2    | UM_U2     | ORG1           | BRC1     | DPT1         | SEC1      | CTG1       | GRD1    | DSG1          | CG1              | CG2              | CG3              | Schedule Group  | GS         |
      | UM_U3  | UM_U3    | UM_U3     | ORG1           | BRC1     | DPT1         | SEC1      | CTG1       | GRD1    | DSG1          | CG1              | CG2              | CG3              | Schedule Group  | GS         |
      | UM_U4  | UM_U4    | UM_U4     | ORG1           | BRC1     | DPT1         | SEC1      | CTG1       | GRD1    | DSG1          | CG1              | CG2              | CG3              | Schedule Group  | GS         |
    And Import "<File Format>" and check Imported Data for "User"
      | UserID | Result  |
      | UM_U1  | Success |
      | UM_U2  | Success |
      | UM_U3  | Success |
      | UM_U4  | Success |
    Then Verify User in User Configuration Page
      | UserID | Status |
      | UM_U1  | Active |
      | UM_U2  | Active |
      | UM_U3  | Active |
      | UM_U4  | Active |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @TestCase12
  Scenario Outline: New Invite user send, resend and copy link
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Link from Invite User page
      | Name   |
      | Test01 |
    When Send link from Invite user tab
      | Name   | MobileNo   | EmailID          |
      | Test01 | 9876543210 | Test01@gmail.com |
    Then "<Action>" Link from Invite User page - "<Validation>"
      | Name   |
      | Test01 |

    Examples: 
      | Action    | Validation               |
      | Resend    | Resend Link Successfully |
      | Copy link | Link Copied              |

  @TestCase13
  Scenario: Access send link, login with OTP, Enter details in onboarding portal and submit detail
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Set custom fields for "Users" in GP
      | Active | FieldName | Type    | Upload | Mandatory |
      | True   | Field1    | Textbox | True   | false     |
      | True   | Field2    | Textbox | True   | false     |
      | True   | Field3    | Textbox | True   | false     |
      | True   | Field4    | Textbox | True   | false     |
      | True   | Field5    | Textbox | True   | false     |
    And Delete Link from Invite User page
      | Name   |
      | Test13 |
    And Send link from Invite user tab
      | Name   | MobileNo   | EmailID          |
      | Test13 | 9817117117 | Test13@gmail.com |
    And "Copy link" and open in new browser tab
      | Name   |
      | Test13 |
    And Go to previous Tab
    And Get OTP from Alert view for "9817117117"
    And Go to next Tab
    When click on Login after entering OTP in COSEC Onboarding Portal
      | Validation              |
      | COSEC Onboarding Portal |
    Then Enter details in employees onbording portal
      | Name   | DateOfBirth | JoiningDate | VehicleRegistrationNo | Field1  | FatherSpouseName |
      | Test13 | 23/02/2000  | 23/04/2023  |            1234567890 | Field01 | Father           |

  @TestCase14
  Scenario Outline: Verify details on COSEC invite user page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Set custom fields for "Users" in GP
      | Active | FieldName | Type    | Upload | Mandatory |
      | True   | Field1    | Textbox | True   | false     |
      | True   | Field2    | Textbox | True   | false     |
      | True   | Field3    | Textbox | True   | false     |
      | True   | Field4    | Textbox | True   | false     |
      | True   | Field5    | Textbox | True   | false     |
    And Delete Link from Invite User page
      | Name   |
      | Test14 |
    And Send link from Invite user tab
      | Name   | MobileNo   | EmailID          |
      | Test14 | 9812112112 | Test14@gmail.com |
    And "Copy link" and open in new browser tab
      | Name   |
      | Test14 |
    And Go to previous Tab
    And Get OTP from Alert view for "9812112112"
    And Go to next Tab
    And click on Login after entering OTP in COSEC Onboarding Portal
      | Validation              |
      | COSEC Onboarding Portal |
    When Enter details in employees onbording portal
      | Name   | DateOfBirth | JoiningDate | VehicleRegistrationNo | Field1  | FatherSpouseName |
      | Test14 | 23/02/2004  | 23/04/2023  |            2000059684 | Field01 | Father           |
    And Go to previous Tab
    Then Verify user details from Invite User Page
      | Name   | DateOfBirth | JoiningDate | VehicleRegistrationNo | Field1  | FatherSpouseName |
      | Test14 | 23/02/2004  | 23/04/2023  |            2000059684 | Field01 | Father           |

  @TestCase15
  Scenario Outline: Import Invite User and send link
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Import Data "Invite User"
      | Name   | MobileNo   | EmailID      |
      | UM_Ur1 | 9813113113 | u1@gmail.com |
      | UM_Ur2 | 9814114114 | u2@gmail.com |
      | UM_Ur3 | 9853115115 | u3@gmail.com |
      | UM_Ur4 | 9816116116 | u4@gmail.com |
    Then Import "<File Format>" and check Imported Data for "Invite User"
      | Name   | Success |
      | UM_Ur1 | Yes     |
      | UM_Ur2 | Yes     |
      | UM_Ur3 | Yes     |
      | UM_Ur4 | Yes     |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |
      | XLSX        |

  @TestCase16
  Scenario: Change Group of user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User16 |
    And Delete Enterprise group from Enterprise module
      | Group          | Name   | Validation           |
      | Organization   | Or02   | Deleted Successfully |
      | Branch         | Br02   | Deleted Successfully |
      | Department     | Dep02  | Deleted Successfully |
      | Designation    | Desi02 | Deleted Successfully |
      | Section        | Sec02  | Deleted Successfully |
      | Category       | Cate02 | Deleted Successfully |
      | Grade          | Gra02  | Deleted Successfully |
      | Custom Group 1 | Cu01   | Deleted Successfully |
      | Custom Group 2 | Cu02   | Deleted Successfully |
      | Custom Group 3 | Cu03   | Deleted Successfully |
    And Create user from user configuration
      | userid | Active | PersonalMobile | PersonalEmail    | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | User16 | true   |     9000000016 | User16@gmail.com | true      | true      | true      | true      | true               | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group          | Name   | Code | Validation         |
      | Organization   | Or02   |    2 | Saved Successfully |
      | Branch         | Br02   |    2 | Saved Successfully |
      | Department     | Dep02  |    2 | Saved Successfully |
      | Designation    | Desi02 |    2 | Saved Successfully |
      | Section        | Sec02  |    2 | Saved Successfully |
      | Category       | Cate02 |    2 | Saved Successfully |
      | Grade          | Gra02  |    2 | Saved Successfully |
      | Custom Group 1 | Cu01   |    2 | Saved Successfully |
      | Custom Group 2 | Cu02   |    2 | Saved Successfully |
      | Custom Group 3 | Cu03   |    2 | Saved Successfully |
    When Change group for "Single User" from Change Group page
      | UserId | ChangeGroup    | FromDate | NewGroup | Validation         |
      | User16 | Organization   |        0 | Or02     | Saved Successfully |
      | User16 | Branch         |        0 | Br02     | Saved Successfully |
      | User16 | Department     |        0 | Dep02    | Saved Successfully |
      | User16 | Designation    |        0 | Desi02   | Saved Successfully |
      | User16 | Section        |        0 | Sec02    | Saved Successfully |
      | User16 | Category       |        0 | Cate02   | Saved Successfully |
      | User16 | Grade          |        0 | Gra02    | Saved Successfully |
      | User16 | Custom Group 1 |        0 | Cu01     | Saved Successfully |
      | User16 | Custom Group 2 |        0 | Cu02     | Saved Successfully |
      | User16 | Custom Group 3 |        0 | Cu03     | Saved Successfully |
    Then Verify Enterprise Group in User Configuration Page
      | UserID | Organization | Branch | Department | Section | Category | Grade | Designation | CustomGroup1 | CustomGroup2 | CustomGroup3 |
      | User16 | Or02         | Br02   | Dep02      | Sec02   | Cate02   | Gra02 | Desi02      | Cu01         | Cu02         | Cu03         |

  @TestCase17
  Scenario: Delete User from Delete Users page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | User17_1 |
      | User17_2 |
      | User17_3 |
      | User17_4 |
    When Create user from user configuration
      | userid   | Active | PersonalMobile | PersonalEmail     | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | User17_1 | true   |     9000000117 | User117@gmail.com | true      | true      | true      | true      | true               | Saved Successfully |
      | User17_2 | true   |     9000000217 | User217@gmail.com | true      | true      | true      | true      | true               | Saved Successfully |
      | User17_3 | false  |     9000000317 | User317@gmail.com | true      | true      | true      | true      | true               | Saved Successfully |
      | User17_4 | false  |     9000000417 | User417@gmail.com | true      | true      | true      | true      | true               | Saved Successfully |
    Then Delete User from Delete Users Page
      | UserID   | SelectUsers | Delete         |
      | User17_1 | User Wise   | Active Users   |
      | User17_2 | User Wise   | Active Users   |
      | User17_3 | User Wise   | Inactive Users |
      | User17_4 | User Wise   | Inactive Users |

  @TestCase18
  Scenario: ESS Role Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User18 |
    And Create user from user configuration
      | userid | Active | PersonalMobile | PersonalEmail    | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | User18 | true   |     9000000018 | User18@gmail.com | true      | true      | true      | true      | true               | Saved Successfully |
    And Create ESS Role Rights from ESS Role Rights page
      | ESSRoleRights | Menu                  | Enable |
      | NewEss02      | Attendance Correction | true   |
    And Assign "NewEss02" ESS Role Rights to user from ESS Role Rights page
      | UserId |
      | User18 |
    Then Verify User in User Configuration Page
      | UserID | ESSRoleRights |
      | User18 | NewEss02      |

  @TestCase19
  Scenario: Check user Events Attendance event
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User19 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email     | punch-api |
      | User19 | User19 |               1 |         1 |               1 |                  1 |    9898981231 | akshay19@gmail.com |         1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | User19 |
    When Set event via Event Set API
      | Userid | event-date | event-time | Event-type |
      | User19 |          0 |     100000 |          0 |
    Then Verify user events for user "User19" and date from "0" to "0" from User Events page
      | event-date | event-time | EventType         |
      |          0 |     100000 | Attendance Events |

  @TestCase20
  Scenario: Check user Events Access control event
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User20 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email     | punch-api |
      | User20 | User20 |               1 |         1 |               1 |                  1 |    9898981232 | akshay20@gmail.com |         1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | User20 |
    When Set event via Event Set API
      | Userid | event-date | event-time | Event-type |
      | User20 |          0 |     100000 |          1 |
    Then Verify user events for user "User20" and date from "0" to "0" from User Events page
      | event-date | event-time | EventType      |
      |          0 |     100000 | Access Control |

  @TestCase21
  Scenario: Change UserID
    Given Open Cosec Web
    And Delete user via API
      | UserID     |
      | NewUsrId21 |
    And Create User via api
      | Id     | name   |
      | User21 | User21 |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Change User Id from Change User ID page
      | UserId | NewUserID  | Validation                     |
      | User21 | NewUsrId21 | Process Completed Successfully |
    Then Verify User ID from user configuration
      | UserID     | name   |
      | NewUsrId21 | User21 |

  @TestCase22
  Scenario: Health Declaration from SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User22 |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email     | punch-api |
      | User22 | User22 |               1 |         1 |               1 |                  1 |    9898981222 | akshay22@gmail.com |         1 |
    And Submit Health Declaration from Health Declaration Page
      | UserId | Date | Temperature | Fever | Validation         |
      | User22 |    0 |          98 | true  | Saved Successfully |
    Then Verify Health Record of "User22" and date from "0" to "0" in Health Records page
      | Date | Temperature | Symptoms |
      |    0 |          98 | Fever    |

  @TestCase23
  Scenario Outline: Import Health Records from Import Data page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | UM_User23  |
      | UM_User023 |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | UM_User23  | UM_User23  |               1 |         1 |               1 |                  1 |    9898981223 | UMUser23@gmail.com  |
      | UM_User023 | UM_User023 |               1 |         1 |               1 |                  1 |    9898981223 | UMUser023@gmail.com |
    When Import Data "Health Declaration"
      | UserID     | Date | Temperature | Symptom1 |
      | UM_User23  |    0 |        98.0 | Fever    |
      | UM_User023 |   -1 |        98.0 | Cough    |
    Then Import "<File Format>" and check Imported Data for "Health Declaration"
      | UserID     | Result  |
      | UM_User23  | Success |
      | UM_User023 | Success |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @TestCase24
  Scenario: Add user in blacklist from Blacklist Users page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User24 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email          | job-assignment-type |
      | User24 | User24 |         1 |               1 |    9898981231 | akshay.zankat@gmail.com |                     |
    When Add user into blacklist from Blacklist Users page
      | userid |
      | User24 |
    Then Verify User in User Configuration Page
      | UserID | Status                 |
      | User24 | Inactive (Blacklisted) |

  @TestCase25
  Scenario: Restore user from User Configuration page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User25 |
    And Create User via api
      | Id     | name   | ess-login | Ess-detail-edit | personal-cell | personal-email          | job-assignment-type |
      | User25 | User25 |         1 |               1 |    9898981231 | akshay.zankat@gmail.com |                     |
    When Add user into blacklist from Blacklist Users page
      | userid |
      | User25 |
    And Restore user from User Configuration page
      | UserID |
      | User25 |
    Then Verify User in User Configuration Page
      | UserID | Status |
      | User25 | Active |

  @TestCase26
  Scenario: Health Declaration - Self Declaration from ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | User26 |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And Create ESS Role Rights from ESS Role Rights page
      | ESSRoleRights | Menu | Enable |
      | EssRights1    |      | true   |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | ESSRoleRights | Validation         |
      | User26 | True   | True      | True      | True      | True      | EssRights1    | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | User26 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | User26   | admin    | Welcome User26 |
    And Submit Self Declaration from ESS
      | Date | Temperature | Fever | Validation         |
      |    0 |          98 | true  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify Health Record of "User26" and date from "0" to "0" in Health Records page
      | Date | Temperature | Symptoms |
      |    0 |          98 | Fever    |
     ##################### V20R09_CSR-4531 End ##########################
