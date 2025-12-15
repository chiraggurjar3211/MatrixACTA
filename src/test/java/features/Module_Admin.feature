@AdminModule
Feature: Default

  @ASA-16 @CS-1
  Scenario Outline: Roles&Rights - for View Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_1" from System Accounts page
    And Delete Role and Right "R_1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Menu   | View | Add   | Edit  | Delete | Validation         |
      | R_1      | <Module> | <Menu> | true | false | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_1 | R_1  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_1  | admin    | Welcome SA_CS_1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Shifts and Schedules       | Shift Configuration |
      | Access Control             | Functional Group    |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Cafeteria Management       | Items               |
      | Visitor Management         | Visitor Profile     |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |

  @CS-2
  Scenario Outline: Roles&Rights - for Add Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_2" from System Accounts page
    And Delete Role and Right "R_2" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Menu   | View | Add  | Edit  | Delete | Validation         |
      | R_2      | <Module> | <Menu> | true | true | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_2 | R_2  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_2 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_2  | admin    | Welcome SA_CS_2 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add  | Edit  | Delete |
      | <Menu> | true | true | false | false  |

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Shifts and Schedules       | Shift Configuration |
      | Access Control             | Functional Group    |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Cafeteria Management       | Items               |
      | Visitor Management         | Visitor Profile     |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |

  @CS-3
  Scenario Outline: Roles&Rights - for Edit Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_3" from System Accounts page
    And Delete Role and Right "R_3" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Menu   | View | Add   | Edit | Delete | Validation         |
      | R_3      | <Module> | <Menu> | true | false | true | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_3 | R_3  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_3 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_3  | admin    | Welcome SA_CS_3 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit | Delete |
      | <Menu> | true | false | true | false  |

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Shifts and Schedules       | Shift Configuration |
      | Access Control             | Functional Group    |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Cafeteria Management       | Items               |
      | Visitor Management         | Visitor Profile     |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |

  @CS-4
  Scenario Outline: Roles&Rights - for Delete Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_4" from System Accounts page
    And Delete Role and Right "R_4" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Menu   | View | Add   | Edit  | Delete | Validation         |
      | R_4      | <Module> | <Menu> | true | false | false | true   | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_4 | R_4  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_4 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_4  | admin    | Welcome SA_CS_4 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | true   |

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Shifts and Schedules       | Shift Configuration |
      | Access Control             | Functional Group    |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Cafeteria Management       | Items               |
      | Visitor Management         | Visitor Profile     |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |

  @CS-5
  Scenario Outline: Roles&Rights - for View Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_5" from System Accounts page
    And Delete Role and Right "R_5" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Menu   | View  | Add   | Edit  | Delete | Validation         |
      | R_5      | <Module> | <Menu> | false | false | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_5 | R_5  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_5 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_5  | admin    | Welcome SA_CS_5 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View  | Add   | Edit  | Delete |
      | <Menu> | false | false | false | false  |

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Shifts and Schedules       | Shift Configuration |
      | Access Control             | Functional Group    |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Cafeteria Management       | Items               |
      | Visitor Management         | Visitor Profile     |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |

  @CS-6
  Scenario Outline: Roles&Rights - Copy Right As Per = SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_6" from System Accounts page
    And Delete Role and Right "R_6" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | CopyRightAsPer       | Validation         |
      | R_6      | System Administrator | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_6 | R_6  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_6 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_6  | admin    | Welcome SA_CS_6 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add  | Edit | Delete |
      | <Menu> | true | true | true | true   |

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Shifts and Schedules       | Shift Configuration |
      | Access Control             | Functional Group    |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Cafeteria Management       | Items               |
      | Visitor Management         | Visitor Profile     |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |

  @CS-7
  Scenario Outline: Roles&Rights - Module rights - Hide module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_7" from System Accounts page
    And Delete Role and Right "R_7" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Hide | Validation         |
      | R_7      | <Module> | true | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | SA_CS_7 | R_7  | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_7 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_7  | admin    | Welcome SA_CS_7 |
    Then Verify "<Module>" Module is displayed or Not - "false"

    Examples: 
      | Module                     |
      | Admin                      |
      | Users                      |
      | Devices                    |
      | Enterprise Structure       |
      | Shifts and Schedules       |
      | Access Control             |
      | Time and Attendance        |
      | Leave Management           |
      | Cafeteria Management       |
      | Visitor Management         |
      | Contract Worker Management |
      | Job Processing and Costing |
      | Field Visit Management     |
      | Report Builder             |

  @CS-8
  Scenario Outline: Set Launch Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_8" from System Accounts page
    And Create New System Account User
      | SAUser  | Role                 | Module   | Menu   | ValidationMessage  |
      | SA_CS_8 | System Administrator | <Module> | <Menu> | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_8 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_8  | admin    | Welcome SA_CS_8 |
    Then Verify Launch Page should be "<Menu>"

    Examples: 
      | Module                     | Menu                |
      | Admin                      | System Accounts     |
      | Users                      | Reporting Group     |
      | Devices                    | Device Group        |
      | Enterprise Structure       | Organization        |
      | Report Builder             | Report Builder      |
      | Access Control             | Functional Group    |
      | Shifts and Schedules       | Shift Configuration |
      | Time and Attendance        | Attendance Policy   |
      | Leave Management           | Leave               |
      | Contract Worker Management | Contractor Types    |
      | Job Processing and Costing | Cost Centre         |
      | Field Visit Management     | Task                |
      | Visitor Management         | Visitor Profile     |
      | Cafeteria Management       | Items               |

  @CS-9
  Scenario: Group-Wise Rights - SA role
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | U1_CS_09 |
      | U2_CS_09 |
    And Delete System Account User "SA_CS_9" from System Accounts page
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG_1 | Deleted Successfully |
      | Organization | ORG_2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG_1 | ORG_1 | Saved Successfully |
      | Organization | ORG_2 | ORG_2 | Saved Successfully |
    And Create User via api
      | Id       | name     |
      | U1_CS_09 | U1_CS_09 |
      | U2_CS_09 | U2_CS_09 |
    And Assign groups to user from user configuration
      | UserID   | Organization | Validation         |
      | U1_CS_09 | ORG_1        | Saved Successfully |
      | U2_CS_09 | ORG_2        | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role                 | ValidationMessage  |
      | SA_CS_9 | System Administrator | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_9 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | SA_CS_9  | admin    | Welcome SA_CS_9 |
    Then Verify User in User Configuration Page
      | UserID   | Status |
      | U1_CS_09 | Active |
      | U2_CS_09 | Active |

  @CS-10
  Scenario: Group-Wise Rights - 2 org
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | U1_CS_10 |
      | U2_CS_10 |
    And Delete System Account User "SA_CS_10" from System Accounts page
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG_3 | Deleted Successfully |
      | Organization | ORG_4 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG_3 | ORG_3 | Saved Successfully |
      | Organization | ORG_4 | ORG_4 | Saved Successfully |
    And Create User via api
      | Id       | name     |
      | U1_CS_10 | U1_CS_10 |
      | U2_CS_10 | U2_CS_10 |
    And Assign groups to user from user configuration
      | UserID   | Organization | Validation         |
      | U1_CS_10 | ORG_3        | Saved Successfully |
      | U2_CS_10 | ORG_4        | Saved Successfully |
    And Create New System Account User
      | SAUser   | Role                 | ValidationMessage  |
      | SA_CS_10 | System Administrator | Saved Successfully |
    And Assign "Group Wise" rights to system account "SA_CS_10"
      | Group        | GroupName | Validation         |
      | Organization | ORG_3     | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_10 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation       |
      | SA_CS_10 | admin    | Welcome SA_CS_10 |
    Then Verify User in User Configuration Page
      | UserID   | Status                               |
      | U1_CS_10 | Active                               |
      | U2_CS_10 | You do not have rights for this user |

  @CS-11
  Scenario: Group-Wise Rights - Org Brc
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | U1_CS_11 |
      | U2_CS_11 |
    And Delete System Account User "SA_CS_11" from System Accounts page
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG_5 | Deleted Successfully |
      | Organization | ORG_6 | Deleted Successfully |
      | Branch       | BRC_1 | Deleted Successfully |
      | Branch       | BRC_2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG_5 | ORG_5 | Saved Successfully |
      | Organization | ORG_6 | ORG_6 | Saved Successfully |
      | Branch       | BRC_1 | BRC_1 | Saved Successfully |
      | Branch       | BRC_2 | BRC_2 | Saved Successfully |
    And Create User via api
      | Id       | name     |
      | U1_CS_11 | U1_CS_11 |
      | U2_CS_11 | U2_CS_11 |
    And Assign groups to user from user configuration
      | UserID   | Organization | Branch | Validation         |
      | U1_CS_11 | ORG_5        | BRC_1  | Saved Successfully |
      | U2_CS_11 | ORG_6        | BRC_2  | Saved Successfully |
    And Create New System Account User
      | SAUser   | Role                 | ValidationMessage  |
      | SA_CS_11 | System Administrator | Saved Successfully |
    And Assign "Group Wise" rights to system account "SA_CS_11"
      | Group        | GroupName |
      | Organization | ORG_5     |
      | Branch       | BRC_1     |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_11 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation       |
      | SA_CS_11 | admin    | Welcome SA_CS_11 |
    Then Verify User in User Configuration Page
      | UserID   | Status                               |
      | U1_CS_11 | Active                               |
      | U2_CS_11 | You do not have rights for this user |

  @CS-12
  Scenario: Group-Wise Rights - org true
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | U1_CS_12 |
    And Delete System Account User "SA_CS_12" from System Accounts page
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG_7 | Deleted Successfully |
      | Organization | ORG_8 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG_7 | ORG_7 | Saved Successfully |
      | Organization | ORG_8 | ORG_8 | Saved Successfully |
    And Create New System Account User
      | SAUser   | Role                 | ValidationMessage  |
      | SA_CS_12 | System Administrator | Saved Successfully |
    And Assign "Group Wise" rights to system account "SA_CS_12"
      | Group        | GroupName | Default |
      | Organization | ORG_7     | false   |
      | Organization | ORG_8     | true    |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_12 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation       |
      | SA_CS_12 | admin    | Welcome SA_CS_12 |
    Then Create user from user configuration
      | userid   | Validation         |
      | U1_CS_12 | Saved Successfully |
    And Verify Enterprise Group in User Configuration Page
      | UserID   | Organization | Branch | Department | Section | Category | Grade | Designation | CustomGroup1 | CustomGroup2 | CustomGroup3 |
      | U1_CS_12 | ORG_8        |        |            |         |          |       |             |              |              |              |

   @CS-13
  Scenario: Report Export Output In PDF Only checkbox = Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_13 |
    And Delete System Account User "SA_CS_13" from System Accounts page
    And Create User via api
      | Id       | name     |
      | Ur_CS_13 | Ur_CS_13 |
    And Create New System Account User
      | SAUser   | Role                 | ReportInPDF | ValidationMessage  |
      | SA_CS_13 | System Administrator | true        | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_13 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_CS_13 | admin    | Welcome SA_CS_13 |
    When Generate "Contact Info" Report Export Output In PDF Only for Admin Module
        | SelectUsers |
        | All         |
    Then Verify file format of export report
      | ExportTo |
      | PDF      |

  @CS-14
  Scenario: Report Export Output In PDF Only checkbox = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_14 |
    And Delete System Account User "SA_CS_14" from System Accounts page
    And Create User via api
      | Id       | name     |
      | Ur_CS_14 | Ur_CS_14 |
    And Create New System Account User
      | SAUser   | Role                 | ReportInPDF | ValidationMessage  |
      | SA_CS_14 | System Administrator | false       | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_14 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_CS_14 | admin    | Welcome SA_CS_14 |
    When Generate "Contact Info" Report Export Output In PDF Only for Admin Module
        | SelectUsers |
        | All         |
    Then Verify file format of export report
      | ExportTo             |
      | PDF, XLS, XLSX, DOCX |

  @CS-15
  Scenario: Global Policy - Auto Generate User ID = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |
    Then UserID field Editable or not in User Configuration page while add user
      | Editable |
      | True     |
    And Create user from user configuration
      | userid   | name     | Active | Validation         |
      | Ur_CS_15 | Ur_CS_15 | True   | Saved Successfully |

  @CS-16
  Scenario: Global Policy - Auto Generate User ID = Enable - Format = NUMVAL
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | Ur1    |
    When Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID | IDFormat   | NumValLength |
      | True               | Ur*NUMVAL* |            1 |
    Then UserID field Editable or not in User Configuration page while add user
      | Editable |
      | False    |
    And Create user from user configuration
      | userid   | Active | Validation         |
      | Ur_CS_16 | True   | Saved Successfully |
    And Verify User ID from user configuration
      | UserID | name     |
      | Ur1    | Ur_CS_16 |
    And Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |

  @CS-17
  Scenario: Global Policy - Auto Generate User ID = Enable - Format = *ORGID**BRCCODE**NUMVAL*
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur1BRC11 |
    When Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID | IDFormat                   | NumValLength |
      | True               | Ur*ORGID**BRCCODE**NUMVAL* |            1 |
    Then UserID field Editable or not in User Configuration page while add user
      | Editable |
      | False    |
    And Create user from user configuration
      | userid   | Active | Validation         |
      | U1_CS_17 | True   | Saved Successfully |
    And Verify User ID from user configuration
      | UserID   | name     |
      | Ur1BRC11 | U1_CS_17 |
    And Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |

  @CS-18
  Scenario: Global Policy - Auto Generate User ID = Enable - Format = *ORGCODE**BRCID**NUMVAL*
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UrORG111 |
    When Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID | IDFormat                   | NumValLength |
      | True               | Ur*ORGCODE**BRCID**NUMVAL* |            1 |
    Then UserID field Editable or not in User Configuration page while add user
      | Editable |
      | False    |
    And Create user from user configuration
      | userid   | Active | Validation         |
      | U1_CS_18 | True   | Saved Successfully |
    And Verify User ID from user configuration
      | UserID   | name     |
      | UrORG111 | U1_CS_18 |
    And Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |

  @CS-19
  Scenario: Global Policy - Auto Generate User ID = Enable - NumValLength=1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | Ur_CS_191  |
      | Ur_CS_192  |
      | Ur_CS_193  |
      | Ur_CS_194  |
      | Ur_CS_195  |
      | Ur_CS_196  |
      | Ur_CS_197  |
      | Ur_CS_198  |
      | Ur_CS_199  |
      | Ur_CS_1910 |
    When Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID | IDFormat         | NumValLength |
      | True               | Ur_CS_19*NUMVAL* |            1 |
    Then Create user from user configuration
      | userid    | Active | Validation                                           |
      | U1_CS_19  | True   | Saved Successfully                                   |
      | U2_CS_19  | True   | Saved Successfully                                   |
      | U3_CS_19  | True   | Saved Successfully                                   |
      | U4_CS_19  | True   | Saved Successfully                                   |
      | U5_CS_19  | True   | Saved Successfully                                   |
      | U6_CS_19  | True   | Saved Successfully                                   |
      | U7_CS_19  | True   | Saved Successfully                                   |
      | U8_CS_19  | True   | Saved Successfully                                   |
      | U9_CS_19  | True   | Saved Successfully                                   |
      | U10_CS_19 | True   | Maximum ID Creation limit reached for this ID Format |
    And Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |

  @CS-20
  Scenario: Global Policy - Auto Generate User ID = Enable - ZeroPadding Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | Ur_CS_2001 |
    When Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID | IDFormat         | ZeroPadding | NumValLength |
      | True               | Ur_CS_20*NUMVAL* | True        |            2 |
    Then Create user from user configuration
      | userid   | Active | Validation         |
      | U1_CS_20 | True   | Saved Successfully |
    And Verify User ID from user configuration
      | UserID     | name     |
      | Ur_CS_2001 | U1_CS_20 |
    And Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |

  @CS-21
  Scenario: Global Policy - Custom Fields - upload
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_21 |
    And Set Auto Generate User ID configurations in GP
      | AutoGenerateUserID |
      | False              |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | False  | False     |
      | False  | PanCard     | Textbox | False  | False     |
      | False  | VotingCard  | Textbox | False  | False     |
      | False  | CitizenCard | Textbox | False  | False     |
      | False  | IDCard      | Textbox | False  | False     |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_21 | Ur_CS_21 |               1 |         1 |               1 |                  1 |
    When Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | True   | Adhar       | Textbox | True   | True      |
      | True   | PanCard     | Textbox | True   | True      |
      | True   | VotingCard  | Textbox | True   | True      |
      | True   | CitizenCard | Textbox | True   | True      |
      | True   | IDCard      | Textbox | True   | True      |
    Then Verify custom field of 'Ur_CS_21' in User configuration page
      | FieldName   | Validate | Type    | Upload | Mandatory |
      | Adhar       | True     | Textbox | True   | True      |
      | PanCard     | True     | Textbox | True   | True      |
      | VotingCard  | True     | Textbox | True   | True      |
      | CitizenCard | True     | Textbox | True   | True      |
      | IDCard      | True     | Textbox | True   | True      |
    And Upload user custom field documents from user configuration
      | userid   | name     | Active | Adhar      | PanCard    | VotingCard | CitizenCard | IDCard     | Validation         |
      | Ur_CS_21 | Ur_CS_21 | True   | UploadFile | UploadFile | UploadFile | UploadFile  | UploadFile | Saved Successfully |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |

  @CS-22
  Scenario: Global Policy - Custom Fields - verify
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_22 |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | False  | False     |
      | False  | PanCard     | Textbox | False  | False     |
      | False  | VotingCard  | Textbox | False  | False     |
      | False  | CitizenCard | Textbox | False  | False     |
      | False  | IDCard      | Textbox | False  | False     |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_22 | Ur_CS_22 |               1 |         1 |               1 |                  1 |
    When Set custom fields for "Users" in GP
      | Active | FieldName   | Type | Upload | Mandatory |
      | True   | Adhar       | Date | True   | True      |
      | True   | PanCard     | Date | True   | True      |
      | True   | VotingCard  | Date | True   | True      |
      | True   | CitizenCard | Date | True   | True      |
      | True   | IDCard      | Date | True   | True      |
    Then Verify custom field of 'Ur_CS_22' in User configuration page
      | FieldName   | Validate | Type | Upload | Mandatory |
      | Adhar       | True     | Date | True   | True      |
      | PanCard     | True     | Date | True   | True      |
      | VotingCard  | True     | Date | True   | True      |
      | CitizenCard | True     | Date | True   | True      |
      | IDCard      | True     | Date | True   | True      |
    And Update user custom fields from user configuration
      | userid   | name     | Active | Adhar      | PanCard    | VotingCard | CitizenCard | IDCard     | Validation         |
      | Ur_CS_22 | Ur_CS_22 | True   | 01/01/2023 | 01/01/2023 | 01/01/2023 | 01/01/2023  | 01/01/2023 | Saved Successfully |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |

  @CS-23
  Scenario: Global Policy - Custom Fields - verify false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_23 |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | False  | False     |
      | False  | PanCard     | Textbox | False  | False     |
      | False  | VotingCard  | Textbox | False  | False     |
      | False  | CitizenCard | Textbox | False  | False     |
      | False  | IDCard      | Textbox | False  | False     |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_23 | Ur_CS_23 |               1 |         1 |               1 |                  1 |
    When Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | True   | Adhar       | Textbox | False  | False     |
      | True   | PanCard     | Textbox | False  | False     |
      | True   | VotingCard  | Textbox | False  | False     |
      | True   | CitizenCard | Textbox | False  | False     |
      | True   | IDCard      | Textbox | False  | False     |
    Then Verify custom field of 'Ur_CS_23' in User configuration page
      | FieldName   | Validate | Type    | Upload | Mandatory |
      | Adhar       | True     | Textbox | False  | False     |
      | PanCard     | True     | Textbox | False  | False     |
      | VotingCard  | True     | Textbox | False  | False     |
      | CitizenCard | True     | Textbox | False  | False     |
      | IDCard      | True     | Textbox | False  | False     |
    And Create user from user configuration
      | userid    | name      | Active | Validation         |
      | Ur_CS_231 | Ur_CS_231 | True   | Saved Successfully |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |

  @CS-25
  Scenario: Global Policy - Custom Fields - disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_25 |
   And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | False  | False     |
      | False  | PanCard     | Textbox | False  | False     |
      | False  | VotingCard  | Textbox | False  | False     |
      | False  | CitizenCard | Textbox | False  | False     |
      | False  | IDCard      | Textbox | False  | False     |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_25 | Ur_CS_25 |               1 |         1 |               1 |                  1 |
    When Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
    Then Verify custom field of 'Ur_CS_25' in User configuration page
      | FieldName   | Validate | Type    | Upload | Mandatory |
      | Adhar       | False    | Textbox | True   | True      |
      | PanCard     | False    | Textbox | True   | True      |
      | VotingCard  | False    | Textbox | True   | True      |
      | CitizenCard | False    | Textbox | True   | True      |
      | IDCard      | False    | Textbox | True   | True      |

  #@CS-28
  #Scenario: Global Policy - Sorting Field In Report - User ID
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set Sorting Field In Report configuration in GP
      #| SortingField | Validation         |
      #| User ID      | Saved Successfully |
    #And Create user from user configuration
      #| userid   | name   | Active | Validation         |
      #| U1_CS_28 | Chhaya | True   | Saved Successfully |
      #| U2_CS_28 | Nirali | True   | Saved Successfully |
      #| U3_CS_28 | Mayank | True   | Saved Successfully |
      #| U4_CS_28 | Chirag | True   | Saved Successfully |
      #| U5_CS_28 | Akshay | True   | Saved Successfully |
    #When Generate Report
      #| Module | Reports        | SelectUsers |
      #| User   | Access Profile | All         |
    #Then Verify sorting order of generated report
      #| userid   | name   |
      #| U1_CS_28 | Chhaya |
      #| U2_CS_28 | Nirali |
      #| U3_CS_28 | Mayank |
      #| U4_CS_28 | Chirag |
      #| U5_CS_28 | Akshay |
#
  #@CS-29
  #Scenario: Global Policy - Sorting Field In Report - User Name
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set Sorting Field In Report configuration in GP
      #| SortingField | Validation         |
      #| User Name    | Saved Successfully |
    #And Create user from user configuration
      #| userid   | name   | Active | Validation         |
      #| U1_CS_28 | Chhaya | True   | Saved Successfully |
      #| U2_CS_28 | Nirali | True   | Saved Successfully |
      #| U3_CS_28 | Mayank | True   | Saved Successfully |
      #| U4_CS_28 | Chirag | True   | Saved Successfully |
      #| U5_CS_28 | Akshay | True   | Saved Successfully |
    #When Generate Report
      #| Module | Reports        | SelectUsers |
      #| User   | Access Profile | All         |
    #Then Verify sorting order of generated report
      #| userid   | name   |
      #| U5_CS_28 | Akshay |
      #| U1_CS_28 | Chhaya |
      #| U4_CS_28 | Chirag |
      #| U3_CS_28 | Mayank |
      #| U2_CS_28 | Nirali |

  @CS-30
  Scenario: Global Policy - Report Export Output In PDF Only checkbox = Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set custom fields for "Users" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | False  | False     |
      | False  | PanCard     | Textbox | False  | False     |
      | False  | VotingCard  | Textbox | False  | False     |
      | False  | CitizenCard | Textbox | False  | False     |
      | False  | IDCard      | Textbox | False  | False     |
    And Delete System Account User "SA_CS_30" from System Accounts page
    And Set Reports parameters in GP
      | ReportExportOutputInPDFOnly |
      | True                        |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_30 | Ur_CS_30 |               1 |         1 |               1 |                  1 |
    And Create New System Account User
      | SAUser   | Role                 | Active | ValidationMessage        |
      | SA_CS_30 | System Administrator | True   | Saved Successfully |
    And Logout from Cosec Web
  And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | SA_CS_30 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_CS_30 | admin    | Welcome SA_CS_30 |
    When Generate "Contact Info" Report Export Output In PDF Only for Admin Module
      | SelectUsers |
      | All    |
    Then Verify file format of export report
      | ExportTo |

       @CS-31
  Scenario: Global Policy - Report Export Output In PDF Only checkbox = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_31" from System Accounts page
    And Set Reports parameters in GP
      | ReportExportOutputInPDFOnly |
      | false                        |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_31 | Ur_CS_31 |               1 |         1 |               1 |                  1 |
    And Create New System Account User
      | SAUser   | Role                 | Active | ValidationMessage         |
      | SA_CS_31 | System Administrator | True   | Saved Successfully |
    And Logout from Cosec Web
   And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | SA_CS_31 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_CS_31 | admin    | Welcome SA_CS_31 |
      When Generate "Contact Info" Report Export Output In PDF Only for Admin Module
      | SelectUsers |
      | All    |
    Then Verify file format of export report
      | ExportTo |
      | PDF,XLS,XLSX,DOCX      |

  @CS-32
  Scenario: Global Policy - Auto Generate Worker ID = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | Wrk_CS_32  |
    When Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_32 | Con_CS_32 |              10 |                |                |               |      3200 |             | True          |                  | Saved Successfully |
    Then WorkerID field Editable or not in Worker Profile page while add Worker
      | Editable |
      | True     |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | Validation         |
      | Wrk_CS_32 | Wrk_CS_32 | True   | Skill-1   | Con_CS_32      | Saved Successfully |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-33
  Scenario: Global Policy - Auto Generate Worker ID = Disable & Worker ID Range Check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | Wrk_CS_33  |
    And Delete WorkOrder via API
      | id       | contractorID | workerName |
      | WO_CS_33 | Con_CS_33    | Wrk_CS_33  |
    And Delete Contractor via API
      | id        |
      | Con_CS_33 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDRangePrefix | FromIDRange | ToIDRange |
      | False                | CWM           |           1 |   9999999 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_33 | Con_CS_33 |              10 |                |                |               |      3200 |             | True          |                  | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id       | Name     | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_CS_33 | WO_CS_33 |             0 |          10 | Con_CS_33                | Approval Stage-1  |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | Con_CS_33 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | Con_CS_33 | admin    | Welcome Con_CS_33 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Wrk_CS_33  |       1 | WO_CS_33    |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Induction Approval from CWM module
      | WorkOrderID | WorkerName | Approval | Validation         |
      | WO_CS_33    | Wrk_CS_33  | Approve  | Saved Successfully |
    And Logout from Cosec Web
    When Login with user
      | username  | password | Validation        |
      | Con_CS_33 | admin    | Welcome Con_CS_33 |
    Then Verify Worker Id from Worker Profile page in CSS login
      | WorkerId | name      |
      | CWM1     | Wrk_CS_33 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | SA       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-34
  Scenario: Global Policy - Auto Generate Worker ID = Enable & format = NUMVAL, Create worker from CWM
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | Wrk_CS_34  |
    When Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat    | NumValLength |
      | True                 | WRK*NUMVAL* |            1 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_34 | Con_CS_34 |              10 |                |                |               |      3200 |             | True          |                  | Saved Successfully |
    Then WorkerID field Editable or not in Worker Profile page while add Worker
      | Editable |
      | False    |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | Validation         |
      | Wrk_CS_34 | Wrk_CS_34 | True   | Skill-1   | Con_CS_34      | Saved Successfully |
    Then Verify Worker Id from Worker Profile page
      | WorkerId | name      |
      | WRK1     | Wrk_CS_34 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-35
  Scenario: Global Policy - Auto Generate Worker ID = Enable & format = NUMVAL, Create worker from CSS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | Wrk_CS_35  |
    And Delete WorkOrder via API
      | id       | contractorID | workerName |
      | WO_CS_35 | Con_CS_35    | Wrk_CS_35  |
    And Delete Contractor via API
      | id        |
      | Con_CS_35 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat       | NumValLength |
      | True                 | Worker*NUMVAL* |            1 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_35 | Con_CS_35 |              10 |                |                |               |      3500 |             | True          |                  | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id       | Name     | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_CS_35 | WO_CS_35 |             0 |          10 | Con_CS_35                | Approval Stage-1  |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | Con_CS_35 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | Con_CS_35 | admin    | Welcome Con_CS_35 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Wrk_CS_35  |       1 | WO_CS_35    |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Induction Approval from CWM module
      | WorkOrderID | WorkerName | Approval | Validation         |
      | WO_CS_35    | Wrk_CS_35  | Approve  | Saved Successfully |
    And Logout from Cosec Web
    When Login with user
      | username  | password | Validation        |
      | Con_CS_35 | admin    | Welcome Con_CS_35 |
    Then Verify Worker Id from Worker Profile page in CSS login
      | WorkerId | name      |
      | Worker1  | Wrk_CS_35 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | SA       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-36
  Scenario: Global Policy - Auto Generate Worker ID = Enable & format = ORGID**BRCCODE**NUMVAL, Create worker from CWM
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | Wrk_CS_36  |
    When Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat                    | NumValLength |
      | True                 | WRK*ORGID**BRCCODE**NUMVAL* |            1 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_36 | Con_CS_36 |              10 |                |                |               |      3600 |             | True          |                  | Saved Successfully |
    Then WorkerID field Editable or not in Worker Profile page while add Worker
      | Editable |
      | False    |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | Validation         |
      | Wrk_CS_36 | Wrk_CS_36 | True   | Skill-1   | Con_CS_36      | Saved Successfully |
    Then Verify Worker Id from Worker Profile page
      | WorkerId  | name      |
      | WRK1BRC11 | Wrk_CS_36 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-38
  Scenario: Global Policy - Auto Generate Worker ID = Enable & format = ORGCODE**BRCID**NUMVAL, Create worker from CWM
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | Wrk_CS_38  |
    When Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat                    | NumValLength |
      | True                 | WRK*ORGCODE**BRCID**NUMVAL* |            1 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_38 | Con_CS_38 |              10 |                |                |               |      3800 |             | True          |                  | Saved Successfully |
    Then WorkerID field Editable or not in Worker Profile page while add Worker
      | Editable |
      | False    |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | Validation         |
      | Wrk_CS_38 | Wrk_CS_38 | True   | Skill-1   | Con_CS_38      | Saved Successfully |
    Then Verify Worker Id from Worker Profile page
      | WorkerId  | name      |
      | WRKORG111 | Wrk_CS_38 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-39
  Scenario: Global Policy - Auto Generate Worker ID = Enable & NumValLength=1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | WorkerL1   |
      | WorkerL2   |
      | WorkerL3   |
      | WorkerL4   |
      | WorkerL5   |
      | WorkerL6   |
      | WorkerL7   |
      | WorkerL8   |
      | WorkerL9   |
      | WorkerL10  |
    When Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat       | NumValLength |
      | True                 | WrkLen*NUMVAL* |            1 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_39 | Con_CS_39 |              10 |                |                |               |      3900 |             | True          |                  | Saved Successfully |
    Then Create Worker from CWM module
      | WorkerId  | Active | SkillName | ContractorName | Validation                                           |
      | WorkerL1  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL2  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL3  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL4  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL5  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL6  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL7  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL8  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL9  | True   | Skill-1   | Con_CS_39      | Saved Successfully                                   |
      | WorkerL10 | True   | Skill-1   | Con_CS_39      | Maximum ID Creation limit reached for this ID Format |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-40
  Scenario: Global Policy - Auto Generate Worker ID = Enable & ZeroPadding=Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | WorkZero1  |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat       | NumValLength | ZeroPadding |
      | True                 | WrkZro*NUMVAL* |            3 | True        |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | Con_CS_40 | Con_CS_40 |              10 |                |                |               |      4000 |             | True          |                  | Saved Successfully |
    When Create Worker from CWM module
      | WorkerId  | Active | SkillName | ContractorName | Validation         |
      | WorkZero1 | True   | Skill-1   | Con_CS_40      | Saved Successfully |
    Then Verify Worker Id from Worker Profile page
      | WorkerId  | name      |
      | WrkZro001 | WorkZero1 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |

  @CS-42
  Scenario: Global Policy - Custom Fields for Contractors - Upload
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | LicenseNo | EnableAccount | Validation         |
      | Con_CS_42 | Con_CS_42 |              10 |      4200 | True          | Saved Successfully |
    When Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | True   | Adhar       | Textbox | True   | True      |
      | True   | PanCard     | Textbox | True   | True      |
      | True   | VotingCard  | Textbox | True   | True      |
      | True   | CitizenCard | Textbox | True   | True      |
      | True   | IDCard      | Textbox | True   | True      |
    Then Verify custom field of 'Con_CS_42' in Contractor Profile Page
      | FieldName   | Validate | Type    | Upload | Mandatory |
      | Adhar       | True     | Textbox | True   | True      |
      | PanCard     | True     | Textbox | True   | True      |
      | VotingCard  | True     | Textbox | True   | True      |
      | CitizenCard | True     | Textbox | True   | True      |
      | IDCard      | True     | Textbox | True   | True      |
    And Upload Contractor custom field documents from Contractor Profile Page
      | Id        | Adhar      | PanCard    | VotingCard | CitizenCard | IDCard     | Validation         |
      | Con_CS_42 | UploadFile | UploadFile | UploadFile | UploadFile  | UploadFile | Saved Successfully |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |

  @CS-43
  Scenario: Global Policy - Custom Fields for Contractors - verify
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | LicenseNo | EnableAccount | Validation         |
      | Con_CS_43 | Con_CS_43 |              10 |      4300 | True          | Saved Successfully |
    When Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type | Upload | Mandatory |
      | True   | Adhar       | Date | True   | True      |
      | True   | PanCard     | Date | True   | True      |
      | True   | VotingCard  | Date | True   | True      |
      | True   | CitizenCard | Date | True   | True      |
      | True   | IDCard      | Date | True   | True      |
    Then Verify custom field of 'Con_CS_43' in Contractor Profile Page
      | FieldName   | Validate | Type | Upload | Mandatory |
      | Adhar       | True     | Date | True   | True      |
      | PanCard     | True     | Date | True   | True      |
      | VotingCard  | True     | Date | True   | True      |
      | CitizenCard | True     | Date | True   | True      |
      | IDCard      | True     | Date | True   | True      |
    And Update Contractor custom fields from Contractor Profile
      | Id        | Adhar      | PanCard    | VotingCard | CitizenCard | IDCard     | Validation         |
      | Con_CS_43 | 01/01/2023 | 01/01/2023 | 01/01/2023 | 01/01/2023  | 01/01/2023 | Saved Successfully |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |

  @CS-44
  Scenario: Global Policy - Custom Fields for Contractors - verify false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | LicenseNo | EnableAccount | Validation         |
      | Con_CS_44 | Con_CS_44 |              10 |      4400 | True          | Saved Successfully |
    When Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | True   | Adhar       | Textbox | False  | False     |
      | True   | PanCard     | Textbox | False  | False     |
      | True   | VotingCard  | Textbox | False  | False     |
      | True   | CitizenCard | Textbox | False  | False     |
      | True   | IDCard      | Textbox | False  | False     |
    Then Verify custom field of 'Con_CS_44' in Contractor Profile Page
      | FieldName   | Validate | Type    | Upload | Mandatory |
      | Adhar       | True     | Textbox | False  | False     |
      | PanCard     | True     | Textbox | False  | False     |
      | VotingCard  | True     | Textbox | False  | False     |
      | CitizenCard | True     | Textbox | False  | False     |
      | IDCard      | True     | Textbox | False  | False     |
    And Create Contractor from CWM module
      | Id         | name       | ValidityEndDate | LicenseNo | EnableAccount | Validation         |
      | Con_CS_441 | Con_CS_441 |              10 |      4410 | True          | Saved Successfully |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |

  @CS-47
  Scenario Outline: Global Policy - Custom Fields for Contractors - disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | LicenseNo | EnableAccount | Validation         |
      | Con_CS_47 | Con_CS_47 |              10 |      4700 | True          | Saved Successfully |
    When Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
    Then Verify custom field of 'Con_CS_47' in Contractor Profile Page
      | FieldName   | Validate | Type    | Upload | Mandatory |
      | Adhar       | False    | Textbox | False  | False     |
      | PanCard     | False    | Textbox | False  | False     |
      | VotingCard  | False    | Textbox | False  | False     |
      | CitizenCard | False    | Textbox | False  | False     |
      | IDCard      | False    | Textbox | False  | False     |

  @CS-48
  Scenario: Global Policy - ESS - Special Functions Configuration - All True
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | True      |
      | False  | PanCard     | Textbox | True   | True      |
      | False  | VotingCard  | Textbox | True   | True      |
      | False  | CitizenCard | Textbox | True   | True      |
      | False  | IDCard      | Textbox | True   | True      |
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
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_48 | Ur_CS_48 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_48 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_48 | admin    | Welcome Ur_CS_48 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | True     |
      | Official IN     | True     |
      | Short Leave IN  | True     |
      | Break End       | True     |
      | Overtime IN     | True     |
      | Regular OUT     | True     |
      | Official OUT    | True     |
      | Short Leave OUT | True     |
      | Break Start     | True     |
      | Overtime OUT    | True     |

  @CS-491
  Scenario: Global Policy - ESS - Special Functions Configuration - All False
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
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
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_491 | Ur_CS_491 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | Ur_CS_491 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username  | password | Validation        |
      | Ur_CS_491 | admin    | Welcome Ur_CS_491 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-49
  Scenario: Global Policy - ESS - Special Functions Configuration - All True Punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
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
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_49 | Ur_CS_49 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_49 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_49 | admin    | Welcome Ur_CS_49 |
    Then Mark punch via ESS
      | SpecialFunction |
      | Regular IN      |
      | Official IN     |
      | Short Leave IN  |
      | Break End       |
      | Overtime IN     |
      | Regular OUT     |
      | Official OUT    |
      | Short Leave OUT |
      | Break Start     |
      | Overtime OUT    |

  @CS-50
  Scenario: Global Policy - ESS - Special Functions Configuration -Regular IN
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_50 | Ur_CS_50 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_50 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_50 | admin    | Welcome Ur_CS_50 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | True     |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-51
  Scenario: Global Policy - ESS - Special Functions Configuration - Official Work IN
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | True     |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_51 | Ur_CS_51 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_51 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_51 | admin    | Welcome Ur_CS_51 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | True     |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-52
  Scenario: Global Policy - ESS - Special Functions Configuration - Short Leave IN
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | True     |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_52 | Ur_CS_52 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_52 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_52 | admin    | Welcome Ur_CS_52 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | True     |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-53
  Scenario: Global Policy - ESS - Special Functions Configuration - Break End
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | True     |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_53 | Ur_CS_53 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_53 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_53 | admin    | Welcome Ur_CS_53 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | True     |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-54
  Scenario: Global Policy - ESS - Special Functions Configuration - Overtime IN
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | True     |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_54 | Ur_CS_54 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_54 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_54 | admin    | Welcome Ur_CS_54 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | True     |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-55
  Scenario: Global Policy - ESS - Special Functions Configuration - Regular OUT
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | True     |
      | Official Work OUT | False    |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_55 | Ur_CS_55 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_55 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_55 | admin    | Welcome Ur_CS_55 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | True     |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-56
  Scenario: Global Policy - ESS - Special Functions Configuration - Official Work OUT
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | True     |
      | Short Leave OUT   | False    |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_56 | Ur_CS_56 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_56 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_56 | admin    | Welcome Ur_CS_56 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | True     |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-57
  Scenario: Global Policy - ESS - Special Functions Configuration - Short Leave OUT
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | False    |
      | Official Work IN  | False    |
      | Short Leave IN    | False    |
      | Break End         | False    |
      | Overtime IN       | False    |
      | Regular OUT       | False    |
      | Official Work OUT | False    |
      | Short Leave OUT   | True     |
      | Break Start       | False    |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_57 | Ur_CS_57 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_57 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_57 | admin    | Welcome Ur_CS_57 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | True     |
      | Break Start     | False    |
      | Overtime OUT    | False    |

  @CS-58
  Scenario: Global Policy - ESS - Special Functions Configuration - Break Start
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
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
      | Break Start       | True     |
      | Overtime OUT      | False    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_58 | Ur_CS_58 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_58 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_58 | admin    | Welcome Ur_CS_58 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | True     |
      | Overtime OUT    | False    |

  @CS-59
  Scenario: Global Policy - ESS - Special Functions Configuration - Overtime OUT
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
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
      | Overtime OUT      | True     |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_59 | Ur_CS_59 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | Ur_CS_59 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | Ur_CS_59 | admin    | Welcome Ur_CS_59 |
    Then Vefiry options of IN and OUT at Mark Punch Field
      | SpecialFunction | Validate |
      | Regular IN      | False    |
      | Official IN     | False    |
      | Short Leave IN  | False    |
      | Break End       | False    |
      | Overtime IN     | False    |
      | Regular OUT     | False    |
      | Official OUT    | False    |
      | Short Leave OUT | False    |
      | Break Start     | False    |
      | Overtime OUT    | True     |
    And Logout from Cosec Web
      And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
      And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True    |
      | Official Work IN  | True    |
      | Short Leave IN    | True    |
      | Break End         | True    |
      | Overtime IN       | True    |
      | Regular OUT       | True    |
      | Official Work OUT | True    |
      | Short Leave OUT   | True    |
      | Break Start       | True    |
      | Overtime OUT      | True    |

  @CS-591
  Scenario: Task Scheduler - Database Backup
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Task scheduler "Database Backup"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime |
      | TS_CS_591     | Monthly     |                  0 |               0 |
    And Wait for "2" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_591     | Succeed |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_591     |

  @CS-60
  Scenario: Task Scheduler - Monthly Shift Schedule
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_60 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_60 | Ur_CS_60 |               1 |         1 |               1 |                  1 |
    When Create Task scheduler "Monthly Shift Schedule"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | ProcessingPeriod | SelectUsers | User     | Validation         |
      | TS_CS_60      | Monthly     |                  0 |               0 | Current          | User Wise   | Ur_CS_60 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_60      | Succeed |
    And Verify Shift is processed or not on Monthly Shift Schedule Page
      | User     | Processed |
      | Ur_CS_60 | True      |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_60      |

  @CS-61
  Scenario: Task Scheduler - Monthly Attendance Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_61 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_61 | Ur_CS_61 |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | Ur_CS_61 |
    When Create Task scheduler "Monthly Attendance Process"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | ProcessingPeriod | SelectUsers | User     | Validation         |
      | TS_CS_61      | Monthly     |                  0 |               0 | Current          | User Wise   | Ur_CS_61 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_61      | Succeed |
    And Verify Monthly process done or not in Attendance Summary Page
      | User     | Processed |
      | Ur_CS_61 | True      |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_61      |

  @CS-62
  Scenario: Task Scheduler - Leave Credit Schedule
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_62 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_62 | Ur_CS_62 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | T1      | PL_CS_62  | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LvCrdTaskSch" with Pro-rata "False"
      | LeaveID |
      | T1      |
    And Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup   | WeekOffGroup | Validation         |
      | Ur_CS_62 |                |                | LvCrdTaskSch |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | Ur_CS_62 |
    When Create Task scheduler "Leave Credit Schedule"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | MonthForYearlyCredit | ScheduleRunTime | CreditMethod | LeaveName | LeavePolicyName | NumberOfDays | NumberOfHours | ProcessingPeriod | SelectUsers | User     | Validation         |
      | TS_CS_62      | Monthly     |                  0 |                      |               0 | Fixed        | PL_CS_62  |                 |            2 |               | Current          | User Wise   | Ur_CS_62 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_62      | Succeed |
    And Verify Leave Balance in Leave Balance Page
      | UserID   | LeaveName | Period  | Month | Year | Credit |
      | Ur_CS_62 | PL_CS_62  | Monthly |     0 |    0 |   2.00 |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_62      |

  @CS-63
  Scenario: Task Scheduler - Relieving User Schedule & Process = De-activate User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_63 |
    And Create User via api
      | Id       | name     | joining-date | Leaving-date |
      | Ur_CS_63 | Ur_CS_63 |           -3 |           -1 |
    When Create Task scheduler "Relieving User Schedule"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | Process          | RevokeAssignedDevices | RunProcessFor | Validation         |
      | TS_CS_63      | Monthly     |                  0 |               0 | De-activate User | False                 | All Users     | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_63      | Succeed |
    And Verify User in User Configuration Page
      | UserID   | Status   |
      | Ur_CS_63 | Inactive |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_63      |

  @CS-64
  Scenario: Task Scheduler - Relieving User Schedule & Process = Delete User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_64 |
    And Create User via api
      | Id       | name     | Active | joining-date | Leaving-date |
      | Ur_CS_64 | Ur_CS_64 |      0 |           -3 |           -1 |
    When Create Task scheduler "Relieving User Schedule"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | Process     | RevokeAssignedDevices | RunProcessFor  | Validation         |
      | TS_CS_64      | Monthly     |                  0 |               0 | Delete User | False                 | Inactive Users | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_64      | Succeed |
    And Verify User in User Configuration Page
      | UserID   | Status        |
      | Ur_CS_64 | No Data Found |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_64      |

  @CS-65
  Scenario: Task Scheduler - Cafeteria Auto-Recharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_65 |
    And Create user from user configuration
      | userid   | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | CafeteriaEnable | AccountType | BalanceManagement | Validation         |
      | Ur_CS_65 | True   | True      | True      | True      | True      | True               | True            | Pre-Paid    | Server Based      | Saved Successfully |
    When Create Task scheduler "Cafeteria Auto-Recharge"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | RechargeAmount | SelectUsers | User     | Validation         |
      | TS_CS_65      | Monthly     |                  0 |               0 |            100 | User Wise   | Ur_CS_65 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_65      | Succeed |
    And Verify User Transaction Summary "Recharge" in Cafeteria Module
      | UserID   | OpeningBalance | RechargeAmount | ClosingBalance |
      | Ur_CS_65 |                |            100 |                |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_65      |

  @CS-66
  Scenario: Task Scheduler - Leave Balance Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_66 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | Ur_CS_66 | Ur_CS_66 |               1 |           |                 |                    |               |                |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | T2      | PL_CS_66  | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LvProcessTaskSch" with Pro-rata "False"
      | LeaveID |
      | T2      |
    And Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup       | WeekOffGroup | Validation         |
      | Ur_CS_66 |                |                | LvProcessTaskSch |              | Saved Successfully |
    When Create Task scheduler "Leave Balance Process"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | ProcessingPeriod | SelectUsers | User     | Validation         |
      | TS_CS_66      | Monthly     |                  0 |               0 | Current          | User Wise   | Ur_CS_66 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_66      | Succeed |
    And Verify Leave Balance in Leave Balance Page
      | UserID   | LeaveName | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | Ur_CS_66 | PL_CS_66  | Monthly |     0 |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_66      |

  @CS-67
  Scenario: Task Scheduler - Cafeteria Payment Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_67 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | Allow-ecanteen | account-type | max-allowed-limit |
      | Ur_CS_67 | Ur_CS_67 |               1 |         1 |               1 |                  1 |              1 |            1 |               500 |
    When Create Task scheduler "Cafeteria Payment Process"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | ProcessingPeriod | SelectUsers | User     | Validation         |
      | TS_CS_67      | Monthly     |                  0 |               0 | Current          | User Wise   | Ur_CS_67 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_67      | Succeed |
    And Verify User Transaction Summary "Payment" in Cafeteria Module
      | UserID   | OpeningBalance | AmountPaid | ClosingBalance |
      | Ur_CS_67 |              0 |          0 |              0 |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_67      |

  @CS-70
  Scenario: Task Scheduler - Visitor Pass Surrender
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_70 |
    And Delete visitor via API
      | mobilenumber |
      |        70111 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | authorized-host-user |
      | Ur_CS_70 | Ur_CS_70 |                 |           |                 |                    |               |                |                    1 |
    And create visitor profile via API
      | id       | name     | active |
      | VP_CS_70 | VP_CS_70 |      1 |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email           | host-id  | appliedBy |visit-station-name |
      |         0 |          0 |                0 |                1 |              2 | V_CS_70      | Matrix            |     70111 | VCS70@gmail.com | Ur_CS_70 | SA        |Default Location   |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID   |
      |         0 |            0 | SA        |         0 |       0 | Ur_CS_70 |
    When Create Task scheduler "Visitor Pass Surrender"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | DurationAfterPassExpiry | Validation         |
      | TS_CS_70      | Monthly     |                  0 |               4 | 00:01                   | Saved Successfully |
    And Wait for "4" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_70      | Succeed |
    And Verify visit state via Visitor Preregistration API
      | StartDate | EndDate | HostID   | ExpectedVisitState |
      |         0 |       0 | Ur_CS_70 | Check-OUT          |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_70      |

  @CS-71
  Scenario: Task Scheduler - Continuous Presence Check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_71 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | Ur_CS_71 | Ur_CS_71 |               1 |           |                 |                    |               |                |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | Ur_CS_71 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | Ur_CS_71 |
    And Set event via Event Set API
      | Userid   | event-date | event-time |
      | Ur_CS_71 |          0 |     090000 |
      | Ur_CS_71 |          0 |     180000 |
    When Create Task scheduler "Continuous Presence Check"
      | SchedulerName | CheckForDays | ScheduleRunTime | ProcessingPeriod | ConsiderHalfDayPRAsFullDayPR | Days  | SelectUsers | User     | SelectShift   | Validation         |
      | TS_CS_71      |            1 |               0 | Current          | True                         | False | User Wise   | Ur_CS_71 | General Shift | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_71      | Succeed |
    Then Verify User in User Configuration Page
      | UserID   | AccessValidity | AccessValidityDate |
      | Ur_CS_71 | True           |                  0 |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_71      |

  @CS-72
  Scenario: Task Scheduler - Continuous Absence Check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | Ur_CS_72 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | Ur_CS_72 | Ur_CS_72 |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | Ur_CS_72 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | Ur_CS_72 |
    When Create Task scheduler "Continuous Absence Check"
      | SchedulerName | CheckForDays | ScheduleRunTime | ProcessingPeriod | ConsiderHalfDayPRAsFullDayPR | Days | SelectUsers | User     | SelectShift   | Validation         |
      | TS_CS_72      |            1 |               0 | Current          | True                         | True | User Wise   | Ur_CS_72 | General Shift | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_72      | Succeed |
    And Verify User in User Configuration Page
      | UserID   | Status   |
      | Ur_CS_72 | Inactive |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_72      |

  @CS-68
  Scenario: Task Scheduler - Validity / Expiry Date Checking & Process = De-activate User
    Given change system date from current date to "-3".
    And Delete user via API
      | UserID   |
      | Ur_CS_68 |
    And Create User via api
      | Id       | name     | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | Ur_CS_68 | Ur_CS_68 |           -3 |               |    6811 |           2 |            6812 |                      2 |        6813 |               1 |
    Given change system date from current date to "3".
    And Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Task scheduler "Validity / Expiry Date Checking"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | Visa | Driving License | Passport | Process          | RevokeAssignedDevices | Validation         |
      | TS_CS_68      | Monthly     |                  0 |               0 | True | True            | True     | De-activate User | False                 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_68      | Succeed |
    And Verify User in User Configuration Page
      | UserID   | Status   |
      | Ur_CS_68 | Inactive |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_68      |

  @CS-69
  Scenario: Task Scheduler - Validity / Expiry Date Checking & Process = Delete User
    Given change system date from current date to "-3".
    And Delete user via API
      | UserID   |
      | Ur_CS_69 |
    And Create User via api
      | Id       | name     | Active | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | Ur_CS_69 | Ur_CS_69 |      0 |           -3 |               |    6969 |           2 |            6969 |                      2 |        6969 |               1 |
    Given change system date from current date to "3".
    And Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create Task scheduler "Validity / Expiry Date Checking"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime | Visa | Driving License | Passport | Process     | RunProcessFor  | RevokeAssignedDevices | Validation         |
      | TS_CS_69      | Monthly     |                  0 |               0 | True | True            | True     | Delete User | Inactive Users | False                 | Saved Successfully |
    And Wait for "1" min
    Then Verify Task Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | TS_CS_69      | Succeed |
    And Verify User in User Configuration Page
      | UserID   | Status        |
      | Ur_CS_69 | No Data Found |
    And Delete Task Scheduler
      | SchedulerName |
      | TS_CS_69      |

  @CS-141
  Scenario Outline: Message Board = General for ESS Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Write Message "<Message>" and subject "<Subject>" on "<TabName>" tab on Message board in Admin Module
    And Delete user via API
      | UserID |
      | U1     |
    And Create User via api
      | Id | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | U1 | U1   |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | U1     |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation |
      | U1       | admin    | Welcome U1 |
    Then Verify Message "<Message>" by clicking on tab "<TabName>" shown on the scrolling information from the bottom of home page

    Examples: 
      | TabName | Message              | Subject              |
      | General | Test Message - Hello | Test subject-General |
      | News    | Test Message - Hello | Test subject-News    |
      | Notice  | Test Message - Hello | Test subject-Notice  |

  @CS-142
  Scenario Outline: Message Board = General for CSS Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Write Message "<Message>" and subject "<Subject>" on "<TabName>" tab on Message board in Admin Module
    And Delete Contractor via API
      | id |
      | C1 |
    And Create Contractor from CWM module
      | Id | name | ValidityEndDate | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | C1 | C1   |              10 |      1234 | lic1        | True          | True             | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | C1   | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation |
      | C1       | admin    | Welcome C1 |
    Then Verify Message "<Message>" by clicking on tab "<TabName>" shown on the scrolling information from the bottom of home page

    Examples: 
      | TabName | Message              | Subject              |
      | General | Test Message - Hello | Test subject-General |
      | News    | Test Message - Hello | Test subject-News    |
      | Notice  | Test Message - Hello | Test subject-Notice  |

  @CS-143
  Scenario Outline: Change Group Name and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName | RenameAs      | Validation         |
      | <Group>   | <RenameGroup> | Saved Successfully |
    Then Verify group name of import data in import data page
      | RenamedGroup  |
      | <RenameGroup> |
    And Verify field name of Group in user configuration
      | RenamedGroup  |
      | <RenameGroup> |
    And Verify Page name in Enterprise Module
      | RenamedGroup  |
      | <RenameGroup> |
    And Rename Group from Admin Module
      | GroupName     | RenameAs | Validation         |
      | <RenameGroup> | <Group>  | Saved Successfully |

    Examples: 
      | Group          | RenameGroup |
      | Organization   | ORG         |
      | Branch         | BRC         |
      | Department     | DEPT        |
      | Section        | SEC         |
      | Category       | CTGR        |
      | Grade          | GRD         |
      | Designation    | DSGN        |
      | Custom Group 1 | CG1         |
      | Custom Group 2 | CG2         |
      | Custom Group 3 | CG3         |

  @CS-144
  Scenario: Change User Name and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | User      | USR      | Saved Successfully |
    Then Verify group name of import data in import data page
      | RenamedGroup |
      | USR          |
    And Verify Page name in "Users" module
      | RenamedPage       |
      | USR List          |
      | USR Configuration |
    And Verify field name in Manage Shifts page
      | FieldName |
      | USR       |
    And Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | USR       | User     | Saved Successfully |

  @CS-145
  Scenario: Change Worker Name and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | Worker    | WRK      | Saved Successfully |
    Then Verify group name of import data in import data page
      | RenamedGroup |
      | WRK          |
    And Verify Page name in "CWM" module
      | RenamedPage    |
      | WRK List       |
      | WRK Profile    |
      | WRK Assignment |
    And Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | WRK       | Worker   | Saved Successfully |

  @CS-146
  Scenario: Change Work Order and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName  | RenameAs | Validation         |
      | Work Order | WRKORD   | Saved Successfully |
    Then Verify group name of import data in import data page
      | RenamedGroup |
      | WRKORD       |
    And Verify Page name in "CWM" module
      | RenamedPage  |
      | WRKORD       |
      | WRKORD Types |
      | WRKORD List  |
    And Rename Group from Admin Module
      | GroupName | RenameAs   | Validation         |
      | WRKORD    | Work Order | Saved Successfully |

  @CS-147
  Scenario: Change Contractor and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName  | RenameAs | Validation         |
      | Contractor | CON      | Saved Successfully |
    Then Verify group name of import data in import data page
      | RenamedGroup |
      | CON          |
    And Verify Page name in "CWM" module
      | RenamedPage |
      | CON         |
      | CON Types   |
      | CON Profile |
    And Rename Group from Admin Module
      | GroupName | RenameAs   | Validation         |
      | CON       | Contractor | Saved Successfully |

  @CS-148
  Scenario: Change Cost Centre and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName   | RenameAs | Validation         |
      | Cost Centre | COSTCNTR | Saved Successfully |
    Then Verify Page name in "JPC" module
      | RenamedPage |
      | COSTCNTR    |
    And Verify dropdown value "COSTCNTR" on User Job Details Page
    And Verify Field name "COSTCNTR" on Job Page
    And Rename Group from Admin Module
      | GroupName | RenameAs    | Validation         |
      | COSTCNTR  | Cost Centre | Saved Successfully |

  @CS-149
  Scenario: Change Project and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | Project   | PRJ      | Saved Successfully |
    Then Verify Page name in "JPC" module
      | RenamedPage    |
      | PRJ Management |
      | PRJ            |
    And Verify Field name "PRJ" on Project Summary report Page
    And Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | PRJ       | Project  | Saved Successfully |

  @CS-150
  Scenario: Change Phase and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | Phase     | PHS      | Saved Successfully |
    Then Verify Page name in "JPC" module
      | RenamedPage |
      | PHS         |
    And Verify Field name "PHS" on Phase Summary report Page
    And Verify Tab Header "PHS" on Project Page
    And Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | PHS       | Phase    | Saved Successfully |

  @CS-151
  Scenario: Change Job and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | Job       | JB       | Saved Successfully |
    Then Verify Page name in "JPC" module
      | RenamedPage |
      | JB          |
      | JB Group    |
    And Verify Field name "JB Costing" on User configuration page
    And Rename Group from Admin Module
      | GroupName | RenameAs | Validation         |
      | JB        | Job      | Saved Successfully |

  @CS-152
  Scenario: Change Quick Links and verify its reflection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Rename Group from Admin Module
      | GroupName   | RenameAs | Validation         |
      | Quick Links | QL       | Saved Successfully |
    Then Verify Header "QL"
      | ModuleName           |
      | Admin                |
      | Users                |
      | Enterprise Structure |
    And Rename Group from Admin Module
      | GroupName | RenameAs    | Validation         |
      | QL        | Quick Links | Saved Successfully |

  @CS_153
  Scenario Outline: Import Data for Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group        | Name     | Validation           |
      | Organization | Org_Imp1 | Deleted Successfully |
      | Organization | Org_Imp2 | Deleted Successfully |
    When Import Data "Organization"
      | ID | CODE   | NAME     |
      | 51 | ORIMP1 | Org_Imp1 |
      | 52 | ORIMP2 | Org_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Organization"
      | CODE   | Result  |
      | ORIMP1 | Success |
      | ORIMP2 | Success |
    And Verify "Organization" from Enterprise Module
      | NAME     |
      | Org_Imp1 |
      | Org_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_154
  Scenario Outline: Import Data for Branch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group  | Name     | Validation           |
      | Branch | Brc_Imp1 | Deleted Successfully |
      | Branch | Brc_Imp2 | Deleted Successfully |
    When Import Data "Branch"
      | ID | CODE   | NAME     |
      | 55 | BRIMP1 | Brc_Imp1 |
      | 56 | BRIMP2 | Brc_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Branch"
      | CODE   | Result  |
      | BRIMP1 | Success |
      | BRIMP2 | Success |
    And Verify "Branch" from Enterprise Module
      | NAME     |
      | Brc_Imp1 |
      | Brc_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_155
  Scenario Outline: Import Data for Department
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group      | Name     | Validation           |
      | Department | Dep_Imp1 | Deleted Successfully |
      | Department | Dep_Imp2 | Deleted Successfully |
    When Import Data "Department"
      | ID | CODE   | NAME     |
      | 59 | DPIMP1 | Dep_Imp1 |
      | 60 | DPIMP2 | Dep_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Department"
      | CODE   | Result  |
      | DPIMP1 | Success |
      | DPIMP2 | Success |
    And Verify "Department" from Enterprise Module
      | NAME     |
      | Dep_Imp1 |
      | Dep_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_156
  Scenario Outline: Import Data for Section
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group   | Name     | Validation           |
      | Section | Sec_Imp1 | Deleted Successfully |
      | Section | Sec_Imp2 | Deleted Successfully |
    When Import Data "Section"
      | ID | CODE   | NAME     |
      | 63 | SEIMP1 | Sec_Imp1 |
      | 64 | SEIMP2 | Sec_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Section"
      | CODE   | Result  |
      | SEIMP1 | Success |
      | SEIMP2 | Success |
    And Verify "Section" from Enterprise Module
      | NAME     |
      | Sec_Imp1 |
      | Sec_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_157
  Scenario Outline: Import Data for Category
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group    | Name      | Validation           |
      | Category | Ctgr_Imp1 | Deleted Successfully |
      | Category | Ctgr_Imp2 | Deleted Successfully |
    When Import Data "Category"
      | ID | CODE   | NAME      |
      | 67 | CTIMP1 | Ctgr_Imp1 |
      | 68 | CTIMP2 | Ctgr_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Category"
      | CODE   | Result  |
      | CTIMP1 | Success |
      | CTIMP2 | Success |
    And Verify "Category" from Enterprise Module
      | NAME      |
      | Ctgr_Imp1 |
      | Ctgr_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_158
  Scenario Outline: Import Data for Grade
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group | Name     | Validation           |
      | Grade | Grd_Imp1 | Deleted Successfully |
      | Grade | Grd_Imp2 | Deleted Successfully |
    When Import Data "Grade"
      | ID | CODE   | NAME     |
      | 71 | GDIMP1 | Grd_Imp1 |
      | 72 | GDIMP2 | Grd_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Grade"
      | CODE   | Result  |
      | GDIMP1 | Success |
      | GDIMP2 | Success |
    And Verify "Grade" from Enterprise Module
      | NAME     |
      | Grd_Imp1 |
      | Grd_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_159
  Scenario Outline: Import Data for Designation
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group       | Name     | Validation           |
      | Designation | Des_Imp1 | Deleted Successfully |
      | Designation | Des_Imp2 | Deleted Successfully |
    When Import Data "Designation"
      | ID | CODE   | NAME     |
      | 75 | DSIMP1 | Des_Imp1 |
      | 76 | DSIMP2 | Des_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Designation"
      | CODE   | Result  |
      | DSIMP1 | Success |
      | DSIMP2 | Success |
    And Verify "Designation" from Enterprise Module
      | NAME     |
      | Des_Imp1 |
      | Des_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_160
  Scenario Outline: Import Data for Custom Group 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group          | Name     | Validation           |
      | Custom Group 1 | CG1_Imp1 | Deleted Successfully |
      | Custom Group 1 | CG1_Imp2 | Deleted Successfully |
    When Import Data "Custom Group 1"
      | ID | CODE   | NAME     |
      | 79 | C1IMP1 | CG1_Imp1 |
      | 80 | C1IMP2 | CG1_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Custom Group 1"
      | CODE   | Result  |
      | C1IMP1 | Success |
      | C1IMP2 | Success |
    And Verify "Custom Group 1" from Enterprise Module
      | NAME     |
      | CG1_Imp1 |
      | CG1_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_161
  Scenario Outline: Import Data for Custom Group 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group          | Name     | Validation           |
      | Custom Group 2 | CG2_Imp1 | Deleted Successfully |
      | Custom Group 2 | CG2_Imp2 | Deleted Successfully |
    When Import Data "Custom Group 2"
      | ID | CODE   | NAME     |
      | 83 | C2IMP1 | CG2_Imp1 |
      | 84 | C2IMP2 | CG2_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Custom Group 2"
      | CODE   | Result  |
      | C2IMP1 | Success |
      | C2IMP2 | Success |
    And Verify "Custom Group 2" from Enterprise Module
      | NAME     |
      | CG2_Imp1 |
      | CG2_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_162
  Scenario Outline: Import Data for Custom Group 3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group          | Name     | Validation           |
      | Custom Group 3 | CG3_Imp1 | Deleted Successfully |
      | Custom Group 3 | CG3_Imp2 | Deleted Successfully |
    When Import Data "Custom Group 3"
      | ID | CODE   | NAME     |
      | 87 | C3IMP1 | CG3_Imp1 |
      | 88 | C3IMP2 | CG3_Imp2 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Custom Group 3"
      | CODE   | Result  |
      | C3IMP1 | Success |
      | C3IMP2 | Success |
    And Verify "Custom Group 3" from Enterprise Module
      | NAME     |
      | CG3_Imp1 |
      | CG3_Imp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_163
  Scenario Outline: Import Data for Devices
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Device via API
      | device-type | device-id |
      |           9 |        51 |
      |          21 |        52 |
      |          20 |        53 |
    When Import Data "Devices"
      | Device Type | DeviceID | Device Name | MAC Address       | SiteID |
      |           9 |       51 | VEGA1       | 00:1B:00:DD:00:DD | Site-1 |
      |          21 |       52 | ARGOFace1   | 00:1A:00:CC:00:CC | Site-1 |
      |          20 |       53 | ARGODEVICE  | 00:1C:00:CC:00:EE | Site-1 |
    And Import "<File Format>" from Admin Module and check Imported Data for "Devices"
      | Device Name | Result  |
      | VEGA1       | Success |
      | ARGOFace1   | Success |
      | ARGODEVICE  | Success |
    Then Verify Device from Device Configuration page
      | DeviceId |
      |       51 |
      |       52 |
      |       53 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_164
  Scenario Outline: Import Data for Contractors
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Contractor via API
      | id           |
      | AM_Contr1IMP |
      | AM_Contr2IMP |
      | AM_Contr3IMP |
    When Import Data "Contractors"
      | ID           | Name      | TypeID            | ValidityEnd | License  |
      | AM_Contr1IMP | AM_Contr1 | Contractor Type-1 |          10 | License1 |
      | AM_Contr2IMP | AM_Contr2 | Contractor Type-1 |          15 | License2 |
      | AM_Contr3IMP | AM_Contr3 | Contractor Type-1 |          15 | License3 |
    And Import "<File Format>" from Admin Module and check Imported Data for "Contractors"
      | ID           | Result  |
      | AM_Contr1IMP | Success |
      | AM_Contr2IMP | Success |
      | AM_Contr3IMP | Success |
    Then Verify Contractor from Contractor Profile page
      | ID           |
      | AM_Contr1IMP |
      | AM_Contr2IMP |
      | AM_Contr3IMP |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_165
  Scenario Outline: Import Data for Work Orders
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete WorkOrder via API
      | id         | contractorID | workerName |
      | AM_WrkOrd1 | AM_Contr4    |            |
      | AM_WrkOrd2 | AM_Contr4    |            |
      | AM_WrkOrd3 | AM_Contr4    |            |
    And Delete Contractor via API
      | id        |
      | AM_Contr4 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1      | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | AM_Contr4 | AM_Contr4 |               3 | AM_Contr44     |     6200000021 | AMContr4@gmail.com |      6200 | Lic1        | True          | True             | Saved Successfully |
    When Import Data "Work Orders"
      | ID         | Name       | Type              | ValidityStart | ValidityEnd | ContractorID | ApprovalStageID  | WorkerLimit | OrgID | BranchID | DepartmentID | WorkerLimitCheck |
      | AM_WrkOrd1 | AM_WrkOrd1 | Work Order Type-1 |             1 |           2 | AM_Contr4    | Approval Stage-1 |          10 | ORG1  | BRC1     | DPT1         |                1 |
      | AM_WrkOrd2 | AM_WrkOrd1 | Work Order Type-1 |             1 |           2 | AM_Contr4    | Approval Stage-1 |           5 | ORG1  | BRC1     | DPT1         |                1 |
      | AM_WrkOrd3 | AM_WrkOrd1 | Work Order Type-1 |             1 |           3 | AM_Contr4    | Approval Stage-1 |          15 | ORG1  | BRC1     | DPT1         |                1 |
    And Import "<File Format>" from Admin Module and check Imported Data for "Work Orders"
      | ID         | Result  |
      | AM_WrkOrd1 | Success |
      | AM_WrkOrd2 | Success |
      | AM_WrkOrd3 | Success |
    Then Verify Work Order from Work Order page
      | ID         |
      | AM_WrkOrd1 |
      | AM_WrkOrd2 |
      | AM_WrkOrd3 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_166
  Scenario Outline: Import Data for Reporting Group
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AM_RIC1Imp |
      | AM_RIC2Imp |
    And Delete Reporting Group
      | GroupName |
      | AM_RGImpMM1 |
      | AM_RGImpMM2 |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | AM_RIC1Imp | AM_RIC1Imp |               1 |         1 |               1 |                  1 |    9898981241 | INUSER@gmail.com |
      | AM_RIC2Imp | AM_RIC2Imp |               1 |         1 |               1 |                  1 |    9898981232 | INUSER@gmail.com |
    When Import Data "Reporting Group"
      | ID | Name      | InCharge1ID | ApprovalPolicyID |
      | 51 | AM_RGImpMM1 | AM_RIC1Imp  | AnyOne           |
      | 52 | AM_RGImpMM2 | AM_RIC2Imp  | AnyOne           |
    And Import "<File Format>" from Admin Module and check Imported Data for "Reporting Group"
      | Name      | Result  |
      | AM_RGImpMM1 | Success |
      | AM_RGImpMM2 | Success |
    Then Verify Reporting Group from Reporting Group page
      | GroupName |
      | AM_RGImpMM1 |
      | AM_RGImpMM2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @CS_167
  Scenario Outline: Import Data for Location Master
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Import Data "Location Master"
      | Location Code | Name           | Type | BLE Name | Mode |
      | AMLC1         | AM_LocMstrImp1 |    3 | ABC      |    0 |
      | AMLC2         | AM_LocMstrImp2 |    3 | EFG      |    0 |
    And Import "<File Format>" from Admin Module and check Imported Data for "Location Master"
      | Name           | Result  |
      | AM_LocMstrImp1 | Success |
      | AM_LocMstrImp2 | Success |
    Then Verify Location from Location Master page
      | Name           |
      | AM_LocMstrImp1 |
      | AM_LocMstrImp2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |
      
  ###################V20R09_CSR-2670 Stroy Start##########    
  #CSR_5196
  #CSR-6110
  @CSR2670_1
  Scenario Outline: Set Launch Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "MLS_SA1" from System Accounts page
    And Create New System Account User
      | SAUser  | Role                 | Module   | Menu   | ValidationMessage  |
      | MLS_SA1 | System Administrator | <Module> | <Menu> | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | MLS_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | MLS_SA1  | admin    | Welcome MLS_SA1 |
    Then Verify Launch Page should be "<Menu>"

    Examples: 
      | Module | Menu                            |
      | Admin  | System Default Data Translation |
      | Admin  | Multi-Language Settings         |

  #CSR_5196
  #CSR-6110
  @CSR2670_2
  Scenario Outline: Roles&Rights - for View Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "MLS_SA1" from System Accounts page
    And Delete Role and Right "MLS_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Menu   | View | Add | Edit  | Delete | Validation         |
      | MLS_Role1 | <Module> | <Menu> | true |     | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | MLS_SA1 | MLS_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | MLS_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | MLS_SA1  | admin    | Welcome MLS_SA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add | Edit  | Delete |
      | <Menu> | true |     | false | false  |

    Examples: 
      | Module | Menu                            |
      | Admin  | Multi-Language Settings         |
      | Admin  | System Default Data Translation |


  
  
  #CSR_5196
  #CSR-6110
  @CSR2670_5
  Scenario Outline: Roles&Rights - for View Disable - No Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "MLS_SA1" from System Accounts page
    And Delete Role and Right "MLS_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Menu   | View  | Add   | Edit  | Delete | Validation         |
      | MLS_Role1 | <Module> | <Menu> | false | false | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | MLS_SA1 | MLS_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | MLS_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | MLS_SA1  | admin    | Welcome MLS_SA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View  | Add   | Edit  | Delete |
      | <Menu> | false | false | false | false  |

    Examples: 
      | Module | Menu                            |
      | Admin  | Multi-Language Settings         |
      | Admin  | System Default Data Translation |


     

 #CSR_5196
  #CSR-6110
  @CSR2670_7
  Scenario Outline: Roles&Rights - Default rights check SE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Make "SE" user Active= "true"
      And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | se   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation              |
      | se       | admin    | Welcome System Engineer |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |

		 
    Examples: 
      | Module | Menu                            |
      | Admin  | Multi-Language Settings         |
      | Admin  | System Default Data Translation |
      
 	#CSR_5196
  #CSR-6110
  @CSR2670_8
  Scenario Outline: Roles&Rights - Default rights check SO
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
		And Make "SO" user Active= "true"
		And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | so   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation              |
      | so       | admin    | Welcome System Operator |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |


    Examples: 
      | Module | Menu                            |
      | Admin  | Multi-Language Settings         |
      | Admin  | System Default Data Translation |

  #CSR_5196
  #CSR-6110
  @CSR2670_9
  Scenario Outline: Roles&Rights - Module rights - Hide module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "MLS_SA1" from System Accounts page
    And Delete Role and Right "MLS_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Hide | Validation         |
      | MLS_Role1 | <Module> | true | Saved Successfully |
    And Verify Role rights for RoleName= "MLS_Role1" "<Module>"
      | Menu                            | View  | Add | Edit  | Delete | Validation         |
      | Multi-Language Settings         | false |     | false |        | Saved Successfully |
      | System Default Data Translation | false |     | false |        | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | MLS_SA1 | MLS_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | MLS_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | MLS_SA1  | admin    | Welcome MLS_SA1 |
    Then Verify "<Module>" Module is displayed or Not - "false"

    Examples: 
      | Module |
      | Admin  |

  #CSR-5196
  #CSR-6110
  @CSR2670_10
  Scenario Outline: Roles&Rights - Module rights - View
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "MLS_SA1" from System Accounts page
    And Delete Role and Right "MLS_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Hide  | View | Validation         |
      | MLS_Role1 | <Module> | false | true | Saved Successfully |
    And Verify Role rights for RoleName= "MLS_Role1" "<Module>"
      | Menu                            | View | Add | Edit  | Delete | Validation         |
      | Multi-Language Settings         | true |     | false |        | Saved Successfully |
      | System Default Data Translation | true |     | false |        | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | MLS_SA1 | MLS_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | MLS_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | MLS_SA1  | admin    | Welcome MLS_SA1 |
    And Open "Multi-Language Settings" Page in "<Module>" Module
    Then verify Page rights
      | Menu                    | View | Add | Edit  | Delete |
      | Multi-Language Settings | true |     | false | false  |
    And Open "System Default Data Translation" Page in "<Module>" Module
    Then verify Page rights
      | Menu                            | View | Add | Edit  | Delete |
      | System Default Data Translation | true |     | false | false  |

    Examples: 
      | Module |
      | Admin  |
      
       ###################V20R09_CSR-2670 Stroy Start End##########  


      
