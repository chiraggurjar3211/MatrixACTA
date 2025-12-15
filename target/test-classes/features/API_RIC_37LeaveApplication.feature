@API_LvAppl
Feature: 37-Leave-Application - 5 Level RIC
  I want to use this template for my feature file

  @API_LvAppl_AnyOne_1
  Scenario: API_LvAppl_AnyOne Auth Mode behaviour of Any One Approval Policy with 5 RIC C1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 134" to "scenario 648" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 134" to "Scenario 648" result "Pass".

  @API_LvAppl_AnyOne_2
  Scenario: API_LvAppl_AnyOne Auth Mode behaviour of Any One Approval Policy with 5 RIC C2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 649" to "scenario 1247" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 649" to "Scenario 1247" result "Pass".

  @API_LvAppl_AnyOne_3
  Scenario: API_LvAppl_AnyOne RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 1248" to "scenario 1489" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 1248" to "Scenario 1489" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 1490" to "scenario 1672" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 1490" to "Scenario 1672" result "Pass".

  @API_LvAppl_AnyOne_4
  Scenario: API_LvAppl_AnyOne RIC selection changed in Approval Policy page, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 1673" to "scenario 1920" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 1673" to "Scenario 1920" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 1921" to "scenario 2159" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 1921" to "Scenario 2159" result "Pass".

  @API_LvAppl_AnyOne_5
  Scenario: API_LvAppl_AnyOne RIC selection changed in Approval Policy page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 2160" to "scenario 2407" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 2160" to "Scenario 2407" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 2408" to "scenario 2646" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 2408" to "Scenario 2646" result "Pass".

  @API_LvAppl_AnyOne_6
  Scenario: API_LvAppl_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 2647" to "scenario 2944" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 2647" to "Scenario 2944" result "Pass".
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 2945" to "scenario 3239" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 2945" to "Scenario 3239" result "Pass".

  @API_LvAppl_AnyOne_7
  Scenario: API_LvAppl_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 3240" to "scenario 3543" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 3240" to "Scenario 3543" result "Pass".
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 3544" to "scenario 3838" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 3544" to "Scenario 3838" result "Pass".

  @API_LvAppl_AnyOne_8
  Scenario: API_LvAppl_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 3839" to "scenario 4142" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 3839" to "Scenario 4142" result "Pass".
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 4143" to "scenario 4437" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 4143" to "Scenario 4437" result "Pass".

  @API_LvAppl_AnyOne_9
  Scenario: API_LvAppl_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 4438" to "scenario 4735" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 4438" to "Scenario 4735" result "Pass".
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 4736" to "scenario 4806" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 4736" to "Scenario 4806" result "Pass".

  @API_LvAppl_AnyOne_10
  Scenario: API_LvAppl_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 4807" to "scenario 5110" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 4807" to "Scenario 5110" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 5111" to "scenario 5405" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 5111" to "Scenario 5405" result "Pass".

  @API_LvAppl_AnyOne_11
  Scenario: API_LvAppl_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 5406" to "scenario 5709" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 5406" to "Scenario 5709" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 5710" to "scenario 6004" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 5710" to "Scenario 6004" result "Pass".

  @API_LvAppl_AnyOne_12
  Scenario: API_LvAppl_AnyOne Authorization Mode All Sequencial in Approval Policy page Reporting Group RIC < Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 6005" to "scenario 6190" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6005" to "Scenario 6190" result "Pass".

  @API_LvAppl_AnyOne_13
  Scenario: API_LvAppl_AnyOne Authorization Mode All Sequencial in Approval Policy page Reporting Group RIC > Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 6191" to "scenario 6264" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6191" to "Scenario 6264" result "Pass".

  @API_LvAppl_AnyOne_14
  Scenario: API_LvAppl_AnyOne Authorization Mode All in Approval Policy page Reporting Group RIC < Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 6265" to "scenario 6450" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6265" to "Scenario 6450" result "Pass".

  @API_LvAppl_AnyOne_15
  Scenario: API_LvAppl_AnyOne Authorization Mode All in Approval Policy page Reporting Group RIC > Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 6451" to "scenario 6636" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6451" to "Scenario 6636" result "Pass".

  @API_LvAppl_AnyOne_16
  Scenario: API_LvAppl_AnyOne RIC changed in Reporting Group page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 6637" to "scenario 6766" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6637" to "Scenario 6766" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 6767" to "scenario 6893" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6767" to "Scenario 6893" result "Pass".

  @API_LvAppl_AnyOne_17
  Scenario: API_LvAppl_AnyOne RIC changed in Reporting Group page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 6894" to "scenario 7029" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 6894" to "Scenario 7029" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 7030" to "scenario 7103" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7030" to "Scenario 7103" result "Pass".

  @API_LvAppl_AnyOne_18
  Scenario: API_LvAppl_AnyOne RIC changed in Reporting Group page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 7104" to "scenario 7239" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7160" to "Scenario 7295" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 7240" to "scenario 7313" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7240" to "Scenario 7313" result "Pass".

  @API_LvAppl_AnyOne_19
  Scenario: API_LvAppl_AnyOne RIC Group Add, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 7314" to "scenario 7381" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7314" to "Scenario 7381" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 7382" to "scenario 7499" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7382" to "Scenario 7499" result "Pass".

  @API_LvAppl_AnyOne_20
  Scenario: API_LvAppl_AnyOne RIC Group Add, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 7500" to "scenario 7573" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7500" to "Scenario 7573" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 7574" to "scenario 7638" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7574" to "Scenario 7638" result "Pass".

  @API_LvAppl_AnyOne_21
  Scenario: API_LvAppl_AnyOne RIC Group Add, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 7639" to "scenario 7712" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7639" to "Scenario 7712" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 7713" to "scenario 7777" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7713" to "Scenario 7777" result "Pass".

  @API_LvAppl_AnyOne_22
  Scenario: API_LvAppl_AnyOne RIC Group Remove, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 7778" to "scenario 7898" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7778" to "Scenario 7898" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 7899" to "scenario 7963" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7899" to "Scenario 7963" result "Pass".

  @API_LvAppl_AnyOne_23
  Scenario: API_LvAppl_AnyOne RIC Group Remove, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 7964" to "scenario 8090" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 7964" to "Scenario 8090" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 8091" to "scenario 8155" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 8091" to "Scenario 8155" result "Pass".

  @API_LvAppl_AnyOne_24
  Scenario: API_LvAppl_AnyOne RIC Group Remove, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 8156" to "scenario 8282" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 8156" to "Scenario 8282" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 8283" to "scenario 8347" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 8283" to "Scenario 8347" result "Pass".

  @API_LvAppl_All_25
  Scenario: API_LvAppl_All Auth Mode behaviour of All Approval Policy with 5 RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 8348" to "scenario 9687" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 8348" to "Scenario 9687" result "Pass".

  @API_LvAppl_All_26
  Scenario: API_LvAppl_All RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 9688" to "scenario 9929" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 9688" to "Scenario 9929" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 9930" to "scenario 10112" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 9930" to "Scenario 10112" result "Pass".

  @API_LvAppl_All_27
  Scenario: API_LvAppl_All RIC selection changed in Approval Policy page, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 10113" to "scenario 10360" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10113" to "Scenario 10360" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 10361" to "scenario 10419" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10361" to "Scenario 10419" result "Pass".

  @API_LvAppl_All_28
  Scenario: API_LvAppl_All RIC selection changed in Approval Policy page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 10420" to "scenario 10667" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10420" to "Scenario 10667" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 10668" to "scenario 10726" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10668" to "Scenario 10726" result "Pass".

  @API_LvAppl_All_29
  Scenario: API_LvAppl_All Authorization Mode gets changed from All to All Sequencial in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 1    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 10727" to "scenario 10788" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10727" to "Scenario 10788" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 10789" to "scenario 10859" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10789" to "Scenario 10859" result "Pass".

  @API_LvAppl_All_30
  Scenario: API_LvAppl_All Authorization Mode gets changed from All to All Sequencial in Approval Policy page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 1    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 10860" to "scenario 10927" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10860" to "Scenario 10927" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 10928" to "scenario 10986" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10928" to "Scenario 10986" result "Pass".

  @API_LvAppl_All_31
  Scenario: API_LvAppl_All Authorization Mode gets changed from All to All Sequencial in Approval Policy page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 1    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 10987" to "scenario 11054" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 10987" to "Scenario 11054" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 11055" to "scenario 11113" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11055" to "Scenario 11113" result "Pass".

  @API_LvAppl_All_32
  Scenario: API_LvAppl_All RIC changed in Reporting Group page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 11114" to "scenario 11234" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11114" to "Scenario 11234" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 11235" to "scenario 11358" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11235" to "Scenario 11358" result "Pass".

  @API_LvAppl_All_33
  Scenario: API_LvAppl_All RIC changed in Reporting Group page, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 11359" to "scenario 11485" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11359" to "Scenario 11485" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 11486" to "scenario 11556" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11486" to "Scenario 11556" result "Pass".

  @API_LvAppl_All_34
  Scenario: API_LvAppl_All RIC changed in Reporting Group page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 11557" to "scenario 11683" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11557" to "Scenario 11683" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 11684" to "scenario 11754" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11684" to "Scenario 11754" result "Pass".

  @API_LvAppl_All_35
  Scenario: API_LvAppl_All RIC Group Add, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 11755" to "scenario 11822" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11755" to "Scenario 11822" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 11823" to "scenario 11940" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11823" to "Scenario 11940" result "Pass".

  @API_LvAppl_All_36
  Scenario: API_LvAppl_All RIC Group Add, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 11941" to "scenario 12014" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 11941" to "Scenario 12014" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 12015" to "scenario 12079" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 12015" to "Scenario 12079" result "Pass".

  @API_LvAppl_All_37
  Scenario: API_LvAppl_All RIC Group Add, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 12080" to "scenario 12153" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 12080" to "Scenario 12153" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 12154" to "scenario 12218" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 12154" to "Scenario 12218" result "Pass".

  @API_LvAppl_AllSequential_38
  Scenario: API_LvAppl_AllSequential Auth Mode behaviour of All Sequential Approval Policy with 5 RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 12219" to "scenario 13379" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 12219" to "Scenario 13379" result "Pass".

  @API_LvAppl_AllSequential_39
  Scenario: API_LvAppl_AllSequential RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 13380" to "scenario 13453" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13380" to "Scenario 13453" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 13454" to "scenario 13524" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13454" to "Scenario 13524" result "Pass".

  @API_LvAppl_AllSequential_40
  Scenario: API_LvAppl_AllSequential RIC selection changed in Approval Policy page, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 13525" to "scenario 13614" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13525" to "Scenario 13614" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 13615" to "scenario 13685" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13615" to "Scenario 13685" result "Pass".

  @API_LvAppl_AllSequential_41
  Scenario: API_LvAppl_AllSequential RIC selection changed in Approval Policy page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 13686" to "scenario 13775" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13686" to "Scenario 13775" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 13776" to "scenario 13846" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13776" to "Scenario 13846" result "Pass".

  @API_LvAppl_AllSequential_42
  Scenario: API_LvAppl_AllSequential RIC changed in Reporting Group page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 13847" to "scenario 13917" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13847" to "Scenario 13917" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 13918" to "scenario 13985" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13918" to "Scenario 13985" result "Pass".

  @API_LvAppl_AllSequential_43
  Scenario: API_LvAppl_AllSequential RIC changed in Reporting Group page, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 13986" to "scenario 14065" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 13986" to "Scenario 14065" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 14066" to "scenario 14136" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14066" to "Scenario 14136" result "Pass".

  @API_LvAppl_AllSequential_44
  Scenario: API_LvAppl_AllSequential RIC changed in Reporting Group page, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14137" to "scenario 14216" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14137" to "Scenario 14216" result "Pass".
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR3       | APILVR4       |               |               |               |
    When Execute scenario start from "scenario 14217" to "scenario 14287" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14217" to "Scenario 14287" result "Pass".

  @API_LvAppl_AllSequential_45
  Scenario: API_LvAppl_AllSequential RIC Group Add, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14288" to "scenario 14355" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14288" to "Scenario 14355" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 14356" to "scenario 14417" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14356" to "Scenario 14417" result "Pass".

  @API_LvAppl_AllSequential_46
  Scenario: API_LvAppl_AllSequential RIC Group Add, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14418" to "scenario 14491" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14418" to "Scenario 14491" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 14492" to "scenario 14556" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14492" to "Scenario 14556" result "Pass".

  @API_LvAppl_AllSequential_47
  Scenario: API_LvAppl_AllSequential RIC Group Add, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       |                |                | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14557" to "scenario 14630" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14557" to "Scenario 14630" result "Pass".
    And Create user from user configuration
      | userid | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 | APILV1         | APILV1         | Saved Successfully |
    When Execute scenario start from "scenario 14631" to "scenario 14695" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14631" to "Scenario 14695" result "Pass".

  @API_LvAppl_AllSequential_48
  Scenario: API_LvAppl_AllSequential RIC Group Remove, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14696" to "scenario 14760" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14696" to "Scenario 14760" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 14761" to "scenario 14825" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14761" to "Scenario 14825" result "Pass".

  @API_LvAppl_AllSequential_49
  Scenario: API_LvAppl_AllSequential RIC Group Remove, status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14826" to "scenario 14899" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14826" to "Scenario 14899" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 14900" to "scenario 14958" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14900" to "Scenario 14958" result "Pass".

  @API_LvAppl_AllSequential_50
  Scenario: API_LvAppl_AllSequential RIC Group Remove, status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       |            |            |            | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       |               |               |               |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 14959" to "scenario 15032" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 14959" to "Scenario 15032" result "Pass".
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | Validation         |
      | APILV1 |                |                | Saved Successfully |
    When Execute scenario start from "scenario 15033" to "scenario 15091" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15033" to "Scenario 15091" result "Pass".

  @API_LvAppl_AllSequential_51
  Scenario: API_LvAppl_AllSequential All policy Exception Case 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave        | 1B 1B       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 15092" to "scenario 15333" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15092" to "Scenario 15333" result "Pass".

  @API_LvAppl_AllSequential_52
  Scenario: API_LvAppl_AllSequential All policy Exception Case 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 15334" to "scenario 15519" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15334" to "Scenario 15519" result "Pass".

  @API_LvAppl_AllSequential_53
  Scenario: API_LvAppl_AllSequential All policy Exception Case 3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 15520" to "scenario 15593" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15520" to "Scenario 15593" result "Pass".

  @API_LvAppl_AllSequential_54
  Scenario: API_LvAppl_AllSequential All policy Exception Case 4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 15594" to "scenario 15779" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15594" to "Scenario 15779" result "Pass".

  @API_LvAppl_AllSequential_55
  Scenario: API_LvAppl_AllSequential All policy Exception Case 5
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Paid Leave        | 1B 1B       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 15780" to "scenario 15965" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15780" to "Scenario 15965" result "Pass".

  @API_LvAppl_AllSequential_56
  Scenario: API_LvAppl_AllSequential All policy Exception Case 6
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 15966" to "scenario 16039" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 15966" to "Scenario 16039" result "Pass".

  @API_LvAppl_AllSequential_57
  Scenario: API_LvAppl_AllSequential All policy Exception Case 7
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 16040" to "scenario 16225" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 16040" to "Scenario 16225" result "Pass".

  @API_LvAppl_AllSequential_58
  Scenario: API_LvAppl_AllSequential All policy Exception Case 8
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Paid Leave        | 1B 1B       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 16226" to "scenario 16411" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 16226" to "Scenario 16411" result "Pass".

  @API_LvAppl_AllSequential_59
  Scenario: API_LvAppl_AllSequential All policy Exception Case 9
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 16412" to "scenario 16485" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 16412" to "Scenario 16485" result "Pass".

  @API_LvAppl_AllSequential_60
  Scenario: API_LvAppl_AllSequential All policy Exception Case 10
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APILV1     | All               | true       | true       | False      | False      | False      | In-Charge 1    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                  |
      | Paid Leave        | 1B 1B       | Duration         |         2 |       4 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Tour/ON Duty Tour | 1D 1D       | Duration         |         2 |       4 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
      | Hourly Paid Leave | 1C 1C       | Duration         | 01:00     | 03:00   | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 16486" to "scenario 16674" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 16486" to "Scenario 16674" result "Pass".

  @API_LvAppl_AllSequential_61
  Scenario: API_LvAppl_AllSequential All policy Exception Case 11
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APILV1  |
      | APILVR1 |
      | APILVR2 |
      | APILVR3 |
      | APILVR4 |
      | APILVR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APILV1    |
    And Delete Approval policy from user module
      | Name   |
      | APILV1 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APILVR1 | APILVR1 |               1 |         1 |               1 |                  1 |
      | APILVR2 | APILVR2 |               1 |         1 |               1 |                  1 |
      | APILVR3 | APILVR3 |               1 |         1 |               1 |                  1 |
      | APILVR4 | APILVR4 |               1 |         1 |               1 |                  1 |
      | APILVR5 | APILVR5 |               1 |         1 |               1 |                  1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | 1B      | 1B        | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | 1C      | 1C        | Hourly Paid Leave |               |             | Single App     | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | 1D     | 1D       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "1BCD" with Pro-rata "False"
      | LeaveID |
      | 1B      |
      | 1C      |
      | 1D      |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APILV1     | All Sequential    | true       | true       | true       | False      | False      | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APILV1"
      | ApplicationType   | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge      | FinalIn-Charge |
      | Paid Leave        | 1B 1B       | Duration         |         2 |       4 | All               | In-Charge 1,In-Charge 2 | In-Charge 1    |
      | Tour/ON Duty Tour | 1D 1D       | Duration         |         2 |       4 | All               | In-Charge 1,In-Charge 2 | In-Charge 1    |
      | Hourly Paid Leave | 1C 1C       | Duration         | 01:00     | 03:00   | All               | In-Charge 1,In-Charge 2 | In-Charge 1    |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APILV1  | APILV1               | APILVR1       | APILVR2       | APILVR3       | APILVR4       | APILVR5       |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | LeaveGroup | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APILV1 |                        2 | True      | 1BCD       | APILV1         | APILV1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APILV1  |                          1 | admin        |    1 |
      | APILVR1 |                          1 | admin        |    1 |
      | APILVR2 |                          1 | admin        |    1 |
      | APILVR3 |                          1 | admin        |    1 |
      | APILVR4 |                          1 | admin        |    1 |
      | APILVR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APILV1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APILV1 |          0 |           0 |                 |                 |   10 |          |                | 1B         |        |       |      |          | credit |        |
      | APILV1 |          0 |           0 |                 |                 |      |          |                | 1C         |        |       |      |          | credit | 100:00 |
    When Execute scenario start from "scenario 16675" to "scenario 16863" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "Scenario 16675" to "Scenario 16863" result "Pass".
