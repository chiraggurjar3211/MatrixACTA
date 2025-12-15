@tag
Feature: Title of your feature

  @DailyAtdView1
  Scenario: Template Configuartion  in Daily Attendence View in T&A Module by giving the template to all users. Validate in ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | kam1   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | kam1 | kam1 |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | kam1   |   01012024 |     090000 |
      | kam1   |   01012024 |     180000 |
      | kam1   |   02012024 |     090000 |
      | kam1   |   03012024 |     180000 |
      | kam1   |   04012024 |     140000 |
      | kam1   |   04012024 |     180000 |
    When Create Template "kamal1" in Daily Attendance View.
      | Field Type | Field Value     | Display Name    |
      | Database   | Error           | Remark          |
      | Database   | 1st Half Status | 1st Half Status |
      | Database   | Attendance Date | Attendance Date |
      | Custom     | ~Work Dur-HHMM~ | TotalHours      |
    And field configuration in "kamal1" template in Daily Attendance View.
      | Field           | View/Export | Display Summary |
      | Attendance Date | true        | true            |
      | Date            | true        | true            |
      | Remark          | true        | true            |
      | 1st Half Status | true        | true            |
      | TotalHours      | true        | true            |
    And User Selection in "kamal1" template in Daily Attendance View.
      | Select Users | Select Group | user or group |
      | All          |              |               |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam1     | admin    | Welcome kam1 |
    And Validate and select default the template in ESS
      | Name   | default | Validate  |
      | kamal1 | true    | Displayed |
    Then Daily Attendance View for period "Month" on "January" and "2024" in ESS
      | Date       | Remark              | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                     | PR              | 01/01/2024      | 08:00      |
      | 02/01/2024 | Punches Not In Pair | IN              | 02/01/2024      |            |
      | 03/01/2024 | Punches Not In Pair | AB              | 03/01/2024      |            |
      | 04/01/2024 | AB:Late-IN          | AB              | 04/01/2024      | 04:00      |
      | 07/01/2024 |                     | WO              | 07/01/2024      |            |

  @DailyAtdView2
  Scenario: Template Configuartion  in Daily Attendence View in T&A Module by giving the template to all users. Validate in SA user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | kam1   |
    And Delete System Account User "Temp_1" from System Accounts page
    And Create New System Account User
      | SAUser | ValidationMessage  |
      | Temp_1 | Saved Successfully |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | kam1 | kam1 |               1 |         1 |               1 |                  1 |               |                |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | kam1   |   01012024 |     090000 |
      | kam1   |   01012024 |     180000 |
      | kam1   |   02012024 |     090000 |
      | kam1   |   03012024 |     180000 |
      | kam1   |   04012024 |     140000 |
      | kam1   |   04012024 |     180000 |
    When Create Template "kam_12" in Daily Attendance View.
      | Field Type | Field Value     | Display Name    |
      | Database   | Error           | Remark          |
      | Database   | 1st Half Status | 1st Half Status |
      | Database   | Attendance Date | Attendance Date |
      | Custom     | ~Work Dur-HHMM~ | TotalHours      |
    And field configuration in "kam_12" template in Daily Attendance View.
      | Field           | View/Export | Display Summary |
      | Remark          | true        | true            |
      | 1st Half Status | true        | false           |
      | Attendance Date | true        | false           |
      | TotalHours      | true        | false           |
    And User Selection in "kam_12" template in Daily Attendance View.
      | Select Users | Select Group | user or group |
      | All          |              |               |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | Temp_1 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | Temp_1   | admin    | Welcome Temp_1 |
    And Validate and select default the template in System Account User
      | Name   | default | Validate  |
      | kam_12 | true    | Displayed |
    Then Daily Attendance View for userid "kam1" and period "Month" on "January" and "2024"
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                      | PR              | 01/01/2024      | 08:00      |
      | 02/01/2024 | Punches Not In Pair  | IN              | 02/01/2024      |            |
      | 03/01/2024 | Punches Not In Pair  | AB              | 03/01/2024      |            |
      | 04/01/2024 | AB:Late-IN           | AB              | 04/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |

  @DailyAtdView3
  Scenario: Template Configuartion  in Daily Attendence View in T&A Module by giving the template to specific user. Validate in ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | kam1 | kam1 |               1 |         1 |               1 |                  1 |
      | kam2 | kam2 |               1 |         1 |               1 |                  1 |
      | kam3 | kam3 |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | kam1   |   01012024 |     090000 |
      | kam1   |   01012024 |     180000 |
      | kam1   |   04012024 |     140000 |
      | kam1   |   04012024 |     180000 |
      | kam1   |   11012024 |     090000 |
      | kam1   |   11012024 |     130000 |
      | kam2   |   01012024 |     090000 |
      | kam2   |   01012024 |     130000 |
      | kam2   |   04012024 |     140000 |
      | kam2   |   04012024 |     180000 |
      | kam2   |   11012024 |     090000 |
      | kam2   |   11012024 |     180000 |
      | kam3   |   01012024 |     140000 |
      | kam3   |   01012024 |     180000 |
      | kam3   |   04012024 |     090000 |
      | kam3   |   04012024 |     130000 |
      | kam3   |   11012024 |     090000 |
      | kam3   |   11012024 |     180000 |
    When Create Template "kam_22" in Daily Attendance View.
      | Field Type | Field Value     | Display Name    |
      | Database   | Error           | Remark          |
      | Database   | 1st Half Status | 1st Half Status |
      | Database   | Attendance Date | Attendance Date |
      | Custom     | ~Work Dur-HHMM~ | TotalHours      |
    And field configuration in "kam_22" template in Daily Attendance View.
      | Field           | View/Export | Display Summary |
      | Attendance Date | true        | false           |
      | Date            | true        | false           |
      | Remark          | true        | false           |
      | 1st Half Status | true        | false           |
      | TotalHours      | true        | true            |
    And User Selection in "kam_22" template in Daily Attendance View.
      | Select Users | Select Group | user or group |
      | User Wise    |              | kam1,kam2     |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam1     | admin    | Welcome kam1 |
    And Validate and select default the template in ESS
      | Name   | default | Validate  |
      | kam_22 | true    | Displayed |
    Then Daily Attendance View for period "Month" on "January" and "2024" in ESS
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                      | PR              | 01/01/2024      | 08:00      |
      | 04/01/2024 | AB:Late-IN           | AB              | 04/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
      | 11/01/2024 | AB:Early-OUT         | PR              | 11/01/2024      | 04:00      |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam2   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam2     | admin    | Welcome kam2 |
    And Validate and select default the template in ESS
      | Name   | default | Validate  |
      | kam_22 | true    | Displayed |
    Then Daily Attendance View for period "Month" on "January" and "2024" in ESS
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 | AB:Early-OUT         | PR              | 01/01/2024      | 04:00      |
      | 04/01/2024 | AB:Late-IN           | AB              | 04/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
      | 11/01/2024 |                      | PR              | 11/01/2024      | 08:00      |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam3   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam3     | admin    | Welcome kam3 |
    And Validate and select default the template in ESS
      | Name   | default | Validate      |
      | kam_22 | false   | Not Displayed |




@DailyAtdView4
  Scenario: Template Configuartion  in Daily Attendence View in T&A Module by giving the template to specific user. Validate in SA user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | kam1   |
      | kam2   |
    And Delete System Account User "Temp_1" from System Accounts page
    And Create New System Account User
      | SAUser  | Role | ValidationMessage  |
      | Temp_1 | System Administrator | Saved Successfully |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | kam1 | kam1 |               1 |         1 |               1 |                  1 |               |                |
      | kam2 | kam2 |               1 |         1 |               1 |                  1 |               |                |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | kam1   |   01012024 |     090000 |
      | kam1   |   01012024 |     180000 |
      | kam1   |   04012024 |     140000 |
      | kam1   |   04012024 |     180000 |
      | kam1   |   11012024 |     090000 |
      | kam1   |   11012024 |     130000 |
      | kam2   |   01012024 |     090000 |
      | kam2   |   01012024 |     130000 |
      | kam2   |   04012024 |     140000 |
      | kam2   |   04012024 |     180000 |
      | kam2   |   11012024 |     090000 |
      | kam2   |   11012024 |     180000 |
    When Create Template "kam_32" in Daily Attendance View.
      | Field Type | Field Value     | Display Name    |
      | Database   | Error           | Remark          |
      | Database   | 1st Half Status | 1st Half Status |
      | Database   | Attendance Date | Attendance Date |
      | Custom     | ~Work Dur-HHMM~ | TotalHours      |
    And field configuration in "kam_32" template in Daily Attendance View.
      | Field           | View/Export | Display Summary |
      | Attendance Date | true        | false           |
      | Date            | true        | false           |
      | Remark          | true        | false           |
      | 1st Half Status | true        | false           |
      | TotalHours      | true        | true            |
    And User Selection in "kam_32" template in Daily Attendance View.
      | Select Users | Select Group | user or group |
      | User Wise    |              | kam1,kam2     |
     And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | Temp_1 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | Temp_1   | admin    | Welcome Temp_1 |
    And Validate and select default the template in System Account User
      | Name   | default | Validate  |
      | kam_32 | true    | Displayed |
    Then Daily Attendance View for userid "kam1" and period "Month" on "January" and "2024"
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                      | PR              | 01/01/2024      | 08:00      |
      | 04/01/2024 | AB:Late-IN           | AB              | 04/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
      | 11/01/2024 | AB:Early-OUT         | PR              | 11/01/2024      | 04:00      |
    And Daily Attendance View for userid "kam2" and period "Month" on "January" and "2024"
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 | AB:Early-OUT         | PR              | 01/01/2024      | 04:00      |
      | 04/01/2024 | AB:Late-IN           | AB              | 04/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
      | 11/01/2024 |                      | PR              | 11/01/2024      | 08:00      |

  @DailyAtdView5
  Scenario: Template Configuartion  in Daily Attendence View in T&A Module by giving the template to specific Organization. Validate in ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Enterprise group from Enterprise module
      | Group        | Name      | Validation           |
      | Organization | Tab_Temp1 | Deleted Successfully |
      | Organization | Tab_Temp2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name      | Code   | Validation         |
      | Organization | Tab_Temp1 | Tab_T1 | Saved Successfully |
      | Organization | Tab_Temp2 | Tab_T2 | Saved Successfully |
    And Delete user via API
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
      | kam4   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | kam1 | kam1 |               1 |         1 |               1 |                  1 |
      | kam2 | kam2 |               1 |         1 |               1 |                  1 |
      | kam3 | kam3 |               1 |         1 |               1 |                  1 |
      | kam4 | kam4 |               1 |         1 |               1 |                  1 |
    And Assign groups to user from user configuration
      | UserID | Organization | Branch | Department | Section | Category | Grade | Designation | Custom Group 1 | Custom Group 2 | Custom Group 3 | Validation         |
      | kam1   | Tab_Temp1    |        |            |         |          |       |             |                |                |                | Saved Successfully |
      | kam2   | Tab_Temp1    |        |            |         |          |       |             |                |                |                | Saved Successfully |
      | kam3   | Tab_Temp2    |        |            |         |          |       |             |                |                |                | Saved Successfully |
      | kam4   | Tab_Temp2    |        |            |         |          |       |             |                |                |                | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
      | kam4   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
      | kam2   |
      | kam3   |
      | kam4   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | kam1   |   01012024 |     090000 |
      | kam1   |   01012024 |     180000 |
      | kam1   |   02012024 |     090000 |
      | kam1   |   02012024 |     140000 |
      | kam2   |   01012024 |     090000 |
      | kam2   |   01012024 |     180000 |
      | kam2   |   02012024 |     130000 |
      | kam2   |   02012024 |     180000 |
    When Create Template "kam_42" in Daily Attendance View.
      | Field Type | Field Value     | Display Name    |
      | Database   | Error           | Remark          |
      | Database   | 1st Half Status | 1st Half Status |
      | Database   | Attendance Date | Attendance Date |
      | Custom     | ~Work Dur-HHMM~ | TotalHours      |
    And field configuration in "kam_42" template in Daily Attendance View.
      | Field           | View/Export | Display Summary |
      | Attendance Date | true        | false           |
      | Date            | true        | false           |
      | Remark          | true        | false           |
      | 1st Half Status | true        | false           |
      | TotalHours      | true        | true            |
    And User Selection in "kam_42" template in Daily Attendance View.
      | Select Users | Select Group | user or group |
      | Group Wise   | Organization | Tab_Temp1     |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam1     | admin    | Welcome kam1 |
    And Validate and select default the template in ESS
      | Name   | default | Validate  |
      | kam_42 | true    | Displayed |
    Then Daily Attendance View for period "Month" on "January" and "2024" in ESS
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                      | PR              | 01/01/2024      | 08:00      |
      | 02/01/2024 |  AB:Early-OUT      | PR              | 02/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam2   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam2     | admin    | Welcome kam2 |
    And Validate and select default the template in ESS
      | Name   | default | Validate  |
      | kam_42 | true    | Displayed |
    Then Daily Attendance View for period "Month" on "January" and "2024" in ESS
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                      | PR              | 01/01/2024      | 08:00      |
      | 02/01/2024 |  AB:Late-IN         | AB              | 02/01/2024      | 04:00      |
      | 05/01/2024 | No Punches Available | AB              | 05/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam3   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam3     | admin    | Welcome kam3 |
    And Validate and select default the template in ESS
      | Name   | default | Validate      |
      | kam_42 | false   | Not Displayed |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam4   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam4     | admin    | Welcome kam4 |
    And Validate and select default the template in ESS
      | Name   | default | Validate      |
      | kam_42 | false   | Not Displayed |

  @DailyAtdView6
  Scenario: Template Configuartion  in Daily Attendence View in T&A Module by giving the template to selected user. Validate in ESS the export button
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | kam1   |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | kam1 | kam1 |               1 |         1 |               1 |                  1 |               |                |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | kam1   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | kam1   |   01012024 |     090000 |
      | kam1   |   01012024 |     180000 |
      | kam1   |   02012024 |     090000 |
      | kam1   |   02012024 |     130000 |
    When Create Template "kam_52" in Daily Attendance View.
      | Field Type | Field Value     | Display Name    |
      | Database   | Error           | Remark          |
      | Database   | 1st Half Status | 1st Half Status |
      | Database   | Attendance Date | Attendance Date |
      | Custom     | ~Work Dur-HHMM~ | TotalHours      |
    And field configuration in "kam_52" template in Daily Attendance View.
      | Field           | View/Export | Display Summary |
      | Attendance Date | true        | false           |
      | Date            | true        | false           |
      | Remark          | true        | false           |
      | 1st Half Status | true        | false           |
      | TotalHours      | true        | true            |
    And User Selection in "kam_52" template in Daily Attendance View.
      | Select Users | Select Group | user or group |
      | User Wise    |              | kam1          |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | kam1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | kam1     | admin    | Welcome kam1 |
    And Validate and select default the template in ESS
      | Name   | default | Validate  |
      | kam_52 | true    | Displayed |
    Then Daily Attendance View for period "Month" on "January" and "2024" in ESS
      | Date       | Remark               | 1st Half Status | Attendance Date | TotalHours |
      | 01/01/2024 |                      | PR              | 01/01/2024      | 08:00      |
      | 02/01/2024 | AB:Early-OUT         | PR              | 02/01/2024      | 04:00      |
      | 06/01/2024 | No Punches Available | AB              | 06/01/2024      |            |
      | 07/01/2024 |                      | WO              | 07/01/2024      |            |
    And Daily Attendance View export report for period "Month" on "January" and "2024" in ESS
      | ExportReportFormat |
      | CSV                |
      | XLS                |
    Then Validate exported file from UI selection.
      | FileName        | FileFormat | Compare  |
      | DailyAttendance | XLS        | Compared |
      | DailyAttendance | CSV        | Compared |
